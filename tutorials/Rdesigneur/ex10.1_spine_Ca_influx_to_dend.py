# Example 10.1: Spines on a ball-and-stick cell model, Ca influx and
# diffusion following synaptic input.
import moose
import pylab
import rdesigneur as rd
rdes = rd.rdesigneur(
    turnOffElec = False,
    chemDt = 0.002,
    chemPlotDt = 0.02,
    diffusionLength = 1e-6,
    numWaveFrames = 50,
    useGssa = False,
    addSomaChemCompt = False,
    addEndoChemCompt = False,
    # cellProto syntax: ['ballAndStick', 'name', somaDia, somaLength, dendDia, dendLength, numDendSeg]
    cellProto = [['ballAndStick', 'soma', 10e-6, 10e-6, 2e-6, 40e-6, 1]],
    spineProto = [['makeActiveSpine()', 'spine']],
    chemProto = [['./chem/CaOnly.g', 'chem']],
    spineDistrib = [['spine', '#dend#', '4.0e-6', '-0.1e-6']],
    chemDistrib = [['chem', 'dend#,spine#,head#', 'install', '1' ]],
    adaptorList = [
        [ 'Ca_conc', 'Ca', 'spine/Ca', 'conc', 0.00008, 8 ]
    ],
    stimList = [
        ['head3', '0.5', 'glu', 'periodicsyn', '0 + 40*(t>2 && t<3)'],
        ['head3', '0.5', 'NMDA', 'periodicsyn', '0 + 40*(t>2 && t<3)'],
        ['head4', '0.5', 'glu', 'periodicsyn', '0 + 40*(t>4 && t<5)'],
        ['head4', '0.5', 'NMDA', 'periodicsyn', '0 + 40*(t>4 && t<5)'],
        ['head6', '0.5', 'glu', 'periodicsyn', '0 + 40*(t>8 && t<9)'],
        ['head6', '0.5', 'NMDA', 'periodicsyn', '0 + 40*(t>8 && t<9)'],
        ['head8', '0.5', 'glu', 'periodicsyn', '0 + 40*(t>10 && t<11)'],
        ['head8', '0.5', 'NMDA', 'periodicsyn', '0 + 40*(t>10 && t<11)'],
        ],
    plotList = [
        ['head#', '1', 'spine/Ca', 'conc', 'Spine Ca conc'],
        ['dend#', '1', 'dend/Ca', 'conc', 'Dend Ca conc'],
        ['head#', '1', 'spine/Ca', 'conc', 'Spine Ca conc', 'wave'],
        ['dend#', '1', 'dend/Ca', 'conc', 'Dend Ca conc', 'wave'],
        ['soma', '1', '.', 'Vm', 'Soma membrane potential'],
    ],
    #moogList = [['#', '1', 'dend/Ca', 'conc','Ca Conc', 0, 2]],
    moogList = [['#', '1', '.', 'Vm','Membrane potential', -65, -57]],
)
moose.seed( 1234 )
rdes.buildModel()
moose.reinit()
rdes.displayMoogli(0.1, 16, 0.0 )
