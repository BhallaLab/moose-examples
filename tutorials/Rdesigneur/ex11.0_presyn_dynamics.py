####################################################################
# This example illustrates modelling of presynaptic plasticity involving
# Ca influx to 3 boutons, each with a pool of presnaptic vesicles, and 
# reactions leading to a buildup of Ca and depletion of vesicles during
# synaptic release. The neurotransmitter is coupled to receptors to give a
# complex, stochastic postsynaptic response to a burst of input.
####################################################################
import moose
import rdesigneur as rd

freq = 20.0 # Hz
settleTime = 0.2    # seconds
numPulses = 8
stimEnd = settleTime + numPulses/(freq+1)
stimAmpl = 2.0e-2
runtime = 0.8

## This string sets up a burst of input activity
gluStimStr = "0.08e-3 + {}*(t>{} && t<{}) * exp( 50 * (sin(t*2*3.14159265 * {}) -1) )".format(stimAmpl, settleTime, stimEnd, freq )

rdes = rd.rdesigneur(
    elecDt = 50e-6,
    chemDt = 0.001,
    chemPlotDt = 0.001,
    turnOffElec = False,
    useGssa = True,    

    # cellProto syntax: ['ballAndStick', 'name', somaDia, somaLength, dendDia, dendLength, numDendSeg]
    # 8x8 micron soma, 1.5x20 micron dendrite, 1 segment dendrite.
    cellProto = [['ballAndStick', 'soma',  6e-6, 6e-6, 1.5e-6, 20e-6, 1]],
    chemProto = [['./chem/echem.g', 'chem']],
    spineProto = [['makeActiveSpine()', 'spine']],
    spineDistrib = [
        ['spine', 'dend#', '5e-6', '-1e-6']  # Put 4 spines, 5 um apart
    ],
    chemDistrib = [ # Put presynaptic bouton compartments next to each spine
        ['kinetics', 'head#', 'presyn_spine', '1', 0.7, 0 ],
    ],
    adaptorList = [ # map released neurotransmitter to cognate receptor
        # Want et al JACS 2019, 141,44 estimate 8K glu per vesicle.
        ['kinetics/glu/glu', 'n', 'glu', 'activation', 0.0, 8.0e3 ],
    ],
    stimList = [ # deliver the stimuli
        ['head#', '1', 'kinetics/glu/Ca_ext', 'conc', gluStimStr ],
    ],
    plotList = [ # Lots of plots.
        ['#', '1', 'kinetics/glu/Ca', 'conc', 'Ca in presyn bouton'],
        ['#', '1', 'kinetics/glu/RR_pool', 'n', 'RR_pool in presyn bouton'],
        ['#', '1', 'kinetics/glu/Ca_ext', 'conc', 'Input to bouton'],
        ['#', '1', 'kinetics/glu/glu', 'n', '# of glu vesicles released'],
        ['soma', '1', '.', 'Vm', 'Membrane potential'],
    ],
    moogList = [
        ['#', '1', '.', 'Vm', 'Membrane potential', -65.0, -55.0],
        ['#', '1', 'kinetics/glu/Ca', 'conc', 'Ca conc', 0.0, 1.0]
    ]
)

moose.seed( 1234 ) # Random number seed. Response details change with this.
moose.element( '/library/spine/head/glu' ).Gbar *= 0.1 # Tweak conductance
rdes.buildModel() # Assemble the model from prototypes.
moose.reinit()
rdes.displayMoogli( 0.001, runtime, rotation = 0.00, mergeDisplays=True )
