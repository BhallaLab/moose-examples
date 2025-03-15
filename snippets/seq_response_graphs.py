#!/usr/bin/env python
# coding: utf-8

# In[1]:


#This program sets up an LIF neuron that is sequence selective temporally. 
#Currently it will give the maximum response for a reverse sequence and 
#both forward as well as any scrambled sequence will not give as amplified a response, allowing us
#to pick out the reverse sequence from the rest.
#A sequence of 4 is given for each of the cases. The sequence selecting threshold in this case is -0.04 mV.
#The connections are set up such that the first synapse is activated at the time value of the first spike, 
#second synapse is activated at the time value of the second spike and so on.

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



import numpy as np
import matplotlib.pyplot as plt
import moose
from itertools import permutations


RUNTIME = 30.0
SYN_WEIGHT = 0.01

# Creating a LIF neuron that processes sequential input:

def makeSeqCell():
    seq = moose.LIF( '/seq' )
    seq.Rm = 1e8
    seq.Cm = 1e-9
    syn = moose.SeqSynHandler( '/seq/syn' )
    syn.historyTime = 5
    syn.kernelEquation = "(x==t)*10 +  (x<t)*-10 + (x>t)*-10"
    syn.kernelWidth = 5
    syn.synapse.num = 10
    for ii in range( syn.synapse.num ):
        syn.synapse[ii].weight = SYN_WEIGHT
        syn.synapse[ii].delay = 0
    syn.seqDt = 1
    syn.baseScale = 0.0
    syn.sequenceScale = 1.0
    syn.plasticityScale = 0.0
    syn.synapseOrderOption = -1
    nk = np.array( syn.kernel )
    nk.shape = ( len(nk)//syn.kernelWidth, syn.kernelWidth )
    print( nk, "\n") #Printing out the kernel
    moose.connect( syn, 'activationOut', seq, 'activation' )
    plots = moose.Neutral( '/plots' )
    plot2 = moose.Table( '/plots/p2' )
    plot3 = moose.Table( '/plots/p3' )
    moose.connect( plot2, 'requestOut', seq, 'getVm' )
    moose.connect( plot3, 'requestOut', syn, 'getSeqActivation' )

def runSeq( seqDt, stimTimes, runtime ):
    moose.reinit()
    stimTimes = [ [1+ii*seqDt, 20-ii*seqDt] for ii in range(4)]
    print( stimTimes )
    syn = moose.element( '/seq/syn' )
    syn.seqDt = seqDt
    for idx, vv in enumerate( stimTimes ):
        for tt in vv:
            syn.synapse[idx].addSpike( tt )
    moose.start( runtime )
    vec = np.array( moose.element( '/plots/p2' ).vector )
    middle = len( vec ) // 2
    return max(vec[:middle]), max( vec[middle:] )


def main():
    stimTimes = [[1, 18], [2, 17], [3, 16], [4, 15]] #sequence of 4 is given to 4 synapses in both forward and reverse order
    dts = [ 0.1, 0.2, 0.4, 0.6, 0.8, 0.9, 1.0, 1.1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4 ]

    makeSeqCell() 

    h1 = []
    h2 = []

    for seqDt in dts:
        r1, r2 = runSeq( seqDt, stimTimes, RUNTIME )
        h1.append( r1 )
        h2.append( r2 )


    moose.start( RUNTIME )
    
    
    plt.figure()
    plt.plot( dts, h1, 'g' )
    plt.title( "Forward sequences" )
    plt.xlabel( "seqDt (s)" )
    plt.ylabel( "max Vm (mV)" )
    plt.ylim( -0.07, -0.0003 )
    plt.figure()
    plt.plot( dts, h2, 'g' )
    plt.title( "Reverse sequences" )
    plt.xlabel( "seqDt (s)" )
    plt.ylabel( "max Vm (mV)" )
    plt.ylim( -0.07, -0.0003 )



    plt.show()

if __name__ == "__main__":
    main()

