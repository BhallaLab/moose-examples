########################################################################
# This example demonstrates synaptic summation in a branched neuron.
# Copyright (C) Upinder S. Bhalla NCBS 2018
# Released under the terms of the GNU Public License V3.
########################################################################
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from matplotlib.widgets import Slider, Button, RadioButtons
import numpy as np
import warnings
import moose
import rdesigneur as rd

lines = []
tplot = []
axes = []
sliders = []
fields = []

RM = 1.0
RA = 1.0
CM = 0.01
diameter = 10e-6
runtime = 0.05
elecPlotDt = 0.0001
sliderMode = "Gbar"
currentChanPath = '/model/elec/soma/Na'
currentChanMod = 0.0
preStimTime = 0.01
injectTime = 0.05
postStimTime = 0.01
runtime = preStimTime + injectTime + postStimTime
inject = 100e-12

class SlideField():
    def __init__(self, name, field = 'modulation', initVal = 0.0):
        self.name = name
        self.path = '/model/elec/soma/' + name
        self.field = field
        assert( moose.exists( self.path ) )
        self.val = initVal

    def setVal( self, val ):
        moose.element( path ).setField( self.field, val )
        updateDisplay()

    def setChanMod( self, val ):
        global currentChanPath
        global currentChanMod
        currentChanPath = self.path
        currentChanMod = val
        updateDisplay()

def makeModel():
    rdes = rd.rdesigneur(
        elecPlotDt = elecPlotDt,
        stealCellFromLibrary = True,
        verbose = False,
        #chanProto = [['make_glu()', 'glu'],['make_GABA()', 'GABA']],
        chanProto = [
            ['make_Na()', 'Na'],
            ['make_K_DR()', 'K_DR'],
            ['make_K_A()', 'K_A'],
            ['make_Ca()', 'Ca'],
            ['make_Ca_conc()', 'Ca_conc'],
            ['make_K_AHP()', 'K_AHP'],
            ['make_K_C()', 'K_Ca'],
        ],
        # cellProto syntax: ['ballAndStick', 'name', somaDia, somaLength, dendDia, dendLength, numDendSegments ]
        # The numerical arguments are all optional
        cellProto = 
            [['somaProto', 'cellBase', diameter, diameter]],
        passiveDistrib = [[ '#', 'RM', str(RM), 'CM', str(CM), 'RA', str(RA) ]],
        chanDistrib = [
            ['Na', 'soma', 'Gbar', '300' ],
            ['K_DR', 'soma', 'Gbar', '250' ],
            ['K_A', 'soma', 'Gbar', '200' ],
            ['Ca_conc', 'soma', 'Gbar', '250' ],
            ['Ca', 'soma', 'Gbar', '40' ],
            ['K_Ca', 'soma', 'Gbar', '100' ],
            ['K_AHP', 'soma', 'Gbar', '60' ],
        ],
        plotList = [['soma', '1','.', 'Vm'], ['soma', '1', 'Ca_conc', 'Ca']]
    )
    moose.element( '/library/Ca_conc' ).CaBasal=0.08e-3
    rdes.buildModel()
    moose.showfield( '/model/elec/soma/Ca_conc' )
    moose.showmsg( '/model/elec/soma/Ca_conc' )
    moose.element( '/model/elec/soma/Ca_conc' ).B *= 1000

def main():
    global fields
    makeModel()
    fields.append( SlideField( 'Na', initVal = 1.0 ) )
    fields.append( SlideField( 'K_DR', initVal = 1.0 ) )
    fields.append( SlideField( 'K_A' ) )
    fields.append( SlideField( 'Ca' ) )
    fields.append( SlideField( 'K_AHP' ) )
    fields.append( SlideField( 'K_Ca' ) )
    fields.append( SlideField( 'Ca_conc', field = 'tau' ) )
    fields[-1].name = 'Ca_tau'
    fields.append( SlideField( 'Ca_conc', field = 'diameter' ) )
    fields[-1].name = 'Ca_dia'
    warnings.filterwarnings("ignore", category=UserWarning, module="matplotlib")

    makeDisplay()
    quit()

class stimToggle():
    def __init__( self, toggle, ax ):
        self.duration = 1
        self.toggle = toggle
        self.ax = ax

    def click( self, event ):
        global spikingProto
        global spikingDistrib
        if self.duration < 0.5:
            self.duration = 1.0
            self.toggle.label.set_text( "Spiking off" )
            self.toggle.color = "yellow"
            self.toggle.hovercolor = "yellow"
            spikingProto = []
            spikingDistrib = []
        else:
            self.duration = 0.001
            self.toggle.label.set_text( "Spiking on" )
            self.toggle.color = "orange"
            self.toggle.hovercolor = "orange"
            spikingDistrib = [['Na', 'soma', 'Gbar', '300' ],['K_DR', 'soma', 'Gbar', '250' ]]
        updateDisplay()

def printSomaVm():
    print("This is somaVm" )

def runMod( mod ):
    moose.element( currentChanPath ).modulation = mod
    #print( 'path = {}, mod = {}'.format( currentChanPath, mod ) )
    moose.reinit()
    moose.start( preStimTime )
    moose.element( '/model/elec/soma' ).inject = inject
    moose.start( injectTime )
    moose.element( '/model/elec/soma' ).inject = 0
    moose.start( postStimTime )
    Vm = moose.element( '/model/graphs/plot0' ).vector
    Ca = moose.element( '/model/graphs/plot1' ).vector
    return Vm * 1000, Ca * 1e3

def updateDisplay():
    Vm0, Ca0 = runMod( 1.0e-9 )
    Vm1, Ca1 = runMod( currentChanMod )
    #print len(Vm0), len(Ca0), len(Vm1), len( Ca1)
    tplot[0].set_ydata( Vm0 )
    tplot[1].set_ydata( Vm1 )
    tplot[2].set_ydata( Ca0 )
    tplot[3].set_ydata( Ca1 )

def doQuit( event ):
    quit()

def makeDisplay():
    global tplot
    global axes
    global sliders

    fig = plt.figure( figsize=(10,12) )
    t = np.arange( 0.0, runtime + elecPlotDt / 2.0, elecPlotDt ) * 1000 #ms
    ax0 = fig.add_subplot(311)
    plt.ylabel( 'Vm (mV)' )
    plt.ylim( -80, +40 )
    plt.xlabel( 'time (ms)' )
    plt.title( "Membrane potential vs. time." )
    ln, = ax0.plot( t, np.zeros(len(t)), 'r:', label='chan absent' )
    tplot.append(ln)
    ln, = ax0.plot( t, np.zeros(len(t)), 'b-', label='chan present' )
    tplot.append(ln)
    plt.legend()
    ####################################
    ax1 = fig.add_subplot(312)
    plt.ylabel( 'Ca (uM)' )
    plt.ylim( 0, 10 )
    plt.xlabel( 'time (ms)' )
    ln, = ax1.plot( t, np.zeros(len(t)), 'r:', label='chan absent' )
    tplot.append(ln)
    ln, = ax1.plot( t, np.zeros(len(t)), 'b-', label='chan present' )
    tplot.append(ln)
    plt.title( "Calcium concentration vs. time." )
    plt.legend()
    ####################################
    ax2 = fig.add_subplot(313)
    plt.axis('off')
    axcolor = 'palegreen'
    axStim = plt.axes( [0.02,0.005, 0.20,0.03], facecolor='green' )
    axReset = plt.axes( [0.25,0.005, 0.30,0.03], facecolor='blue' )
    axQuit = plt.axes( [0.60,0.005, 0.30,0.03], facecolor='blue' )

    for x in np.arange( 0.05, 0.31, 0.05 ):
        axes.append( plt.axes( [0.25, x, 0.65, 0.03], facecolor=axcolor ) )
    #aInit = Slider( axAinit, 'A init conc', 0, 10, valinit=1.0, valstep=0.2)
    #rax = plt.axes([0.02, 0.05, 0.10, 0.28], facecolor="#EEEFFF")
    #mode = RadioButtons(rax, ('Channels', 'Other Parms'))

    stim = Button( axStim, 'Channel modulation', color = 'yellow' )
    stimObj = stimToggle( stim, axStim )
    
    reset = Button( axReset, 'Reset', color = 'cyan' )
    q = Button( axQuit, 'Quit', color = 'pink' )

    for i in range( len( axes ) ):
        sliders.append( Slider( axes[i], fields[i].name+" Modulation", 0.0, 10, valinit = 0) )
        sliders[-1].on_changed( fields[i].setChanMod )

    def resetParms( event ):
        for i in sliders:
            i.reset()

    #mh = modeHandler()

    #mode.on_clicked( mh.setMode )
    stim.on_clicked( stimObj.click )
    reset.on_clicked( resetParms )
    q.on_clicked( doQuit )

    updateDisplay()

    plt.show()

# Run the 'main' if this script is executed standalone.
if __name__ == '__main__':
        main()

