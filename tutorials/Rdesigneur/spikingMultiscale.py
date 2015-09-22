import moogli
import numpy
import pylab
from matplotlib.cm import gnuplot
import moose
from moose import neuroml
from PyQt4 import Qt, QtCore, QtGui
import matplotlib.pyplot as plt
import sys
import os
from moose.neuroml.ChannelML import ChannelML
sys.path.append('/home/bhalla/moose/trunk/Demos/util')
import rdesigneur as rd

PI = 3.14159265359
frameRunTime = 0.0001
frameYaw = 0.002
runtime = 0.5
inject = 10e-10
simdt = 5e-5
FaradayConst = 96845.34
useGssa = True
combineSegments = False
spineSpacing = 5e-6
spineSpacingDistrib = 1e-6
size = 1.0
sizeDistrib = 0.5
angle = 0
angleDistrib = 2 * PI

def main():
    numpy.random.seed( 1234 )
    if ( len( sys.argv ) < 2 ):
        #filename = './cells/h10.CNG.swc'
        filename = './cells/barrionuevo_cell1zr.CNG.swc'
        #filename = './cells/VHC-neuron.CNG.swc'
        #filename = './cells/970529c.CNG.swc'
    else:
        filename = sys.argv[1]
    ######################################################################
    # Define prototypes
    cellProto = [ [ filename, 'elec' ] ]
    chanProto = [ \
        ['./chans/hd.xml' ], \
        ['./chans/kap.xml' ], \
        ['./chans/kad.xml' ], \
        ['./chans/kdr.xml' ], \
        ['./chans/na3.xml' ], \
        ['./chans/nax.xml' ], \
        ['./chans/CaConc.xml' ], \
        ['./chans/Ca.xml' ], \
        ['./chans/NMDA.xml' ], \
        ['./chans/Glu.xml' ], \
    ]
    spineProto = [[ 'makeSpineProto()', 'spine' ]]
    chemProto = [[ './chem/psd52.g', 'chem' ]]
    ######################################################################
    # Specify model
    rdes = rd.rdesigneur(
        useGssa = useGssa, \
        combineSegments = combineSegments, \
        cellProto = cellProto, \
        chanProto = chanProto, \
        spineProto = spineProto, \
        chemProto = chemProto, \
        passiveDistrib = [ \
            [ ".", "#", \
            "EM", "-58e-3", \
            "initVm", "-65e-3", \
            "RM", "2.8", \
            "CM", "0.01", \
            "RA", "1.5"], \
            [".", "#axon#", "RA", "0.5" ] \
        ], \
        chanDistrib = [ 
            [ "hd", "#dend#,#apical#", "Gbar", "5e-2*(1+(p*3e4))" ], \
            ["kdr", "#", "Gbar", "100" ], \
            ["na3", "#soma#,#dend#,#apical#", "Gbar", "250"], \
            ["nax", "#axon#", "Gbar", "1250"], \
            ["kap", "#axon#,#soma#", "Gbar", "300"], \
            ["kap", "#dend#,#apical#", "Gbar", "300*H(100e-6 - p) * (1+(p*1e4))"], \
            ["Ca_conc", "#dend#,#apical#", "tau", "0.0133" ], \
            ["kad", "#dend#,#apical#", "Gbar", "300*H(p - 100e-6) * (1+p*1e4)" ], \
            ["Ca", "#dend#,#apical#", "Gbar", "50" ], \
        ], \
        spineDistrib = [ [ 'spine', '#apical#,#dend#', \
            'spineSpacing', str( spineSpacing), \
            'spineSpacingDistrib', str( spineSpacingDistrib ), \
            'angle', str( angle ), 'angleDistrib', str( angleDistrib ), \
            'size', str( size ), 'sizeDistrib', str( sizeDistrib ) \
        ]], \
        chemDistrib = [ [ "chem", "#apical#,#dend#", "install", "1" ] ], \
        adaptorList = [ \
            [ 'Ca_conc', 'Ca', 'psd/Ca_input', 'concInit', 8e-5, 1.0 ], \
            [ 'Ca_conc', 'Ca', 'dend/Ca_dend', 'concInit', 8e-5, 1.0 ], \
            [ 'psd/tot_PSD_R', 'n', 'glu', 'Gbar', 0, 0.01 ], \
        ] \
    )
    ######################################################################
    # Make the model
    rdes.buildModel( '/model' )

    ######################################################################
    # Run and display control
    rdes.soma.inject = inject
    for i in moose.wildcardFind( '/library/##' ):
        i.tick = -1

    for i in range( 8 ):
        moose.setClock( i, simdt )
    moose.setClock( 18, 0.005 )
    moose.reinit()

    # Now we set up the display
    #moose.le( '/model/ca1/soma' )
    soma = moose.element( '/model/elec/soma' )
    kap = moose.element( '/model/elec/soma/kap' )

    graphs = moose.Neutral( '/graphs' )

    ca = moose.vec( '/model/chem/spine/Ca_Spine' )
    catab = moose.Table2( '/graphs/catab', 20 ).vec
    for i in range( 0, 100, 5 ):
        moose.connect( catab[i/5], 'requestOut', ca[i], 'getConc' )
    psdR = moose.vec( '/model/chem/psd/tot_PSD_R' )
    psdRtab = moose.Table2( '/graphs/psdRtab', 20 ).vec
    for i in range( 0, 100, 5 ):
        moose.connect( psdRtab[i/5], 'requestOut', psdR[i], 'getN' )
    vtab = moose.Table( '/graphs/vtab' )
    moose.connect( vtab, 'requestOut', soma, 'getVm' )
    kaptab = moose.Table( '/graphs/kaptab' )
    moose.connect( kaptab, 'requestOut', kap, 'getGk' )

    compts = moose.wildcardFind( rdes.elecid.path + "/#[ISA=CompartmentBase]" )
    ecomptPath = map( lambda x : x.path, compts )
    print 'LEN COMPTS = ', len( compts )

    # Graphics stuff here.
    app = QtGui.QApplication(sys.argv)
    morphology = moogli.read_morphology_from_moose(name = "", path = rdes.elecid.path )
    morphology.create_group( "group_all", ecomptPath, -0.08, 0.02, gnuplot )

    viewer = moogli.DynamicMorphologyViewerWidget(morphology)
    viewer.set_background_color( 1, 1, 1, 1 )
    def callback( morphology, viewer ):
        moose.start( frameRunTime )
        viewer.yaw( frameYaw, 0 )
        Vm = map( lambda x: moose.element( x ).Vm, compts )
        morphology.set_color( "group_all", Vm )
        currTime = moose.element( '/clock' ).currentTime
        #print currTime, compts[0].Vm
        if ( currTime < runtime ):
            return True
        else:
            finalizePlots( runtime, vtab, catab, psdRtab, kaptab )
            return False

    viewer.set_callback( callback, idletime = 0 )
    #viewer.pitch( PI/2.0, 0 )
    viewer.pitch( 0.5, 0 )
    viewer.pitch( 0.5, 0 )
    viewer.pitch( 0.5, 0 )
    viewer.showMaximized()
    viewer.show()
    app.exec_()

def finalizePlots( runtime, vtab, catab, psdRtab, kaptab):
    t = numpy.arange( 0, runtime, vtab.dt )
    t2 = numpy.arange( 0, runtime, catab[0].dt )
    fig = plt.figure( figsize=(14,12) )
    p1 = fig.add_subplot(311)
    for i in range( 20 ):
        #p1.plot( t2,  catab[i].vector, label = 'Ca Spine' + str( i * 5 ) )
        p1.plot( t2,  psdRtab[i].vector, label = 'psdR' + str( i * 5 ) )
    p2 = fig.add_subplot(312)
    p2.plot( t,  vtab.vector, label = 'Vm Soma' )
    p2.legend()
    p3 = fig.add_subplot(313)
    p3.plot( t, kaptab.vector, label = 'kap Soma' )
    p3.legend()
    plt.show()

if __name__ == '__main__':
    main()
