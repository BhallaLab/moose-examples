This is a list of files in the Electrophys tutorials directory

ephys1_cable.py:

This is a model of a simple uniform passive cable. It has two plots: one
of membrane potential Vm as a function of time, sampled at four locations 
along the cable, and the other of Vm as a function of position, sampled at
5 times (intervals of 5 ms) during the simulation.
The user can use the sliders to scale the following parameters up and down:
RM
RA
CM
length
diameter

In addition, the user can toggle between a long (steady-state) current
injection stimulus, and a brief pulse of 1 ms.

Finally, when the user hits "Quit" the time-series of the soma compartment
is printed out.

Things to do:
1. Vary diameter, length, RM, CM, RA. Check that the decay behaves as per
	cable theory. Get an intuition for these.
2. Check that lambda (length constant) is according to equations. Check
	how much decay there is for different L (electrotonic length).
2a. Note that if the cable is shorter than L, the signal doesn't decay so
	well. Why?
2b. Convince yourself that you'll never see a passive signal along a long 
	axon.
3. Examine propagation of the depolarization for a brief current pulse.
	Look for the three signatures of propagation along a dendrite.
4. Run a simulation of the long stimulus. When you hit Quit, the program will
	dump the soma potential charging time-course into a file. Check that 
	the tau (time-constant) of the soma is according to equations when the 
	L is very small, but deviates when it is longer. Use Rall's expression 
	for L as a function of the time-courses of soma depolarization.

------------------------------------------------------------------------

ephys2_Rall_law.py:

This explores the implication of Rall's Law and cable branching.
This is a model of a branched cell, compared with the model of a uniform
cylindrical cell. The sliders vary the parameters of the branches. Two 
time-points are displayed; 10 ms and 50 ms.

Things to do:
1. Vary all the passive parameters of branches, see how they affect the
	propagation past the branch point.
2. Match up the branched cell (blue plot/dots) to the cylinder (red line).
	See if the resultant parameters obey Rall's Law.

Todo: - Stimuli in any end or both dend ends.

------------------------------------------------------------------------
Neuronal summation
        * Synaptic input at Y tips and branch point, both I and E.
        * Vary weights (chan cond) We have 6 syns: 6 weights
        * Vary time since start for each. Another 6 controls
        * Vary taus of I. 2 controls.
	* Vary Reversal potentials.
	x Vary threshold of soma. 1 control.
		Put in spiking mechanism
	* Vary length and dia of branches. 4 controls
	* Vary input freq and duration I and E separate. 4 controls.
	- Improve diagram.


	- Show spatial summation of exc input
	- Show sublinear summation and saturation of exc input
	- Show temporal summation of exc input with many spikes
	- Show temporal summation of exc input with 2 inputs at different times
	- Show local inhibition
	- Show efficacy of inhibition as function of time-course
	- Show gating of excitation by junction inhibition
	- Show shunting inhibition
	- Turn on spiking and show AND and OR
	- Turn on spiking and show how different freq inputs cross threshold.
	- Show coincidence detection vs integration (change spiking props?)
	- Change dend length and show somatic effects at different distances.
	- Change dend dia and show somatic effects
	- Show truncation of EPSP by inhib input arriving at diff times.
	- Show EI balance and imbalance

------------------------------------------------------------------------
Spatio-temporal summation: Do with and without NMDAR, also toggle in HH chans.
	- Vary time interval of stim
	- Vary geometric spacing of stim/length of dend
	- Vary amplitude
	- Vary passive props of dend
	- toggle direction or scatter.

------------------------------------------------------------------------

Channel mixer:
        - Modulate the conductance of battery of channels
        - Modulate Ca_conc tau
        - Plot Ca and Vm
        - Set different stim pulse amplitude and duration.

NMDA receptor and associativity:
        - Plot Vm and Ca
        - Give glu and NMDA input different time and different ampl

AP propagation:
        - Vary dia
        - Vary RM, CM, RA
        - Vary channel densities

Squid demo:
        - Already have it.

