[![Build Status](https://travis-ci.org/BhallaLab/moose-examples.svg?branch=master)](https://travis-ci.org/BhallaLab/moose-examples).

Examples, tutorial and demo scripts.

# Status of scripts tested by Travis.

## Successful scripts

These scripts ran successfully.

- [ snippets/tabledemo.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/tabledemo.py)
- [ snippets/chemDoseResponse.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/chemDoseResponse.py)
- [ tutorials/ChemicalOscillators/relaxationOsc.py ](https://github.com/BhallaLab/moose-examples/blob/master/tutorials/ChemicalOscillators/relaxationOsc.py)
- [ snippets/wildcard.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/wildcard.py)
- [ snippets/loadSbmlmodel.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/loadSbmlmodel.py)
- [ squid/squid.py ](https://github.com/BhallaLab/moose-examples/blob/master/squid/squid.py)
- [ snippets/threading_demo.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/threading_demo.py)
- [ snippets/loadCspaceModel.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/loadCspaceModel.py)
- [ snippets/stimtable.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/stimtable.py)
- [ snippets/pulsegen.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/pulsegen.py)
- [ snippets/HsolveInstability.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/HsolveInstability.py)
- [ neuroml/lobster_pyloric/channels/ChannelTest.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml/lobster_pyloric/channels/ChannelTest.py)
- [ snippets/cylinderMotor.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/cylinderMotor.py)
- [ tutorials/ChemicalBistables/findSteadyState.py ](https://github.com/BhallaLab/moose-examples/blob/master/tutorials/ChemicalBistables/findSteadyState.py)
- [ snippets/switchKineticSolvers.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/switchKineticSolvers.py)
- [ cuda/testHsolve.py ](https://github.com/BhallaLab/moose-examples/blob/master/cuda/testHsolve.py)

## Failed scripts

These scripts failed to execute successfully on Travis.
- [ parallelSolver/Fig2_v4.py ](https://github.com/BhallaLab/moose-examples/blob/master/parallelSolver/Fig2_v4.py)

```
  No CPU information available. Assuming single core.
  No CPU information available. Assuming single core.
  on node 0, numNodes = 1, numCores = 1
  x3*( 5.0*(x1 - 2.0 - (x1-2.0)^3/3 - (x2-0.8) + x0)) 
  x2*( (x0-2.0 + 0.7 - 0.8*(x1-0.8))/2.5) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) ) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )    + x2 * (t > 71.0 ) * ( t < 171.0 ) 
  x3*( 0.1 + -5.0*x1 + 5.0*x1*x1 + -1.0*x1*x1*x1 + 10.0*x0*x1/(1+x1+10*x2) + -5.0*x1*x2) 
  x2*( 0.1*x0*x0 + -0.01*x1) 
  x2 * exp( -((x0 - t)^2)/(2* 25.0) ) 
  x2 * exp( -((x0 - t)^2)/(2* 25.0) )    + x2 * (t > 125.0 ) * ( t < 225.0 ) 
  x3*( -0.1*x1 + -0.2*x1*x2 + 10.0*x0) 
  x2*( 0.2*x0 + -0.1*x1) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) ) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )    + x2 * (t > 71.0 ) * ( t < 171.0 ) 
  x3*( -0.1*x1 + -1.0*x1*x2 + 10.0*x0) 
  x2*( 2.0*x0 + -0.1*x1) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) ) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )    + x2 * (t > 71.0 ) * ( t < 171.0 ) 
  renaming /library/cell to soma
  Rdesigneur: Elec model has 1 compartments and 0 spines on 1 compartments.
  Chem part of model has the following compartments: 
  In dend, 100 voxels X 7 pools
  x3*( 5.0*(x1 - 2.0 - (x1-2.0)^3/3 - (x2-0.8) + x0))      
  x2*( (x0-2.0 + 0.7 - 0.8*(x1-0.8))/2.5)      
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )      
  Traceback (most recent call last):
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/parallelSolver/Fig2_v4.py", line 222, in <module>
      plotPanelCDEF( [0,1,2,3,4], 3 )
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/parallelSolver/Fig2_v4.py", line 171, in plotPanelCDEF
      dt, tplot, avec = runPanelCDEF( 'fhn', 5.0, 0.5, 5, seq, 0.4 )
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/parallelSolver/Fig2_v4.py", line 130, in runPanelCDEF
      Z[k].nInit = 1
  KeyError: 'moose_Id_subscript: invalid index.'
   after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.44256 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.756015 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.238357 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.217793 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.137438 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.14404 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.1157 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.363065 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.193758 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.912378 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.8205 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.783342 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.396377 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -2.34786 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.726579 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.453356 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -2.24478 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.179534 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.903064 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.218245 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.50529 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.464182 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.13858 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.424203 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.106662 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.52904 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.807648 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.755523 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.608234 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.581258 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.171042 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.366814 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.576253 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.225653 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.952819 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.314735 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.705072 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.104158 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.96237 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.568254 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.259319 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.249467 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.209592 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.950125 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.284524 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.996117 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.06413 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.452593 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.697122 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.780338 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.0473 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.263056 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.416115 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.163031 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.84929 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.694114 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.02172 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.26284 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.31322 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.51398 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.78656 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.28862 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.61958 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.415825 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.20819 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.124769 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.358987 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.341839 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.184726 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.227142 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.866585 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.131008 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.143539 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.975887 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.782526 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.990494 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.33865 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.206081 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.01554 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.12309 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.881757 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.641541 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.250577 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.45065 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.38225 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.586005 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.504503 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.442562 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.756015 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.761643 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.217793 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.137438 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.144043 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.1157 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.636935 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.19376 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.08762 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.179503 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.21666 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.396377 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.652143 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.726579 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.546644 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.24478 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.820466 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.903064 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.218245 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.505292 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.53582 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.86142 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.424203 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.106662 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.987337 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.529037 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.192352 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.755523 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.02551 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.391766 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.581258 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.828958 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.633186 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.423747 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.774347 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.0046 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.685265 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.705072 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.104158 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.04984 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.431746 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.74068 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.750533 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.209592 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.95013 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.715476 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.03089 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.547407 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.697122 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.78034 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.736944 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.583885 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.163031 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.84929 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.694114 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.937406 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.26284 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.31322 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.51398 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.213439 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.288621 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.61958 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.0894 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.584175 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.00695 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.208187 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.875231 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.641013 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.658161 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.919517 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.815274 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.77286 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.133415 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.868992 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.14354 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
```
- [ neuroml/CA1PyramidalCell/CA1.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml/CA1PyramidalCell/CA1.py)

```
  No CPU information available. Assuming single core.
  No CPU information available. Assuming single core.
  on node 0, numNodes = 1, numCores = 1
  moose.nml.neuroml: INFO     Loading neuroml file CA1soma.net.xml 
  moose.nml.neuroml: INFO     Using default temperature of 32.0 degree Celsius
  Traceback (most recent call last):
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/neuroml/CA1PyramidalCell/CA1.py", line 51, in <module>
      loadGran98NeuroML_L123(filename)
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/neuroml/CA1PyramidalCell/CA1.py", line 27, in loadGran98NeuroML_L123
      neuromlR.readNeuroMLFromFile(filename)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NeuroML.py", line 151, in readNeuroMLFromFile
      params=params,lengthUnits=self.lengthUnits)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 93, in readNetworkML
      self.network.findall(".//{"+nml_ns+"}population")
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 92, in <listcomp>
      [ self.createPopulation(pop) for pop in
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 184, in createPopulation
      cellDict = mmlR.readMorphMLFromFile(model_path, self.params)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/MorphML.py", line 79, in readMorphMLFromFile
      cellDict = self.readMorphML(cell,params,lengthUnits)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/MorphML.py", line 507, in readMorphML
      moose_utils.connect_CaConc(compartment_list,\
  AttributeError: module 'moose.utils' has no attribute 'connect_CaConc'
```
- [ neuroml/GranuleCell/Granule98_hsolve.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml/GranuleCell/Granule98_hsolve.py)

```
```
- [ neuroml/GranuleCell/Granule98.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml/GranuleCell/Granule98.py)

```
```
- [ parallelSolver/Fig2_v4.py ](https://github.com/BhallaLab/moose-examples/blob/master/parallelSolver/Fig2_v4.py)

```
  No CPU information available. Assuming single core.
  No CPU information available. Assuming single core.
  on node 0, numNodes = 1, numCores = 1
  x3*( 5.0*(x1 - 2.0 - (x1-2.0)^3/3 - (x2-0.8) + x0)) 
  x2*( (x0-2.0 + 0.7 - 0.8*(x1-0.8))/2.5) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) ) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )    + x2 * (t > 71.0 ) * ( t < 171.0 ) 
  x3*( 0.1 + -5.0*x1 + 5.0*x1*x1 + -1.0*x1*x1*x1 + 10.0*x0*x1/(1+x1+10*x2) + -5.0*x1*x2) 
  x2*( 0.1*x0*x0 + -0.01*x1) 
  x2 * exp( -((x0 - t)^2)/(2* 25.0) ) 
  x2 * exp( -((x0 - t)^2)/(2* 25.0) )    + x2 * (t > 125.0 ) * ( t < 225.0 ) 
  x3*( -0.1*x1 + -0.2*x1*x2 + 10.0*x0) 
  x2*( 0.2*x0 + -0.1*x1) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) ) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )    + x2 * (t > 71.0 ) * ( t < 171.0 ) 
  x3*( -0.1*x1 + -1.0*x1*x2 + 10.0*x0) 
  x2*( 2.0*x0 + -0.1*x1) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) ) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )    + x2 * (t > 71.0 ) * ( t < 171.0 ) 
  renaming /library/cell to soma
  Rdesigneur: Elec model has 1 compartments and 0 spines on 1 compartments.
  Chem part of model has the following compartments: 
  In dend, 100 voxels X 7 pools
  x3*( 5.0*(x1 - 2.0 - (x1-2.0)^3/3 - (x2-0.8) + x0))      
  x2*( (x0-2.0 + 0.7 - 0.8*(x1-0.8))/2.5)      
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )      
  Traceback (most recent call last):
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/parallelSolver/Fig2_v4.py", line 222, in <module>
      plotPanelCDEF( [0,1,2,3,4], 3 )
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/parallelSolver/Fig2_v4.py", line 171, in plotPanelCDEF
      dt, tplot, avec = runPanelCDEF( 'fhn', 5.0, 0.5, 5, seq, 0.4 )
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/parallelSolver/Fig2_v4.py", line 130, in runPanelCDEF
      Z[k].nInit = 1
  KeyError: 'moose_Id_subscript: invalid index.'
  r converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.243985 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.238357 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.217793 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.137438 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.144043 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.115702 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.363065 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.193758 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.179503 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.216658 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.396377 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.652143 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.273421 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.546644 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.244779 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.820466 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.09694 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.21824 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.494708 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.46418 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.86142 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.424203 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.893338 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.470963 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.192352 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.755523 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.974493 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.391766 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.581258 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.828958 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.366814 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.423747 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.77435 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.04718 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.314735 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.705072 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.10416 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.950157 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.96237 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.568254 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.740681 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.249467 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.209592 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.950125 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.71548 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.02927 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.969106 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.06413 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.547407 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.302878 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.78034 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.263056 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.583885 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.16303 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.15071 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.305886 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.91483 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.73716 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.68678 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.48602 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.786561 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.711379 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.61958 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.415825 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.791813 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.124769 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.358987 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.341839 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.919517 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.184726 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.227142 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.133415 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.131008 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.143539 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.975887 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.782526 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.99049 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.05415 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.33865 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.793919 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.01554 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.123092 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.881757 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.641541 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.25058 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.54935 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.617755 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.413995 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.495497 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.557438 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.756015 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.238357 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.21779 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.137438 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.144043 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.115702 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.636935 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.806242 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.179503 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.216658 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.603623 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.652143 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.273421 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.45336 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.755221 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.820466 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.903064 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.21824 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.494708 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.46418 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.13858 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.575797 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.89334 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.470963 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.807648 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.24448 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.974493 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.391766 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.41874 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.171042 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.366814 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.576253 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.225653 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.04718 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.314735 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.29493 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.10416 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.568254 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.259319 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.249467 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.209592 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.284524 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.969106 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.935871 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.547407 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.302878 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -2.21966 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.263056 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.416115 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.163031 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.84929 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.305886 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.978278 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.08517 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.26284 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.31322 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.48602 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.213439 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.711379 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.38042 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -2.0894 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.415825 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.208187 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.87523 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.641013 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.341839 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.919517 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.18473 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.227142 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.133415 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.987166 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.131008 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.856461 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
```
- [ neuroml/CA1PyramidalCell/CA1.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml/CA1PyramidalCell/CA1.py)

```
  No CPU information available. Assuming single core.
  No CPU information available. Assuming single core.
  on node 0, numNodes = 1, numCores = 1
  moose.nml.neuroml: INFO     Loading neuroml file CA1soma.net.xml 
  moose.nml.neuroml: INFO     Using default temperature of 32.0 degree Celsius
  Traceback (most recent call last):
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/neuroml/CA1PyramidalCell/CA1.py", line 51, in <module>
      loadGran98NeuroML_L123(filename)
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/neuroml/CA1PyramidalCell/CA1.py", line 27, in loadGran98NeuroML_L123
      neuromlR.readNeuroMLFromFile(filename)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NeuroML.py", line 151, in readNeuroMLFromFile
      params=params,lengthUnits=self.lengthUnits)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 93, in readNetworkML
      self.network.findall(".//{"+nml_ns+"}population")
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 92, in <listcomp>
      [ self.createPopulation(pop) for pop in
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 184, in createPopulation
      cellDict = mmlR.readMorphMLFromFile(model_path, self.params)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/MorphML.py", line 79, in readMorphMLFromFile
      cellDict = self.readMorphML(cell,params,lengthUnits)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/MorphML.py", line 507, in readMorphML
      moose_utils.connect_CaConc(compartment_list,\
  AttributeError: module 'moose.utils' has no attribute 'connect_CaConc'
```
- [ neuroml/GranuleCell/Granule98_hsolve.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml/GranuleCell/Granule98_hsolve.py)

```
  No CPU information available. Assuming single core.
  No CPU information available. Assuming single core.
  on node 0, numNodes = 1, numCores = 1
```
- [ neuroml/GranuleCell/Granule98.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml/GranuleCell/Granule98.py)

```
    No CPU information available. Assuming single core.
    No CPU information available. Assuming single core.
    on node 0, numNodes = 1, numCores = 1
```
- [ parallelSolver/Fig2_v4.py ](https://github.com/BhallaLab/moose-examples/blob/master/parallelSolver/Fig2_v4.py)

```
  No CPU information available. Assuming single core.
  No CPU information available. Assuming single core.
  on node 0, numNodes = 1, numCores = 1
  x3*( 5.0*(x1 - 2.0 - (x1-2.0)^3/3 - (x2-0.8) + x0)) 
  x2*( (x0-2.0 + 0.7 - 0.8*(x1-0.8))/2.5) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) ) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )    + x2 * (t > 71.0 ) * ( t < 171.0 ) 
  x3*( 0.1 + -5.0*x1 + 5.0*x1*x1 + -1.0*x1*x1*x1 + 10.0*x0*x1/(1+x1+10*x2) + -5.0*x1*x2) 
  x2*( 0.1*x0*x0 + -0.01*x1) 
  x2 * exp( -((x0 - t)^2)/(2* 25.0) ) 
  x2 * exp( -((x0 - t)^2)/(2* 25.0) )    + x2 * (t > 125.0 ) * ( t < 225.0 ) 
  x3*( -0.1*x1 + -0.2*x1*x2 + 10.0*x0) 
  x2*( 0.2*x0 + -0.1*x1) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) ) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )    + x2 * (t > 71.0 ) * ( t < 171.0 ) 
  x3*( -0.1*x1 + -1.0*x1*x2 + 10.0*x0) 
  x2*( 2.0*x0 + -0.1*x1) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) ) 
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )    + x2 * (t > 71.0 ) * ( t < 171.0 ) 
  renaming /library/cell to soma
  Rdesigneur: Elec model has 1 compartments and 0 spines on 1 compartments.
  Chem part of model has the following compartments: 
  In dend, 100 voxels X 7 pools
  x3*( 5.0*(x1 - 2.0 - (x1-2.0)^3/3 - (x2-0.8) + x0))      
  x2*( (x0-2.0 + 0.7 - 0.8*(x1-0.8))/2.5)      
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )      
  Traceback (most recent call last):
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/parallelSolver/Fig2_v4.py", line 222, in <module>
      plotPanelCDEF( [0,1,2,3,4], 3 )
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/parallelSolver/Fig2_v4.py", line 171, in plotPanelCDEF
      dt, tplot, avec = runPanelCDEF( 'fhn', 5.0, 0.5, 5, seq, 0.4 )
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/parallelSolver/Fig2_v4.py", line 130, in runPanelCDEF
      Z[k].nInit = 1
  KeyError: 'moose_Id_subscript: invalid index.'
  after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.442562 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.756015 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.761643 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.782207 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.137438 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.144043 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.884298 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.636935 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.193758 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.179503 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.783342 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.396377 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.652143 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.726579 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.453356 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -2.24478 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.179534 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.781755 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.494708 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.535818 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.13858 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.424203 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.106662 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.529037 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.807648 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.244477 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.974493 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.391766 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.41874 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.828958 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.366814 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.423747 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.22565 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.952819 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.314735 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.705072 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.10416 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.568254 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.259319 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.249467 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.209592 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.284524 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.02927 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.969106 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.935871 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.547407 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.697122 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.219662 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.263056 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.583885 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.163031 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.15071 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.305886 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.91483 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.26284 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.31322 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.48602 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.786561 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.28862 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.38042 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.910604 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.415825 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.00695 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.20819 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.12477 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.358987 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.341839 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.184726 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.227142 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.13341 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.01283 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.868992 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.14354 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.02411 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.78253 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.990494 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.338646 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.206081 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.12309 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.118243 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.641541 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.250577 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.45065 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.617755 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.413995 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.495497 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.55744 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.24398 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.238357 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.217793 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.137438 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.855957 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.115702 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.363065 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.806242 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.912378 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.820497 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.216658 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.396377 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.652143 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.27342 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.546644 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.244779 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.820466 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.09694 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.781755 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.49471 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.53582 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.86142 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.575797 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.10666 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.98734 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.52904 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.807648 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.244477 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.02551 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.391766 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.58126 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.171042 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.633186 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.576253 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.774347 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.995396 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.31473 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.705072 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.104158 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.04984 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.56825 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.25932 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.249467 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.209592 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.950125 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.284524 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.996117 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.452593 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.697122 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.219662 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.952703 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.736944 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.583885 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.836969 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.84929 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.305886 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.26284 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.31322 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.48602 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.21344 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.288621 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.38042 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.41583 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.993052 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.791813 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -1.12477 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra -0.641013 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.341839 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.18473 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 1.22714 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.133415 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.868992 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
  WARNING: Extra 0.856461 molecules in system after converting fractional to integer e.g. 1.1 = 1 (~90% of times) or 2 (~10% of times).
```
- [ neuroml/CA1PyramidalCell/CA1.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml/CA1PyramidalCell/CA1.py)

```
  No CPU information available. Assuming single core.
  No CPU information available. Assuming single core.
  on node 0, numNodes = 1, numCores = 1
  moose.nml.neuroml: INFO     Loading neuroml file CA1soma.net.xml 
  moose.nml.neuroml: INFO     Using default temperature of 32.0 degree Celsius
  Traceback (most recent call last):
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/neuroml/CA1PyramidalCell/CA1.py", line 51, in <module>
      loadGran98NeuroML_L123(filename)
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/neuroml/CA1PyramidalCell/CA1.py", line 27, in loadGran98NeuroML_L123
      neuromlR.readNeuroMLFromFile(filename)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NeuroML.py", line 151, in readNeuroMLFromFile
      params=params,lengthUnits=self.lengthUnits)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 93, in readNetworkML
      self.network.findall(".//{"+nml_ns+"}population")
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 92, in <listcomp>
      [ self.createPopulation(pop) for pop in
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 184, in createPopulation
      cellDict = mmlR.readMorphMLFromFile(model_path, self.params)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/MorphML.py", line 79, in readMorphMLFromFile
      cellDict = self.readMorphML(cell,params,lengthUnits)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/MorphML.py", line 507, in readMorphML
      moose_utils.connect_CaConc(compartment_list,\
  AttributeError: module 'moose.utils' has no attribute 'connect_CaConc'
```
- [ neuroml/GranuleCell/Granule98_hsolve.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml/GranuleCell/Granule98_hsolve.py)

```
  No CPU information available. Assuming single core.
  No CPU information available. Assuming single core.
  on node 0, numNodes = 1, numCores = 1
```
- [ neuroml/GranuleCell/Granule98.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml/GranuleCell/Granule98.py)

```
    No CPU information available. Assuming single core.
    No CPU information available. Assuming single core.
    on node 0, numNodes = 1, numCores = 1
```
- [ izhikevich/demogui_qt.py ](https://github.com/BhallaLab/moose-examples/blob/master/izhikevich/demogui_qt.py)

```
  Traceback (most recent call last):
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/izhikevich/demogui_qt.py", line 50, in <module>
      import PyQt4.Qwt5 as Qwt
  ModuleNotFoundError: No module named 'PyQt4.Qwt5'
```
- [ neuroml/lobster_pyloric/STG_net.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml/lobster_pyloric/STG_net.py)

```
  No CPU information available. Assuming single core.
  No CPU information available. Assuming single core.
  on node 0, numNodes = 1, numCores = 1
  moose.nml.neuroml: INFO     Loading neuroml file Generated.net.xml 
  [INFO] [92mLoading Ca pool CaPool_STG into /library . [0m
  Traceback (most recent call last):
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/neuroml/lobster_pyloric/STG_net.py", line 156, in <module>
      loadRunSTGNeuroML_L123(filename)
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/neuroml/lobster_pyloric/STG_net.py", line 60, in loadRunSTGNeuroML_L123
      neuromlR.readNeuroMLFromFile(filename)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NeuroML.py", line 151, in readNeuroMLFromFile
      params=params,lengthUnits=self.lengthUnits)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 93, in readNetworkML
      self.network.findall(".//{"+nml_ns+"}population")
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 92, in <listcomp>
      [ self.createPopulation(pop) for pop in
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 184, in createPopulation
      cellDict = mmlR.readMorphMLFromFile(model_path, self.params)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/MorphML.py", line 79, in readMorphMLFromFile
      cellDict = self.readMorphML(cell,params,lengthUnits)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/MorphML.py", line 507, in readMorphML
      moose_utils.connect_CaConc(compartment_list,\
  AttributeError: module 'moose.utils' has no attribute 'connect_CaConc'
```
- [ snippets/reacDiffConcGradient.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/reacDiffConcGradient.py)

```
  timeout: the monitored command dumped core
```
- [ snippets/crossComptOscillator.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/crossComptOscillator.py)

```
  No CPU information available. Assuming single core.
  No CPU information available. Assuming single core.
  on node 0, numNodes = 1, numCores = 1
   Solver is added to model path model with ee solver
  1 7 7
  Traceback (most recent call last):
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/snippets/crossComptOscillator.py", line 117, in <module>
      main()
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/snippets/crossComptOscillator.py", line 86, in main
      assert( stoich0.numVarPools == 5 )
  AssertionError
```
- [ neuroml/CA1PyramidalCell/CA1_hsolve.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml/CA1PyramidalCell/CA1_hsolve.py)

```
  No CPU information available. Assuming single core.
  No CPU information available. Assuming single core.
  on node 0, numNodes = 1, numCores = 1
  Traceback (most recent call last):
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/neuroml/CA1PyramidalCell/CA1_hsolve.py", line 57, in <module>
      loadGran98NeuroML_L123(filename,params)
    File "/home1/dilawars/Work/GITHUB/BhallaLab/moose-examples/neuroml/CA1PyramidalCell/CA1_hsolve.py", line 25, in loadGran98NeuroML_L123
      neuromlR.readNeuroMLFromFile(filename,params=params)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NeuroML.py", line 151, in readNeuroMLFromFile
      params=params,lengthUnits=self.lengthUnits)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 93, in readNetworkML
      self.network.findall(".//{"+nml_ns+"}population")
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 92, in <listcomp>
      [ self.createPopulation(pop) for pop in
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/NetworkML.py", line 184, in createPopulation
      cellDict = mmlR.readMorphMLFromFile(model_path, self.params)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/MorphML.py", line 79, in readMorphMLFromFile
      cellDict = self.readMorphML(cell,params,lengthUnits)
    File "/home1/dilawars/Work/GITHUB/DILAWAR/moose-core/_build/python/moose/neuroml/MorphML.py", line 507, in readMorphML
      moose_utils.connect_CaConc(compartment_list,\
  AttributeError: module 'moose.utils' has no attribute 'connect_CaConc'
```

## Broken scripts

These scripts are marked "BROKEN" by one or more developers.

- 
- [snippets/crossComptSimpleReac.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/crossComptSimpleReac.py)- 
- [snippets/crossComptSimpleReacGSSA.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/crossComptSimpleReacGSSA.py)- 
- [snippets/hdfdemo.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/hdfdemo.py)- 
- [snippets/testRdesigneur.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/testRdesigneur.py)- 
- [snippets/testWigglySpines.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/testWigglySpines.py)

## Blacklisted scripts

These scripts were not tested because they require human interaction :-(.

- 
- [paper-2015/Fig2_elecModels/Fig2D.py](https://github.com/BhallaLab/moose-examples/blob/master/paper-2015/Fig2_elecModels/Fig2D.py)- 
- [paper-2015/Fig2_elecModels/Fig2E.py](https://github.com/BhallaLab/moose-examples/blob/master/paper-2015/Fig2_elecModels/Fig2E.py)- 
- [paper-2015/Fig5_CellMultiscale/Fig5A.py](https://github.com/BhallaLab/moose-examples/blob/master/paper-2015/Fig5_CellMultiscale/Fig5A.py)- 
- [snippets/insertSpines.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/insertSpines.py)- 
- [snippets/insertSpinesWithoutRdesigneur.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/insertSpinesWithoutRdesigneur.py)- 
- [snippets/loadMorphology.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/loadMorphology.py)- 
- [traub_2005/py/display_morphology.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/display_morphology.py)- 
- [traub_2005/py/dump_f_i_curves.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/dump_f_i_curves.py)- 
- [traub_2005/py/fig_a2_fs.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/fig_a2_fs.py)- 
- [traub_2005/py/fig_a3.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/fig_a3.py)- 
- [traub_2005/py/gui.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/gui.py)- 
- [traub_2005/py/test_archan.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_archan.py)- 
- [traub_2005/py/test_cachans.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_cachans.py)- 
- [traub_2005/py/test_capool.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_capool.py)- 
- [traub_2005/py/test_deepaxoaxonic.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_deepaxoaxonic.py)- 
- [traub_2005/py/test_deepbasket.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_deepbasket.py)- 
- [traub_2005/py/test_deeplts.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_deeplts.py)- 
- [traub_2005/py/test_hsolve_tcr.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_hsolve_tcr.py)- 
- [traub_2005/py/test_nachans.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_nachans.py)- 
- [traub_2005/py/test_nontuftedrs.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_nontuftedrs.py)- 
- [traub_2005/py/test_nrt.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_nrt.py)- 
- [traub_2005/py/test_singlecomp.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_singlecomp.py)- 
- [traub_2005/py/test_spinystellate.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_spinystellate.py)- 
- [traub_2005/py/test_supaxoaxonic.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_supaxoaxonic.py)- 
- [traub_2005/py/test_supbasket.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_supbasket.py)- 
- [traub_2005/py/test_suplts.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_suplts.py)- 
- [traub_2005/py/test_suppyrfrb.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_suppyrfrb.py)- 
- [traub_2005/py/test_suppyrrs.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_suppyrrs.py)- 
- [traub_2005/py/test_tcr.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_tcr.py)- 
- [traub_2005/py/test_tuftedib.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_tuftedib.py)- 
- [traub_2005/py/test_tuftedrs.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/test_tuftedrs.py)- 
- [traub_2005/py/vclamptest.py](https://github.com/BhallaLab/moose-examples/blob/master/traub_2005/py/vclamptest.py)- 
- [util/moogli_viewer.py](https://github.com/BhallaLab/moose-examples/blob/master/util/moogli_viewer.py)

