#!/usr/bin/env python
# coding: utf-8

# In[1]:


#This program creates a sequence detecting LIF neuron.
#We can see the shapes of the membrane potential produced by various kernels. 
#The connections are set up such that the first synapse receives a spike at 3s, second at 4s and third at 5s.
#The connections, kernel and seqDt can be varied to obtain different results. 

#Author: Upinder Bhalla, Prakriti Parthasarathy
#Date: Friday, July 22nd 2022

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 3, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street, Fifth
# Floor, Boston, MA 02110-1301, USA.



import sys
import os
import moose
import matplotlib.pyplot as plt
import numpy as np

RUNTIME = 30
SYN_WEIGHT = 0.01
        

#creating the LIF neuron

def seqCell(stimTimes):
    model = moose.Neutral('/model')
    
    seq = moose.LIF( '/model/seq' )
    seq.Rm = 1e8
    seq.Cm = 1e-9
    
    synh = moose.SeqSynHandler( '/model/seq/synh' )
    synh.historyTime = 5
    synh.kernelEquation =  "x==t"#"(10 - 5*max((x-t), 0))"
    synh.kernelWidth = 5
    synh.synapse.num = 10
    for ii in range( synh.synapse.num ):
        synh.synapse[ii].weight = SYN_WEIGHT
        synh.synapse[ii].delay = 0
    synh.seqDt = 1
    synh.baseScale = 0.0
    synh.sequenceScale = 1.0
    synh.plasticityScale = 0.0
    synh.synapseOrderOption = -1
    nk = np.array( synh.kernel )
    nk.shape = ( len(nk)//synh.kernelWidth, synh.kernelWidth )
    print( nk, "\n")
    moose.connect( synh, 'activationOut', seq, 'activation' )


    plots = moose.Neutral( '/plots' )
    plot2 = moose.Table( '/plots/p2' )
    plot3 = moose.Table( '/plots/p3' )
     
       
    
    moose.connect( plot2, 'requestOut', seq, 'getVm' ) #Vm of seq
    moose.connect( plot3, 'requestOut', synh, 'getSeqActivation' ) #synapse activation of seq due to 1st input

    moose.reinit()
    
    for idx, vv in enumerate( stimTimes ):
        for tt in vv:  
            synh.synapse[idx].addSpike( tt )
            print("idx", idx, "tt", tt)
  
    moose.start( RUNTIME )

def main():
    seqCell([[3], [4], [5]])
   



    plot2 = moose.element( '/plots/p2' )
    plot3 = moose.element( '/plots/p3' )


    dt = plot2.dt

    plt.figure()
    t = np.linspace( 0, RUNTIME, len( plot2.vector ) )

    plt.plot( t, plot2.vector )
    plt.title( "SeqSynHandler- Membrane potential" )
    plt.xlabel( "time (s)" )
    plt.ylabel( "Vm (mV)" )
    plt.figure()
    plt.title( "SeqSynHandler- Synaptic Activation" )
    plt.xlabel( "time (s)" )
    plt.ylabel( "synapse activation (arb units)" )
    plt.plot( t, plot3.vector )
    
    
    
    plt.show()

if __name__ == "__main__":
    main()

