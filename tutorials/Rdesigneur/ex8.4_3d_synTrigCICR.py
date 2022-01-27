########################################################################
# This example demonstrates synaptic triggering of a wave of calcium
# release (CICR) from the endoplasmic reticulum. The wave is confined to 
# a subset of a dendrite where there is elevated IP3 present.
# 
# Copyright (C) Upinder S. Bhalla NCBS 2018
# Released under the terms of the GNU Public License V3.
########################################################################
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
    addEndoChemCompt = True,
    # cellProto syntax: ['ballAndStick', 'name', somaDia, somaLength, dendDia, dendLength, numDendSeg]
    cellProto = [['ballAndStick', 'soma', 10e-6, 10e-6, 2e-6, 40e-6, 4]],
    spineProto = [['makeActiveSpine()', 'spine']],
    chemProto = [['./chem/CICRspineDend.g', 'chem']],
    spineDistrib = [['spine', '#dend#', '2e-6', '-0.1e-6']],
    chemDistrib = [['chem', 'dend#,spine#,head#', 'install', '1' ]],
    adaptorList = [
        [ 'Ca_conc', 'Ca', 'spine/Ca', 'conc', 0.00008, 8 ]
    ],
    stimList = [
        ['head5', '0.5', 'glu', 'periodicsyn', '1 + 40*(t>2 && t<3)'],
        ['head5', '0.5', 'NMDA', 'periodicsyn', '1 + 40*(t>2 && t<3)'],
        ['dend#',  'g>10e-6 && g<=31e-6', 'dend/IP3', 'conc', '0.0008' ],
        ],
    plotList = [
        ['head#', '1', 'spine/Ca', 'conc', 'Spine Ca conc'],
        ['dend#', '1', 'dend/Ca', 'conc', 'Dend Ca conc'],
        ['dend#', '1', 'dend_endo/CaER', 'conc', 'ER Ca conc' ],
        ['soma', '1', '.', 'Vm', 'Soma potl'],
    ],
    moogList = [
        ['#', '1', '.', 'Vm', 'Memb. potl.', -65, -60],
        #['head#', '1', 'spine/Ca', 'conc', 'Spine Ca conc', 0, 30],
        #['dend#', '1', 'dend/Ca', 'conc', 'Dend Ca conc'],
        ['dend#', '1', 'dend_endo/CaER', 'conc', 'ER Ca conc', 320, 480],
    ],
)

moose.seed( 1234 )
rdes.buildModel()
moose.reinit()
rdes.displayMoogli( 0.05, 6, rotation = 0, mergeDisplays = True, colormap = 'jet', center = [30e-6, 0, 0] )
#rdes.displayMoogli( 0.05, 5, rotation = 0.01, mergeDisplays = False )
