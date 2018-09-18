[![Build Status](https://travis-ci.org/BhallaLab/moose-examples.svg?branch=master)](https://travis-ci.org/BhallaLab/moose-examples).

Examples, tutorial and demo scripts.

# Status of scripts tested by Travis.

## Successful scripts

These scripts ran successfully.

- [ neuroml2/run_cell.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml2/run_cell.py)
- [ snippets/chemDoseResponse.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/chemDoseResponse.py)
- [ snippets/cspaceSteadyState.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/cspaceSteadyState.py)
- [ snippets/threading_demo.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/threading_demo.py)
- [ snippets/startstop.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/startstop.py)
- [ tutorials/ChemicalBistables/doseResponse.py ](https://github.com/BhallaLab/moose-examples/blob/master/tutorials/ChemicalBistables/doseResponse.py)
- [ neuroml2/run_hhcell.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml2/run_hhcell.py)
- [ izhikevich/demogui_qt.py ](https://github.com/BhallaLab/moose-examples/blob/master/izhikevich/demogui_qt.py)

## Failed scripts

These scripts failed to execute successfully on Travis.
- [ izhikevich/demogui_qt.py ](https://github.com/BhallaLab/moose-examples/blob/master/izhikevich/demogui_qt.py)

```
  Traceback (most recent call last):
    File "/home/bhalla/dilawars/Work/GITHUB/BhallaLab/moose-examples/izhikevich/demogui_qt.py", line 50, in <module>
      import PyQt4.Qwt5 as Qwt
  ImportError: No module named Qwt5
```
- [ snippets/crossComptOscillator.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/crossComptOscillator.py)

```
```
- [ snippets/reacDiffConcGradient.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/reacDiffConcGradient.py)

```
```
- [ snippets/crossComptOscillator.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/crossComptOscillator.py)

```
  Totals:    2.98096e+08    6.02214e+06    
  gamma [2,5]((0.5,0.5,-0.5,1,0),(0,0,1,0,1))
  Nr [3,5]((-1,-1,0,0,1),(0,-2,2,-1,1),(0,0,0,-1,1))
  LU [5,10]((-1,-1,0,0,1,1,0,0,0,0),(0,-2,2,-1,1,1,1,0,0,0),(0,0,0,-1,1,0,0,1,0,0),(0,0,0,0,0,0.5,0.5,-0.5,1,0),(0,0,0,0,0,0,0,1,0,1))
```
- [ snippets/reacDiffConcGradient.py ](https://github.com/BhallaLab/moose-examples/blob/master/snippets/reacDiffConcGradient.py)

```
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

