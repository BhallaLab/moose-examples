import moose
import pylab
import rdesigneur as rd

moogList = []
### Remove comment from line below if you want to display the 3-d cell view.
moogList = [['#', '1', '.', 'Vm', 'Membrane potential', -0.065, -0.055]]

rdes = rd.rdesigneur(
    turnOffElec = False,
    chemDt = 0.002,
    chemPlotDt = 0.02,
    diffusionLength = 1e-6,
    numWaveFrames = 50,
    useGssa = False,
    addSomaChemCompt = False,
    addEndoChemCompt = False,
    # cellProto syntax: ['branchedCell', 'name', somaDia, somaLength, dendDia, dendLength, numDendSeg, branchDia, branchLength, numBranchSeg]
    cellProto = [['branchedCell', 'soma', 10e-6, 10e-6, 1e-6, 40e-6, 1, 0.5e-6, 40e-6, 1]],
    spineProto = [['makeActiveSpine()', 'spine']],
    chemProto = [['./chem/CaOnly.g', 'chem']],
    spineDistrib = [['spine', '#dend#,#branch#', '4.0e-6', '-0.1e-6']],
    chemDistrib = [['chem', 'dend#,branch#,spine#,head#', 'install', '1' ]],
    adaptorList = [
        [ 'Ca_conc', 'Ca', 'spine/Ca', 'conc', 0.00008, 8 ]
    ],
    stimList = [
        ['head3', '0.5', 'glu', 'periodicsyn', '0 + 40*(t>2 && t<3)'],
        ['head3', '0.5', 'NMDA', 'periodicsyn', '0 + 40*(t>2 && t<3)'],
        ['head4', '0.5', 'glu', 'periodicsyn', '0 + 40*(t>4 && t<5)'],
        ['head4', '0.5', 'NMDA', 'periodicsyn', '0 + 40*(t>4 && t<5)'],
        ['head13', '0.5', 'glu', 'periodicsyn', '0 + 40*(t>8 && t<9)'],
        ['head13', '0.5', 'NMDA', 'periodicsyn', '0 + 40*(t>8 && t<9)'],
        ['head14', '0.5', 'glu', 'periodicsyn', '0 + 40*(t>10 && t<11)'],
        ['head14', '0.5', 'NMDA', 'periodicsyn', '0 + 40*(t>10 && t<11)'],
        ['head23', '0.5', 'glu', 'periodicsyn', '0 + 40*(t>14 && t<15)'],
        ['head23', '0.5', 'NMDA', 'periodicsyn', '0 + 40*(t>14 && t<15)'],
        ['head24', '0.5', 'glu', 'periodicsyn', '0 + 40*(t>16 && t<17)'],
        ['head24', '0.5', 'NMDA', 'periodicsyn', '0 + 40*(t>16 && t<17)'],
        ],
    plotList = [
        ['head#', '1', 'spine/Ca', 'conc', 'Spine Ca conc'],
        ['dend#,branch#', '1', 'dend/Ca', 'conc', 'Dend Ca conc'],
        ['head#', '1', 'spine/Ca', 'conc', 'Spine Ca conc', 'wave'],
        ['dend#,branch#', '1', 'dend/Ca', 'conc', 'Dend Ca conc', 'wave'],
        ['soma,#dend#,branch#', '1', '.', 'Vm', 'Memb potl'],
        ['soma', '1', '.', 'Vm', 'Memb potl'],
    ],
    moogList = moogList,
)
moose.seed( 1234 )
rdes.buildModel()
moose.reinit()
if len(moogList) == 0:
    moose.start( 8 )
    rdes.display()
else:
    rdes.displayMoogli( 0.1, 11, 0.0 )

