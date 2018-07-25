Following scripts failed.

- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/snippets/crossComptSimpleReac.py

```
  Debug: User wants Ksolve with 3 threads
  Debug: User wants Ksolve with 3 threads
  Debug: User wants Ksolve with 3 threads
  timeout: the monitored command dumped core
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/snippets/recurrentIntFire.py

```
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/snippets/loadMorphology.py

```
  Traceback (most recent call last):
    File "/home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/snippets/loadMorphology.py", line 28, in <module>
      import moogli
  ModuleNotFoundError: No module named 'moogli'
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/snippets/insertSpines.py

```
  Traceback (most recent call last):
    File "/home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/snippets/insertSpines.py", line 34, in <module>
      import moogli
  ModuleNotFoundError: No module named 'moogli'
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/izhikevich/demogui_qt.py

```
  Traceback (most recent call last):
    File "/home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/izhikevich/demogui_qt.py", line 48, in <module>
      from PyQt4 import QtGui, QtCore
  ModuleNotFoundError: No module named 'PyQt4'
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/paper-2015/Fig2_elecModels/Fig2D.py

```
  Traceback (most recent call last):
    File "/home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/paper-2015/Fig2_elecModels/Fig2D.py", line 12, in <module>
      import moogli
  ModuleNotFoundError: No module named 'moogli'
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/paper-2015/Fig5_CellMultiscale/Fig5A.py

```
  Traceback (most recent call last):
    File "/home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/paper-2015/Fig5_CellMultiscale/Fig5A.py", line 15, in <module>
      import moogli
  ModuleNotFoundError: No module named 'moogli'
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/neuroml/lobster_pyloric/channels/ChannelTest.py

```
  Selecting a channel randomly form ['H_STG', 'CaS_STG', 'CaT_STG', 'KA_STG', 'Kd_STG', 'Na_STG']
  Selected KA_STG
  Traceback (most recent call last):
    File "/home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/neuroml/lobster_pyloric/channels/ChannelTest.py", line 41, in <module>
      for varidx in range(len(mechanism_vars)/2): # loop over each inf and tau
  TypeError: 'float' object cannot be interpreted as an integer
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/parallelSolver/Fig2_v4.py

```
  Debug: User wants Ksolve with 3 threads
  Debug: User wants Ksolve with 3 threads
  Debug: User wants Ksolve with 3 threads
  Debug: User wants Ksolve with 3 threads
  Warning: Moogli not found. All moogli calls will use dummy functions
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
  Chem part of model has  100 dendrite voxels X 7 pools,
      
  x3*( 5.0*(x1 - 2.0 - (x1-2.0)^3/3 - (x2-0.8) + x0))      
  x2*( (x0-2.0 + 0.7 - 0.8*(x1-0.8))/2.5)      
  x2 * exp( -((x0 - t)^2)/(2* 1.0) )      
  Traceback (most recent call last):
    File "/home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/parallelSolver/Fig2_v4.py", line 222, in <module>
      plotPanelCDEF( [0,1,2,3,4], 3 )
    File "/home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/parallelSolver/Fig2_v4.py", line 171, in plotPanelCDEF
      dt, tplot, avec = runPanelCDEF( 'fhn', 5.0, 0.5, 5, seq, 0.4 )
    File "/home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/parallelSolver/Fig2_v4.py", line 130, in runPanelCDEF
      Z[k].nInit = 1
  KeyError: 'moose_Id_subscript: invalid index.'
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/util/moogli_viewer.py

```
  Traceback (most recent call last):
    File "/home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/util/moogli_viewer.py", line 9, in <module>
      from PyQt4 import QtGui
  ModuleNotFoundError: No module named 'PyQt4'
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/snippets/reacDiffConcGradient.py

```
  Debug: User wants Ksolve with 3 threads
  Debug: User wants Ksolve with 3 threads
  Debug: User wants Ksolve with 3 threads
  timeout: the monitored command dumped core
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/snippets/insertSpinesWithoutRdesigneur.py

```
  Traceback (most recent call last):
    File "/home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/snippets/insertSpinesWithoutRdesigneur.py", line 33, in <module>
      import moogli
  ModuleNotFoundError: No module named 'moogli'
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/snippets/crossComptSimpleReacGSSA.py

```
  timeout: the monitored command dumped core
```
- [ ] /home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/paper-2015/Fig2_elecModels/Fig2E.py

```
  Traceback (most recent call last):
    File "/home/bhalla/dilawars/Work.SVN/GITHUB/DILAWAR/moose-examples/paper-2015/Fig2_elecModels/Fig2E.py", line 12, in <module>
      import moogli
  ModuleNotFoundError: No module named 'moogli'
```
