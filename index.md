[![Build Status](https://travis-ci.org/BhallaLab/moose-examples.svg?branch=master)](https://travis-ci.org/BhallaLab/moose-examples).

Examples, tutorial and demo scripts.

# Status of scripts tested by Travis.

## Successful scripts

These scripts ran successfully.

- [ neuroml2/run_hhcell.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml2/run_hhcell.py)
- [ neuroml2/run_cell.py ](https://github.com/BhallaLab/moose-examples/blob/master/neuroml2/run_cell.py)

## Failed scripts

These scripts failed to execute successfully on Travis.
- [ izhikevich/demogui_qt.py ](https://github.com/BhallaLab/moose-examples/blob/master/izhikevich/demogui_qt.py)

```
```
- [ parallelSolver/Fig2_v4.py ](https://github.com/BhallaLab/moose-examples/blob/master/parallelSolver/Fig2_v4.py)

```
  moose.nml.neuroml: INFO     Loading neuroml file allChannelsCell.net.xml 
  INFO:moose.nml.neuroml:Loading neuroml file allChannelsCell.net.xml 
  moose.nml.neuroml: INFO     Using default temperature of 32.0 degree Celsius
  INFO:moose.nml.neuroml:Using default temperature of 32.0 degree Celsius
  INFO:root:Reading morphology from /home1/dilawars/Work.SVN/GITHUB/BhallaLab/moose-examples/neuroml/allChannelsCell/cells_channels/Granule_98.morph.xml
  INFO:root:Loading cell Granule_98 into /library .
  INFO:root:readMorphML using combineSegments = False
  INFO:root:Loading mechanism Gran_KDr_98 into library.
  INFO:root:Loading mechanism Gran_H_98 into library.
  INFO:root:Loading mechanism Gran_CaHVA_98 into library.
  INFO:root:Loading mechanism Gran_KCa_98 into library.
```

## Broken scripts

These scripts are marked "BROKEN" by one or more developers.

- 
- [snippets/crossComptOscillator.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/crossComptOscillator.py)- 
- [snippets/crossComptSimpleReac.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/crossComptSimpleReac.py)- 
- [snippets/crossComptSimpleReacGSSA.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/crossComptSimpleReacGSSA.py)- 
- [snippets/hdfdemo.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/hdfdemo.py)- 
- [snippets/reacDiffConcGradient.py](https://github.com/BhallaLab/moose-examples/blob/master/snippets/reacDiffConcGradient.py)- 
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

