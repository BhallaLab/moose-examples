This is a list of the files in this directory. 
The detailed account of the models here is provided in the MOOSE online
documentation at

https://moose.ncbs.res.in/readthedocs/install/user/py/cookbook/Rd.html

rdes_ex1.py: Bare Rdesigneur: single passive compartment
	No graphics. Suggestion: Modify to print out the parameters of the
	compartment.
	- Change default values.

rdes_ex2.py: Simulate and display current pulse to soma
	Introduces stimulus and plotting.
	Suggestion: Play with the stimulus parameters. Can you put in a
	current ramp? Plot it too.

rdes_ex3.py: HH Squid model in a single compartment
	Add HH ion channels to the compartment model, plot action potentials. 
	Suggestion: Play with the stimulus parameters. 
	- Change injection current.
	- Put in a protocol to get rebound action potential.
	- Put in a current ramp, and run it for a different duration
	- Put in a frequency chirp, and see how the squid model is tuned to
	a certain frequency range.
	- Modify channel or passive parameters. See if it still fires. 
	Try the frequency chirp on the modified cell, is it retuned?

rdes_ex3.1.py: Set up a long spiral axon with HH channels. Inject current at 
	the soma in order to trigger periodic action potentials propagating 
	down the axon. Display using moogli as well as plotting the output 
	at a few points.
	
rdes_ex3.2.py: Set up a long spiral myelinated axon with HH channels, odd
	though this combination is. Inject current at the soma. Display using 
	moogli as well as plotting the output at a few points.
	Note that we get failure of propagation through nodes of Ranvier on
	some of the somatic action potentials.

rdes_ex3.3.py: Same as 3.1: a long spiral axon. This time we deliver current
	injection at two points, the soma and a point along the axon. Watch
	how the response goes bidirctionally and observe what happens when
	two action potentials bump into each other.

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
	
rdes_ex10.py: Build a spiny neuron, and insert the oscillatory chemical model
	into it. Unfortunately Moogli cannot yet plot the chemical waves 
	going up and down in the dendrites. This example is not yet
	displayed on the web documentation.


