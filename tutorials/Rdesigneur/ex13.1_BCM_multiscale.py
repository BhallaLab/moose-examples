########################################################################
# This example demonstrates Ca influx into spines leading to bidirectional
# plasticity as per the BCM curve. The reactions are competing CaN and 
# CaMKII enzymes acting on the AMPA receptor levels.
# We have two spines with different synaptic input weights but the same
# time-course of stimulus.
# The stimulus is a ramp of synaptic input rate from 0 to 20 Hz.
# Note that this version incorrectly models metaplasticity. It is an
# excellent illustration of how 'obvious' model abstractions may give 
# completely incorrect behaviour. See ex13.2_metaplasticity.py for the 
# correct version, using exactly the same model but better use of model
# details.
# 
# Copyright (C) Upinder S. Bhalla NCBS 2022
# Released under the terms of the GNU Public License V3.
########################################################################
import moose
import pylab
import rdesigneur as rd
RUNTIME = 40.0      # Seconds
MaxStimFreq = 20.0  # Hz
stimStr = "{}*t/{}".format( MaxStimFreq, RUNTIME )

rdes = rd.rdesigneur(
    turnOffElec = False,
    chemDt = 0.002,
    chemPlotDt = 0.01,
    diffusionLength = 1e-6,
    useGssa = False,
    addSomaChemCompt = False,
    addEndoChemCompt = False,
    # cellProto syntax: ['ballAndStick', 'name', somaDia, somaLength, dendDia, dendLength, numDendSeg]
    cellProto = [['ballAndStick', 'soma', 10e-6, 10e-6, 2e-6, 40e-6, 4]],
    spineProto = [['makeActiveSpine()', 'spine']],
    chemProto = [['./chem/bcm_cell.g', 'chem']],
    spineDistrib = [['spine', '#dend#', '10e-6', '0.1e-6']],
    chemDistrib = [
        ['DEND', '#', 'dend', '1', 1e-6],
        ['SPINE', '#', 'spine', '1', 'DEND']
    ],
    adaptorList = [
        [ 'Ca_conc', 'Ca', 'SPINE/Ca_input', 'concInit', 0.00008, 8 ]
    ],
    stimList = [
        ['head0', '0.5', 'glu', 'periodicsyn', stimStr],
        ['head0', '0.1', 'NMDA', 'periodicsyn', stimStr],
        ['head1', '0.2', 'glu', 'periodicsyn', stimStr],
        ['head1', '0.05', 'NMDA', 'periodicsyn', stimStr],
        ],
    plotList = [
        ['soma', '1', '.', 'Vm', 'Soma Memb potl'],
        #['#', '1', 'DEND/Ca', 'conc', 'Dendritic Ca'], # isn't working
        ['head#', '1', 'SPINE/Ca_input', 'conc', 'Spine input Ca'],
        ['head#', '1', 'SPINE/Ca', 'conc', 'Spine chem Ca'],
        ['head#', '1', 'SPINE/p_AMPAR', 'conc', 'BCM curve: Inserted AMPAR'],
        ['head#', '1', 'SPINE/act_CaMKII', 'conc', 'Active CaMKII'],
        ['head#', '1', 'SPINE/Ca2_CaN', 'conc', 'Active CaN'],
    ],
)

moose.seed( 1234 )
rdes.buildModel()
moose.reinit()
moose.start( RUNTIME )
rdes.display()
