This is a list of files in the Electrophys tutorials directory

ephys1_cable.py:

This is a model of a simple uniform passive cable. It displays the
membrane potential at intervals of 5 ms in plots coloured blue through maroon.
The user can scale the following parameters up and down:
RM
RA
CM
length
diameter

In addition, the user can toggle between a long (steady-state) current
injection stimulus, and a brief pulse of 1 ms followed by a negative pulse
for another 1 ms. 

Finally, when the user hits "Quit" the time-series of the soma compartment
is printed out.

Todo: add time-series of 5 sample points.

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
4. Dump the soma potential into a file. Check that the tau (time-constant) 
	of soma is according to equations when the L is very small, 
	but deviates when it is longer. Use Rall's expression for L as a 
	function of the time-courses of soma depolarization.
 

Rall's law:
This is a model of a branched cell, compared with the model of a uniform
cylindrical cell. The sliders vary the parameters of the branches. Two 
time-points are displayed; 10 ms and 50 ms.

Things to do:
1. Vary all the passive parameters of branches, see how they affect the
	propagation past the branch point.
2. Match up the branched cell (blue plot/dots) to the cylinder (red line).
	See if the resultant parameters obey Rall's Law.

Todo: - Stimuli in any end or both dend ends.

Neuronal summation
        - Synaptic input at Y tips and branch point, both I and E.
        - Vary weights
        - Vary time since start for each.
        - Vary taus of I.
        - Have spiking soma, to set up thresholding as an option.

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

