########################################################################
# This example demonstrates a cable
# Copyright (C) Upinder S. Bhalla NCBS 2018
# Released under the terms of the GNU Public License V3.
########################################################################
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from matplotlib.widgets import Slider, Button
import numpy as np
import warnings
import moose
import rdesigneur as rd

numDendSeg = 10 # Applies both to dend and to branches.
interval1 = 0.020
interval2 = 0.020
lines = []
tplot = []
axes = []
sliders = []

RM = 1.0
RA = 1.0
CM = 0.01
length = 0.0005
dia = 2e-6
runtime = 0.05
elecPlotDt = 0.0005

rec = []

# Stimulus in Amps applied to soma.
stimStr = "2e-10"

class lineWrapper():
    def __init__( self ):
        self.YdendLines = 0
        self.Ybranch1Lines = 0
        self.Ybranch2Lines = 0


class RecInfo():
    def __init__(self, name, tau1 = 2e-3, inputFreq = 1.0, Ek = 0.0 ):
        self.name = name
        self.Gbar = 20.0
        self.tau1 = tau1
        self.tau2 = 9e-3
        self.Ek = Ek   # Reversal potential
        self.inputTime = 0.0
        self.inputFreq = inputFreq
        self.inputDuration = 0.001
    
    def setGbar( self, val ):
        self.Gbar = val
        updateDisplay()

    def setInputTime( self, val ):
        self.inputTime = val
        updateDisplay()
        

def makeYmodel():
    segLen = length / numDendSeg
    rdes = rd.rdesigneur(
        elecPlotDt = elecPlotDt,
        stealCellFromLibrary = True,
        verbose = False,
        chanProto = [['make_glu()', 'glu'],['make_GABA()', 'GABA']],
        # cellProto syntax: ['ballAndStick', 'name', somaDia, somaLength, dendDia, dendLength, numDendSegments ]
        # The numerical arguments are all optional
        cellProto = 
            [['ballAndStick', 'cellBase', dia, segLen, dia, length, numDendSeg]],
        passiveDistrib = [[ '#', 'RM', str(RM), 'CM', str(CM), 'RA', str(RA) ]],
        chanDistrib = [
            ['glu', 'dend9', 'Gbar', str(rec[0].Gbar)],
            ['glu', 'branch1_9', 'Gbar', str(rec[1].Gbar)],
            ['glu', 'branch2_9', 'Gbar', str(rec[2].Gbar)],
            ['GABA', 'dend9', 'Gbar', str(rec[3].Gbar)],
            ['GABA', 'branch1_9', 'Gbar', str(rec[4].Gbar)],
            ['GABA', 'branch2_9', 'Gbar', str(rec[5].Gbar)],
        ],
        stimList = [
            #['dend9', '1','glu', 'periodicsyn', '1*(t>0.1 && t<0.2)'],
            #['branch1_9', '1','glu', 'periodicsyn', '1*(t>0.1 && t<0.2)'],
            #['branch2_9', '1','glu', 'periodicsyn', '1*(t>0.1 && t<0.2)'],
            ['dend9,branch1_9,branch2_9', '1','glu', 'periodicsyn', '100*(t>0.01 && t<0.02)'],
        ],
        plotList = [
            ['soma,dend9,branch1_9,branch2_9', '1','.', 'Vm'],
        ],
    )
    # Modify some library values
    gaba = moose.element( '/library/GABA' )
    gaba.tau1 = rec[3].tau1
    gaba.tau2 = rec[3].tau2
    gaba.Ek = rec[3].Ek
    # Build the arms of the Y for a branching cell.
    pa = moose.element( '/library/cellBase' )
    x = length
    y = 0.0
    dx = length / ( numDendSeg * np.sqrt(2.0) )
    dy = 0.0
    prevc1 = moose.element( '/library/cellBase/dend{}'.format( numDendSeg-1 ) )
    prevc2 = prevc1
    for i in range( numDendSeg ):
        c1 = rd.buildCompt( pa, 'branch1_{}'.format(i), RM = RM, CM = CM, RA = RA, dia = dia*0.63, x=x, y=y, dx = dx, dy = dy )
        c2 = rd.buildCompt( pa, 'branch2_{}'.format(i), RM = RM, CM = CM, RA = RA, dia = dia*0.63, x=x, y=-y, dx = dx, dy = -dy )
        moose.connect( prevc1, 'axial', c1, 'raxial' )
        moose.connect( prevc2, 'axial', c2, 'raxial' )
        prevc1 = c1
        prevc2 = c2
        x += dx
        y += dy
    rdes.elecid.buildSegmentTree() # rebuild it as we've added the branches

    rdes.buildModel()
    # Tap the stimulus for glu to also go to GABA
    moose.connect( '/model/elec/dend9/glu/sh/synapse/synInput_rs', 'spikeOut', '/model/elec/dend9/GABA/sh/synapse', 'addSpike' )
    moose.connect( '/model/elec/branch1_9/glu/sh/synapse/synInput_rs', 'spikeOut', '/model/elec/branch1_9/GABA/sh/synapse', 'addSpike' )
    moose.connect( '/model/elec/branch2_9/glu/sh/synapse/synInput_rs', 'spikeOut', '/model/elec/branch2_9/GABA/sh/synapse', 'addSpike' )

def main():
    global rec
    rec.append( RecInfo( 'gluJn' ) )
    rec.append( RecInfo( 'gluBr1' ) )
    rec.append( RecInfo( 'gluBr2' ) )
    rec.append( RecInfo( 'gabaJn', tau1 = 4e-3, inputFreq =0, Ek=-0.07 ) )
    rec.append( RecInfo( 'gabaBr1', tau1 = 4e-3, inputFreq=0, Ek=-0.07 ) )
    rec.append( RecInfo( 'gabaBr2', tau1 = 4e-3, inputFreq=0, Ek=-0.07 ) )

    warnings.filterwarnings("ignore", category=UserWarning, module="matplotlib")

    makeDisplay()
    quit()

class stimToggle():
    def __init__( self, toggle, ax ):
        self.duration = 1
        self.toggle = toggle
        self.ax = ax

    def click( self, event ):
        global stimStr
        if self.duration < 0.5:
            self.duration = 1.0
            self.toggle.label.set_text( "Long Stim" )
            self.toggle.color = "yellow"
            self.toggle.hovercolor = "yellow"
            stimStr = "2e-10"
        else:
            self.duration = 0.001
            self.toggle.label.set_text( "Short Stim" )
            self.toggle.color = "orange"
            self.toggle.hovercolor = "orange"
            stimStr = "40e-9*(t<0.001)-36e-9*(t>0.001&&t<0.002)"
        updateDisplay()

def printSomaVm():
    print("This is somaVm" )

def updateDisplay():
    makeYmodel()
    tabvec = moose.wildcardFind( '/model/graphs/plot#' )
    moose.element( '/model/elec/' ).name = 'Y'
    vecYdend = moose.wildcardFind( '/model/Y/soma,/model/Y/dend#' )
    vecYbranch1 = moose.wildcardFind( '/model/Y/branch1#' )
    vecYbranch2 = moose.wildcardFind( '/model/Y/branch2#' )
    moose.reinit()
    dt = interval1
    currtime = 0.0
    for i in lines:
        moose.start( dt )
        currtime += dt
        #print "############## NumDendData = ", len( vecYdend )
        i.YdendLines.set_ydata( [v.Vm*1000 for v in vecYdend] )
        i.Ybranch1Lines.set_ydata( [v.Vm*1000 for v in vecYbranch1] )
        i.Ybranch2Lines.set_ydata( [v.Vm*1000 for v in vecYbranch2] )
        dt = interval2

    moose.start( runtime - currtime )

    #print "############## len (tabvec)  = ", len( tabvec[0].vector )
    for i, tab in zip( tplot, tabvec ):
        i.set_ydata( tab.vector * 1000 )
    
    moose.delete( '/model' )
    moose.delete( '/library' )

def doQuit( event ):
    quit()

def makeDisplay():
    global lines
    global tplot
    global axes
    global sliders
    img = mpimg.imread( 'synapticSummation.png' )
    fig = plt.figure( figsize=(10,12) )
    png = fig.add_subplot(321)
    imgplot = plt.imshow( img )
    plt.axis('off')
    ax1 = fig.add_subplot(322)
    plt.ylabel( 'Vm (mV)' )
    plt.ylim( -80, -20 )
    plt.xlabel( 'time (ms)' )
    plt.title( "Membrane potential vs time at 4 positions." )
    t = np.arange( 0.0, runtime + elecPlotDt / 2.0, elecPlotDt ) * 1000 #ms
    #print "############## len t = ", len(t), " numDendSeg = " , numDendSeg
    for i,col,name in zip( range( 4 ), ['b-', 'g-', 'r-', 'm-' ], ['soma', 'jn', 'br1', 'br2'] ):
        ln, = ax1.plot( t, np.zeros(len(t)), col, label='pos= ' + name )
        tplot.append(ln)
    plt.legend()
    ax2 = fig.add_subplot(312)
    #ax.set_ylim( 0, 0.1 )
    plt.ylabel( 'Vm (mV)' )
    plt.ylim( -70, 0.0 )
    plt.xlabel( 'Position (microns)' )
    #ax2.autoscale( enable = True, axis = 'y' )
    plt.title( "Membrane potential as a function of position along cell." )
    #for i,col in zip( range( 5 ), ['k', 'b', 'g', 'y', 'm' ] ):
    for i,col in zip( range( 2 ), ['b', 'k' ] ):
        lw = lineWrapper()
        lw.YdendLines, = ax2.plot( np.arange(0, numDendSeg+1, 1 ),
                np.zeros(numDendSeg+1), col + '-' )
        lw.Ybranch1Lines, = ax2.plot( np.arange(0, numDendSeg, 1) + numDendSeg + 1, 
                np.zeros(numDendSeg), col + ':' )
        lw.Ybranch2Lines, = ax2.plot( np.arange(0, numDendSeg, 1) + numDendSeg + 1, 
                np.zeros(numDendSeg) + numDendSeg + 1, col + '.' )
        lines.append( lw )

    ax = fig.add_subplot(313)
    plt.axis('off')
    axcolor = 'palegreen'
    axStim = plt.axes( [0.02,0.005, 0.20,0.03], facecolor='green' )
    axReset = plt.axes( [0.25,0.005, 0.30,0.03], facecolor='blue' )
    axQuit = plt.axes( [0.60,0.005, 0.30,0.03], facecolor='blue' )

    for x in np.arange( 0.05, 0.31, 0.05 ):
        axes.append( plt.axes( [0.25, x, 0.65, 0.03], facecolor=axcolor ) )
    #aInit = Slider( axAinit, 'A init conc', 0, 10, valinit=1.0, valstep=0.2)
    stim = Button( axStim, 'Long Stim', color = 'yellow' )
    stimObj = stimToggle( stim, axStim )
    
    reset = Button( axReset, 'Reset', color = 'cyan' )
    q = Button( axQuit, 'Quit', color = 'pink' )

    for i in range( len( axes ) ):
        sliders.append( Slider( axes[i], rec[i].name+" Gbar", 0.01, 100, valinit = 20) )
        sliders[-1].on_changed( rec[i].setGbar )

    def resetParms( event ):
        for i in sliders:
            i.reset()


    stim.on_clicked( stimObj.click )
    reset.on_clicked( resetParms )
    q.on_clicked( doQuit )

    updateDisplay()

    plt.show()

# Run the 'main' if this script is executed standalone.
if __name__ == '__main__':
        main()
