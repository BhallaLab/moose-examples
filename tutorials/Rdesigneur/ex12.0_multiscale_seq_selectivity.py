from __future__ import print_function
import moose
import pylab
import numpy as np
import sys
import os
import matplotlib.pyplot as plt
import rdesigneur as rd
from scipy import stats
import time

baseFname = 'Fig6_data'
displayMoogli = False
displayScatter = False
displayRuns = False
dumpSpatialPlotsFlag = False
scatterParamToUseInStats = 0
realStartTime = time.time()
rdes = 0
# All of the spine indices are on path /model/elec/head<idx>
spineStimIndices = [[753, 771], [2475, 2482], [1765, 1778], [3551, 3561]]
# Below are corresponding indices for basal and apical dend trees.
dendBasalRange = [[16, 8] ] # Here the second idx in each pair is # of compt
dendApicalIndices = [[36,2], [70,4], [52, 13] ] # Same indexing as above.

# Stim amplitude is unitless, defined in units of A mol conc.
# Stim Width is unitless, defined as multiple of diffusion length.
# Stim Vel is unitless, defined in terms of diffusion length by  time units of diff constt.
# diffConst is defined in terms of square of diffusion length by unit time.
# diffLength here is in SI units: m^2/s
#


params = {
    'diffusionLength':1.0e-6,  # Diffusion characteristic length, used as voxel length too.
    'dendDiameter': 1e-6,  # Diameter of section of dendrite in model
    'dendLength': 100e-6,   # Length of section of dendrite in model
    'spineSizeScale': 1.0,  # Length scaling for spines. Vol wil be x^3.
    'diffConstCa':100.0e-12,      # Diffusion constant of Ca
    'diffConstMAPK': 5e-12, # Diffusion constant for MAPK
    'diffConstPP': 2e-12, # Diff constant for MAPK-activated phosphatase
    'CaActivateRafKf': 6e6,	# 1/sec.mM: rate for activation of Raf by Ca
    'blankVoxelsAtEnd':10,  # of voxels to leave blank at end of cylinder
    'preStimTime':1.0,      # Time to run before turning on stimulus.
    'stimBurstTime':2.0,    # Time for a stimulus burst
    'postStimTime':10.0,    # Time to run after stimulus. ~3x decay time
    'runtime':20.0,         # Simulation run time
    'checkPoint':1.0,       # How often to do a checkpoint.
    'chemPlotDt':0.05,      # Plotting timestep for chemical signaling.
    'elecPlotDt':0.1e-3,    # Plotting timestep for electrical signaling.
    'spineSpacing':4.0e-6,  # Spacing between spines.
    'stimSpacing':4,        # Stimulus spacing, in terms of # of spines.
    'meanSpikeRate':0.000001,    # Basal mean rate for all synapses.
    'activeSpikeRate':20.0,  # Active input rate on specified synapses.
    'baseGabaSpikeRate':1.0,    # 1 Hz.
    'thetaGabaSpikeRate':0.5, # This is the peak, not the average theta.
    'thetaFreq':8.0, 		# 
    'amparSynapseWeight': 30.0,    #
    'nmdarSynapseWeight': 30.0,   #
    'gabarSynapseWeight': 30.0,    #
    'LCaDensity': 0.0,     # Channel density for LCa channels.
    'adaptorScale':60.0e3, # Adaptor scale factor from conc to Na density in Seimens/m^2.
    'CaPsdScale': 0.08,    # Adaptor scale from psd elec Ca to chem conc.
    'Em': -60.0e-3,     #   Resting potential of neuron
    'refractoryPeriod':0.010,  # 10 ms refractory time.
    'cellModel': 'VHC-neuron.CNG.swc',  # Cell morphology file
    'chemModel': 'NN_mapk15.g',  # Chemical model file.
    'fnumber': 0,  # Output file index
    'seed': 1234,   # Seeds random numbers
    'seqDx': 4.0e-6,    # Sequence spatial interval
    'seqDt': 3.0,       # Sequence time interval
}

# Here we define a string for each of the 5 stimulus timings in sequence:
# Comment in the seq order you want.
seq = [0, 1, 2, 3, 4]   # ordered
#seq = [4, 2, 0, 3, 1]   #scrambled
stimStrList = ["{0} + (t>{1}) * (t<{2}) * {3}".format( 0, params['preStimTime'] + params['seqDt']*seq[idx], params['preStimTime'] + params['stimBurstTime']+ params['seqDt']*seq[idx], params['activeSpikeRate'] ) for idx in range(5) ]

gabaRateExpression = "{} + 2*{} * cos(3.14159*t*{})^2".format( params['baseGabaSpikeRate'], params['thetaGabaSpikeRate'], params['thetaFreq'] )
print( "GRE = ", gabaRateExpression )


plotlist = [
            ['soma', '1', '.', 'Vm', 'Soma Vm'],
            ['head12', '1', 'Ca_conc', 'Ca', 'head2 eCa'],
            ['dend36', '1', 'dend/DEND/P_MAPK', 'conc', 'dend36_P_MAPK'],
        ]

def main():
    global rdes
    global params

    diffusionLength = params['diffusionLength']
    dendLength = params['dendLength']
    diffusionLength = params['diffusionLength']
    library = moose.Neutral( '/library' )

    chanpath = os.path.dirname( os.path.realpath(__file__)) + '/proto21.'
    moose.seed( params['seed'] )
    rdes = rd.rdesigneur(
        useGssa = False,
        turnOffElec = False,
        chemPlotDt = params['chemPlotDt'],
        diffusionLength = diffusionLength,
        spineProto = [['makeExcSpine()', 'spine']],
        chanProto = [
            [ chanpath + 'make_K_AHP()', 'K_AHP' ],
            [ chanpath + 'make_K_A()', 'K_A' ],
            [ chanpath + 'make_K_C()', 'K_C' ],
            [ chanpath + 'make_K_DR()', 'K_DR' ],
            [ chanpath + 'make_Na()', 'Na' ],
            [ chanpath + 'make_Ca_conc()', 'Ca_conc' ],
            [ chanpath + 'make_Ca()', 'Ca' ],
            [ chanpath + 'make_NMDA()', 'NMDA' ],
            [ chanpath + 'make_glu()', 'glu' ],
            [ chanpath + 'make_GABA()', 'GABA' ],
        ],
        chemProto = [[params['chemModel'], 'chem']],
        # branchedCell, name, somaDia, somaLen, dendDia, dendLen, dendNumSeg, branchDia, branchLen, branchNumSeg
        cellProto = [['branchedCell', 'soma', 10e-6, 20e-6, 1.2e-6, 60e-6, 5, 0.6e-6, 100e-6, 5]],
        chanDistrib = [
            ["Ca_conc", "#", "tau", "0.0133" ],
            ["Ca", "#dend#,#basal#,#apical#,#branch#", "Gbar", str( params["LCaDensity"] ) ],
            ["Ca", "#soma#", "Gbar", "40" ],
            ["Na", "#dend#,#basal#", "Gbar", "60" ],
            ["Na", "#soma#", "Gbar", "600" ],
            ["Na", "#apical#,#branch#", "Gbar", "40+40*exp(-p/200e-6)" ],
            ["K_DR", "#dend#,#basal#", "Gbar", "(p < 400e-6)*200" ],
            ["K_DR", "#soma#", "Gbar", "250" ],
            ["K_DR", "#apical#,#branch#", "Gbar", "60+40*(p < 125e-6)" ],
            ["K_AHP", "#", "Gbar", "8" ],
            ["K_C", "#basal#,#dend#,#apical#,#branch#", "Gbar", "50+150*exp(-p/200e-6)" ],
            ["K_C", "#soma#", "Gbar", "100" ],
            ["K_A", "#soma#", "Gbar", "50" ],
            ["K_A", "#dend#,#apical#,#branch#", "Gbar", "50*(1 + 2.0e-6/(dia + 0.1e-6))" ],
            ["GABA", "#apical#,#branch#,#dend#,#basal#", "Gbar", "10 + 30*(p < 125e-6)" ],
        ],
        spineDistrib = [['spine','#dend#,#apical#,#branch#', str(params['spineSpacing']),'-1e-7', str( params['spineSizeScale'] ), '0.0', '0', '0' ]],
        chemDistrib = [
            ['DEND', '#', 'dend', '1', diffusionLength ],
            ['SPINE', '#', 'spine', '1', 'DEND' ],
            ['PSD', '#', 'psd', '1', 'DEND' ]
        ],
        # Ideally should be synced. There should be a way to do this.
        stimList = [
                [ 'head#', str( params['amparSynapseWeight'] ), 'glu', 'randsyn', str( params['meanSpikeRate'] ) ],
                [ 'head#', str( params['nmdarSynapseWeight'] ), 'NMDA', 'randsyn', str( params['meanSpikeRate'] )],
                [ '#', str( params['gabarSynapseWeight'] ), 'GABA', 'randsyn', gabaRateExpression ],
                [ 'head7,head18,head32,head44,head53', '30', 'glu', 'periodicsyn', stimStrList[0]],
                [ 'head8,head20,head30,head45,head54', '30', 'glu', 'periodicsyn', stimStrList[1]],
                [ 'head9,head22,head33,head46,head55', '30', 'glu', 'periodicsyn', stimStrList[2]],
                [ 'head10,head24,head29,head47,head56', '30', 'glu', 'periodicsyn', stimStrList[3]],
                [ 'head11,head26,head31,head48,head57', '30', 'glu', 'periodicsyn', stimStrList[4]],
                [ 'head7,head18,head32,head44,head53', '30', 'NMDA', 'periodicsyn', stimStrList[0]],
                [ 'head8,head20,head30,head45,head54', '30', 'NMDA', 'periodicsyn', stimStrList[1]],
                [ 'head9,head22,head33,head46,head55', '30', 'NMDA', 'periodicsyn', stimStrList[2]],
                [ 'head10,head24,head29,head47,head56', '30', 'NMDA', 'periodicsyn', stimStrList[3]],
                [ 'head11,head26,head31,head48,head57', '30', 'NMDA', 'periodicsyn', stimStrList[4]],
            ],
        adaptorList = [
            [ 'Ca_conc', 'Ca', 'PSD/Ca_input', 'concInit', 2e-6, params['CaPsdScale'] ],
            ['Ca_conc','Ca','DEND/Ca_input','concInit',2.0e-6, 0.0001],
            [ 'DEND/channel_p', 'conc', 'Na', 'modulation', 1.0, params['adaptorScale']],
        ],
        plotList = [
            ['soma', '1', '.', 'Vm', 'Soma Vm'],
            ['#', '1', 'SPINE/Ca', 'conc', 'Chem Ca conc'],
            ['#', '1', 'DEND/P_MAPK', 'conc', 'P_MAPK conc'],
        ],
        moogList = [
            #['#', '1', '.', 'Vm', 'Memb potential'],
            ['#', '1', 'DEND/P_MAPK', 'conc', '[P_MAPK] (uM)',0, 0.15],
            ['#', '1', 'SPINE/Ca', 'conc', '[Ca] (uM)', 0, 0.5, True, 2],
        ]
    )

    ############## Set Ca diffusion const ##########################
    for ca in moose.wildcardFind( '/library/##/Ca[ISA=PoolBase]' ):
        ca.diffConst = params['diffConstCa']

    ############## Set MAPK diffusion const ##########################
    temp = params['diffConstMAPK']
    moose.element( '/library/chem/kinetics/DEND/P_MAPK' ).diffConst = temp
    moose.element( '/library/chem/kinetics/DEND/MAPK' ).diffConst = temp
    ############## Set PP diffusion const ##########################
    temp = params['diffConstPP']
    moose.element( '/library/chem/kinetics/DEND/reg_phosphatase' ).diffConst = temp
    moose.element( '/library/chem/kinetics/DEND/inact_phosphatase' ).diffConst = temp
    ############## Set resting potential ##########################
    for i in moose.wildcardFind( "/library/##[][ISA=CompartmentBase]" ):
        i.Em = params[ 'Em' ]
        i.initVm = params[ 'Em' ]
    ############## Set sensitivity to Ca ##########################
    moose.element( '/library/chem/kinetics/DEND/Ca_activate_Raf' ).Kf = 6e6

    #################### Build the model ##########################
    rdes.buildModel()
    moose.reinit()
    moose.seed( 1 )
    rdes.displayMoogli( 0.01, params['runtime'], 0.0, colormap = 'plasma', mergeDisplays = True, bg = 'default' )

if __name__ == '__main__':
    main()
