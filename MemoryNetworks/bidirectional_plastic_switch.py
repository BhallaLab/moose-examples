"""bidirectional_plastic_switch.py: 
    
Apply sequences of random input to this switch and plot the correlation between output
sequences.

"""
    
__author__           = "Dilawar Singh"
__copyright__        = "Copyright 2015, Dilawar Singh and NCBS Bangalore"
__credits__          = ["NCBS Bangalore"]
__license__          = "GNU GPL"
__version__          = "1.0.0"
__maintainer__       = "Dilawar Singh"
__email__            = "dilawars@ncbs.res.in"
__status__           = "Development"

import moose
import os
import sys
import pylab


def applyInputPulseTrain(mooseElem, fieldName, pulseTrain):
    """
    Apply a train of pulse: a list of (time, value) tuples, to fieldName of
    mooseElem.

    time is incremental.
    """
    for (t, v) in pulseTrain:
        moose.start(t)
        mooseElem.setField(fieldName, v)

def dumpPlots():
    fname = 'bidirectionalPlasticity.plot'
    if ( os.path.exists( fname ) ):
        os.remove( fname )
    for t in moose.wildcardFind( '/model/graphs/conc#/#,/model/moregraphs/conc#/#' ):
        print( t )
        t.xplot( fname, t.name )

def getPlotData():
    totR = moose.element('/model/graphs/conc1/tot_PSD_R.Co')
    PP1 = moose.element('/model/moregraphs/conc4/PP1_active.Co')
    Ca = moose.element('/model/graphs/conc1/Ca.Co')
    return totR.vector, PP1.vector, Ca.vector

def displayPlots():
    clock = moose.element( '/clock' ) # look up global clock
    totR = moose.element( '/model/graphs/conc1/tot_PSD_R.Co' )
    PP1 = moose.element( '/model/moregraphs/conc4/PP1_active.Co' )
    Ca = moose.element( '/model/graphs/conc1/Ca.Co' )
    pylab.plot( pylab.linspace( 0, clock.currentTime, len( totR.vector )), totR.vector, label='membrane Receptor' )
    pylab.plot( pylab.linspace( 0, clock.currentTime, len( PP1.vector ) ), PP1.vector, label='active PP1' )
    pylab.plot( pylab.linspace( 0, clock.currentTime, len( Ca.vector ) ), Ca.vector, label='Ca' )
    pylab.legend()
    pylab.show()

def main():
    """
    This is a toy model of synaptic bidirectional plasticity. The model has 
    a small a bistable chemical switch, and a small set of reactions that
    decode calcium input. One can turn the switch on with short high 
    calcium pulses (over 2 uM for about 10 sec). One can turn it back off
    again using a long, lower calcium pulse (0.2 uM, 2000 sec).
    """
    method = 'old_gssa'  # This is the Gillespie Stoichastic Systems Algorithm
    if ( len( sys.argv ) >= 2 ):
        method = sys.argv[1]
    if ( method == "gsl" ):
        method = "old_gsl"
    if ( method == "gssa" ):
        method = "old_gssa"
    # Load in the model and set up to use the specified method
    modelId = moose.loadModel( './stargazin_synapse.g', 'model', method )
    moose.start( 1000.0 ) # Run the model for 1000 seconds.
    Ca = moose.element( '/model/kinetics/BULK/Ca' )

    applyInputPulseTrain(Ca, 'concInit'
            , [ (1000.0, 1.0e-3)
                , (10.0, 0.08e-3)
                , (50.0, 1.0e-3)
                , (10.0, 0.08e-3)
                , (1000.0, 0.2e-3)
                , (2000.0, 0.08e-3) 
                ]
            )
    moose.start(2000.0)
    dumpPlots()
    displayPlots()
    quit()

# Run the 'main' if this script is executed standalone.
if __name__ == '__main__':
    main()
