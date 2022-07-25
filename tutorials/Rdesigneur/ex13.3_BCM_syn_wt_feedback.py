########################################################################
# This example demonstrates Ca influx into spines leading to bidirectional
# plasticity as per the BCM curve. The reactions are competing CaN and 
# CaMKII enzymes acting on the AMPA receptor levels.
# We have two spines with different synaptic input weights but the same
# time-course of stimulus.
# The stimulus is a ramp of synaptic input rate from 0 to 20 Hz.
# This version exhibits the correct metaplasticity properties, because it
# models the stronger synapse at the chemical rather than the electrical 
# level.
# This version further uses the AMPAR-phosphorylation state to modulate 
# the AMPAR conductance at the synapses.
# 
# Copyright (C) Upinder S. Bhalla NCBS 2022
# Released under the terms of the GNU Public License V3.
########################################################################
import moose
import pylab
import rdesigneur as rd
RUNTIME = 120.0      # Seconds
SETTLE = 50.0       # We need a longish settle time because of low competing
                    # enzymes at basal levels of calcium
MaxStimFreq = 20.0  # Hz
stimStr = "{}*max(t-{}, 0)/{}".format( MaxStimFreq, SETTLE, RUNTIME )

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
        [ 'Ca_conc', 'Ca', 'SPINE/Ca_input', 'concInit', 0.00008, 8 ],
        # The modulation offset is 0.5 and scale is 4000, giving a range
        # of values from 0.5 to 4.5.
        # Note that the AMPA_p conc is in the range 0 to 1e-3 mM.
        [ 'SPINE/p_AMPAR', 'conc', 'glu', 'modulation', 0.5, 4e3 ],
    ],
    stimList = [
        ['head0', '0.5', 'glu', 'periodicsyn', stimStr],
        ['head0', '0.1', 'NMDA', 'periodicsyn', stimStr],
        ['head1', '0.5', 'glu', 'periodicsyn', stimStr],
        ['head1', '0.1', 'NMDA', 'periodicsyn', stimStr],
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
# Shift some CaMKII over to the baseline active pool
moose.element( '/model/chem/SPINE/CaMKII[0]' ).concInit -= 0.4e-3
moose.element( '/model/chem/SPINE/baseline_CaMKII[0]' ).concInit += 0.4e-3
moose.reinit()
moose.start( RUNTIME )
rdes.display()
