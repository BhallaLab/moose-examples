This is a list of the files in this directory. 
The detailed account of the models here is provided in the MOOSE online
documentation at

https://moose.ncbs.res.in/readthedocs/install/user/py/cookbook/Rd.html

ex1_minimalModel.py: Bare Rdesigneur: single passive compartment
	No graphics. Suggestions: 
	- Modify to print out the parameters of the compartment.
	- Change default values.

ex2_currentPulse.py: Simulate and display current pulse to soma
	Introduces stimulus and plotting.
	Suggestion: Play with the stimulus parameters. Can you put in a
	current ramp? Plot it too.

ex2.1_vclamp.py: Show how to do voltage clamp (vclamp) stimulus and plotting,
	on the passive soma. Illustrates the capacitive transients.

ex3_squid.py: HH Squid model in a single compartment
	Add HH ion channels to the compartment model, plot action potentials. 
	Suggestion: Play with the stimulus parameters. 
	- Change injection current.
	- Put in a protocol to get rebound action potential.
	- Put in a current ramp, and run it for a different duration
	- Put in a frequency chirp, and see how the squid model is tuned to
	a certain frequency range.
	- Modify channel or passive parameters. See if it still fires. 
	Try the frequency chirp on the modified cell, is it retuned?

ex3.1.squid_vclamp.py: Voltage clamp on HH Squid model in a single compartment.
	Here we add a voltage clamp circuit to the HH Squid model, and 
	monitor the holding current.
	Suggestions: 
	- Monitor individual channel currents through additional plots.
	- Convert this into a voltage clamp series. Easiest way to do this is
	to complete the rdes.BuildModel, then delete the Function object 
	on the /model/elec/soma/vclamp. Now you can simply set the 'command'
	field of the vclamp in a for loop, going from -ve to +ve voltages.
	Remember, SI units. You may wish to capture the plot vectors each
	cycle. The plot vectors are accessed by something like
		moose.element( '/model/graphs/plot1' ).vector

ex3.2_squid_axon_propgn.py: Set up a long spiral axon with HH channels. 
	Inject current at 
	the soma in order to trigger periodic action potentials propagating 
	down the axon. Display using moogli as well as plotting the output 
	at a few points.

ex3.3_AP_collision.py: Same as 3.2: a long spiral axon. This time we deliver 
	current injection at two points, the soma and a point along the axon. 
	Watch how the AP is triggered bidirectionally and observe what happens 
	when two action potentials bump into each other.
	
ex3.4_myelinated_axon.py: Set up a long spiral myelinated axon with 
	HH channels, odd though this combination is. Inject current at the 
	soma. Display using moogli as well as plotting the output at a few 
	points.  Note that we get failure of propagation through nodes of 
	Ranvier on some of the somatic action potentials.

ex4.0_scaledSoma.py: This is very similar to ex3, but it introduces a 
	different way to define the soma and its diameter and length, in
	the cellProto argument. The diameter and length are optional.

ex4.1_ballAndStick.py: This shows how to make a ball-and-stick model of a 
	neuron using a cellProto definition line. Things to try:
	- Change length
	- Change number of segments. Explore what it does to accuracy. How
		will you know that you have an accurate model?

ex4.2_ballAndStickSpeed.py: This is very similar to 4.1, but it runs
	much longer to give you a chance to benchmark your system. It also
	illustrates how to generate an interesting sine-wave stimulus.
	Things to try:
	- How slow does it get if you turn on the 3-D moogli display?
	- Is it costlier to run 2 compartments for 1000 seconds, or 
		200 compartments for 10 seconds?

rdes_ex4.py: Reaction system in a single compartment. This is a simple
	chemical oscillator system. Put in chem equations.
	
rdes_ex5.py: Reaction-diffusion system. This is the same oscillator, but
	now in a length of dendrite so we get travelling waves.
	Suggestions:
	**- Play with the diffusionLength term. See what happens if it is too
	sparse or too fine.
	- See how to give different initial conditions. For example, what if 
	the oscillations start from the middle?
	- Replace the built in chemical oscillator with just a simple diffusing
	molecule concentrated in the middle or one end. Convince yourself 
	that diffusion happens as you expect.
	- Put instead an initial linear gradient of molecules. 
	- Elaborate the single molecule with a reaction so that there is a
	buffered source of molecules at one end, and a sink at the other. Does
	this system make sense?

rdes_ex5.1.py: Reaction-diffusion system. This is an illustration of simple
	diffusion of a molecule that starts out bunched up to the left of the
	cylinder.

rdes_ex6.py:Make a toy multiscale model with electrical and chemical signaling.
	This is a non-physiological model but illustrates how to set up
	such models.

rdes_ex7.py: Morphology: Load .swc morphology file and view it
	Illustrates loading a file in rdesigneur. You've already seen how to
	make a moogli viewer.
	Suggestion: Grab another morphology file from NeuroMorpho.org. Make a
	temporary copy of rdes_ex7.py and replace the file name, to view the
	other file.

rdes_ex8.py: Build an active neuron model by putting channels into a 
	morphology file. 
	Same as above except now we distribute ion channels over different
	parts of the cell morphology. In addition we illustrate how to  use
	Moogli to display both voltage and Ca influx. The units of Ca are
	arbitrary.
	Suggestion: 
	- Try another morphology file. 
	- Try different channel distributions by editing the chanDistrib lines.
	- Deliver stimuli on the dendrites rather than the soma.

rdes_ex9.py: Build a spiny neuron from a morphology file and put active 
	channels in it.
	Same as above except now we also insert spines, using the spineDistrib
	keyword.
	Suggestions: 
	- Try different spine settings. Warning: if you put in too many spines
	it will take much longer to load and run!
	- Try different spine geometry layouts. 
	- See if you can deliver the current injection to the spine. Hint: the
	name of the spine compartments is 'head#' where # is the index of the
	spine.
	
To come:
rdes_ex10.py: Build a spiny neuron, and insert the oscillatory chemical model
	into it. Unfortunately Moogli cannot yet plot the chemical waves 
	going up and down in the dendrites. This example is not yet
	displayed on the web documentation.


rdes_ex11.py: Build a cylindrical dend. Put in ion channels
	for activity including VGCC-driven Ca influx. Put in an adaptor to
	take elec Ca and control chem Ca with that. Put in a reaction so Ca
	turns on an enzyme that phosphorylates a chem pool that represents 
	KA and disables it. Put in an adaptor from the dephosphorylated KA 
	to the electrical KA to control its conductance. Together, this should
	flip into a state of sustained activity when the Ca gets high enough.
	Plot Vm, Ca, KA

rdes_ex12.py: Build a cylindrical dend with a spine on it. Put in ion channels
	for activity including NMDAR-driven Ca influx. Put in a reaction to
	take Ca in the spine to activate CaMKII, and CaMKII to control a 
	reaction that phosphorylates stargazin and expands the spine. 
	See how the conductance etc increases.
	Use Moogull to plot spine as it expands, with colour displaying the Ca.
	- Implement importing of proto python file and using simple syntax to
	call the creation functions
	- Implement synaptic input as synUniform and synPoisson. Or put in as
	chan prototypes?

