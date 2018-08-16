########################################################################
# This example demonstrates insertion of endo-compartments into the
# dendrite. Here endo_compartments are used for the endoplasmic reticulum 
# (ER) in a model of Calcium Induced Calcium Release through the 
# IP3 receptor.
# 
# Copyright (C) Upinder S. Bhalla NCBS 2018
# Released under the terms of the GNU Public License V3.
########################################################################
import moose
import pylab
import rdesigneur as rd
rdes = rd.rdesigneur(
    turnOffElec = True,
    chemDt = 0.005,
    chemPlotDt = 0.02,
    diffusionLength = 1e-6,
    useGssa = False,
    addSomaChemCompt = False,
    addEndoChemCompt = True,
    # cellProto syntax: ['somaProto', 'name', dia, length]
    cellProto = [['somaProto', 'soma', 2e-6, 10e-6]],
    chemProto = [['./chem/CICRwithConcChan.g', 'chem']],
    chemDistrib = [['chem', 'soma', 'install', '1' ]],
    plotList = [
        ['soma', '1', 'dend/CaCyt', 'conc', 'Ca conc'],
        ['soma', '1', 'dend_endo/CaER', 'conc', 'ER Ca'],
        ['soma', '1', 'dend/ActIP3R', 'conc', 'active IP3R'],
    ],
)

moose.element('/library/chem/kinetics/ActIP3R/chan').permeability = 2.12e-20
moose.element('/library/chem/compartment_1/leakPool/leakChan').permeability = 2.55e-23

rdes.buildModel()
IP3 = moose.element( '/model/chem/dend/IP3' )
IP3.vec.concInit = 0.004
IP3.vec[0].concInit = 0.01
moose.reinit()
moose.start( 50 )

rdes.display()
