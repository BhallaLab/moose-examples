########################################################################
# This example demonstrates insertion of endo-compartments into the
# dendrite. Here endo_compartments are used for the endoplasmic reticulum 
# (ER) in a model of Calcium Induced Calcium Release through the 
# IP3 receptor.
# Note that units of permeability in the ConcChan are 1/(millimolar.sec)
# 
# Copyright (C) Upinder S. Bhalla NCBS 2018
# Released under the terms of the GNU Public License V3.
########################################################################
import moose
import pylab
import rdesigneur as rd
rdes = rd.rdesigneur(
    turnOffElec = False,
    chemDt = 0.005,
    chemPlotDt = 0.02,
    diffusionLength = 1e-6,
    useGssa = False,
    addSomaChemCompt = False,
    addEndoChemCompt = True,
    # cellProto syntax: ['somaProto', 'name', dia, length]
    cellProto = [['somaProto', 'soma', 2e-6, 40e-6]],
    spineProto = [['makeActiveSpine()', 'spine']],
    chemProto = [['./chem/CICR_spine_dend.g', 'chem']],
    spineDistrib = [['spine', '#soma#', '10e-6', '0.1e-6']],
    chemDistrib = [['chem', '#', 'install', '1' ]],
    adaptorList = [
        [ 'Ca_conc', 'Ca', 'spine/Ca', 'conc', 0.00008, 8 ]
    ],
    stimList = [
        ['head0', '0.5', 'glu', 'periodicsyn', '1 + 40*(t>10 && t<11)'],
        ['head0', '0.5', 'NMDA', 'periodicsyn', '1 + 40*(t>10 && t<11)'],
        ['soma',  '1', 'dend/IP3', 'conc', '0.0001 + 0.001*(t>10&&t<20)' ],
        ],
    plotList = [
        ['head#', '1', 'spine/Ca', 'conc', 'Spine Ca conc'],
        ['head#', '1', 'Ca_conc', 'Ca', 'Elec Spine Ca conc'],
        ['soma', '1', 'dend/Ca', 'conc', 'Dend Ca conc'],
        ['soma', '1', 'dend_endo/CaER', 'conc', 'ER Ca'],
        ['soma', '1', '.', 'Vm', 'Memb potl'],
    ],
)

moose.element('/library/chem/kinetics/IP3').concInit = 0.0001
moose.element('/library/chem/kinetics/ActIP3R/chan').permeability = 8000
moose.element('/library/chem/compartment_1/leakPool/leakChan').permeability     = 80
rdes.buildModel()
moose.le( '/model' )
moose.le( '/model/elec/head0' )
Ca = moose.element( '/model/chem/dend/Ca' )
#Ca.vec.concInit = 0.004
#Ca.vec[0].concInit = 0.01
moose.reinit()
moose.start( 20 )

rdes.display()
