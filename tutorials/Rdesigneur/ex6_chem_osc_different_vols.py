	########################################################################
# This example demonstrates a relaxation oscillator emerging from
# cross-compartment traffic. See US Bhalla, Biophysical Journal 2011
# for the theory. 
# Key learning points here: 
#   * Use of chemDistrib for multi-compartment reaction system.
#   * Definition of A as a 'dend' and B as an 'endo' compartment inside A.
#   * Use of 'Compartment' annotation in the chem model definition to 
#     specify that groups A and B become compartments containing reaction
#     systems.
# 
# Copyright (C) Upinder S. Bhalla NCBS 2022
# Released under the terms of the GNU Public License V3.
########################################################################
import moose
import pylab
import rdesigneur as rd
rdes = rd.rdesigneur(
    turnOffElec = True,
    diffusionLength = 1e-3, # Default diffusion length is 2 microns
    chemProto = [['./chem/OSC_different_vols.g', 'osc']],
    chemDistrib = [
        # for dend: [chemComptName, elecComptName, dend, geom, diffusionLen]
        ['A', 'soma', 'dend', '1', 1e-3 ],
        # for endo: [chemComptName, elecComptName, endo, geom, 
        #    surroundMeshName, radiusRatioToSurroundVoxels ]
        ['B', 'soma', 'endo', '1', 'A', 0.794 ],
    ],
    plotList = [
        ['soma', '1', 'A/M_p', 'conc', 'Compt A [M_p]'],
        ['soma', '1', 'B/M_p', 'conc', 'Compt B [M_p]'],
        ['soma', '1', 'A/M', 'conc', 'Compt A [M]'],
        ['soma', '1', 'B/M', 'conc', 'Compt B [M]'],
    ]
)

rdes.buildModel()
moose.reinit()
moose.start( 4000 )

rdes.display()
