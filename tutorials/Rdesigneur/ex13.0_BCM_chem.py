########################################################################
# This example demonstrates the BCM curve obtained by competing action of
# Ca activated CaN and Ca-activated CaMKII on the phosphorylation and 
# insertion of the AMPA receptor into the synapse.
# 
# Copyright (C) Upinder S. Bhalla NCBS 2022
# Released under the terms of the GNU Public License V3.
########################################################################
import moose
import pylab
import rdesigneur as rd
RUNTIME = 40.0
CaMax = 4e-3

rdes = rd.rdesigneur(
    turnOffElec = True,
    chemDt = 0.005,
    chemPlotDt = 0.02,
    numWaveFrames = 200,
    diffusionLength = 1e-3, # Make it single compt by having long diffLen
    useGssa = False,
    # cellProto syntax: ['somaProto', 'name', dia, length]
    cellProto = [['somaProto', 'soma', 2e-6, 10e-6]],
    chemProto = [['./chem/bcm.g', 'chem']],
    chemDistrib = [['chem', 'soma', 'install', '1' ]],
    plotList = [
        ['soma', '1', 'dend/Ca', 'conc', 'Dendritic Ca'],
        ['soma', '1', 'dend/p_AMPAR', 'conc', 'BCM curve: Inserted AMPAR'],
        ['soma', '1', 'dend/act_CaMKII', 'conc', 'Active CaMKII'],
        ['soma', '1', 'dend/Ca2_CaN', 'conc', 'Active CaN'],
    ],
    stimList = [['soma', '1', 'dend/Ca', 'conc', 't*{}/{}'.format( CaMax, RUNTIME ) ]],
    
)

rdes.buildModel()
moose.reinit()
moose.start( RUNTIME )

rdes.display()
