//genesis
// kkit Version 11 flat dumpfile
 
// Saved on Mon Jan 24 21:51:29 2022
 
include kkit {argv 1}
 
FASTDT = 0.0001
SIMDT = 0.0005
CONTROLDT = 0.2
PLOTDT = 0.2
MAXTIME = 50
TRANSIENT_TIME = 10
VARIABLE_DT_FLAG = 1
DEFAULT_VOL = 1e-20
VERSION = 11.0
setfield /file/modpath value /home2/bhalla/scripts/modules
kparms
 
//genesis

initdump -version 3 -ignoreorphans 1
simobjdump doqcsinfo filename accessname accesstype transcriber developer \
  citation species tissue cellcompartment methodology sources \
  model_implementation model_validation x y z
simobjdump table input output alloced step_mode stepsize x y z
simobjdump xtree path script namemode sizescale
simobjdump xcoredraw xmin xmax ymin ymax
simobjdump xtext editable
simobjdump xgraph xmin xmax ymin ymax overlay
simobjdump xplot pixflags script fg ysquish do_slope wy
simobjdump group xtree_fg_req xtree_textfg_req plotfield expanded movealone \
  link savename file version md5sum mod_save_flag x y z
simobjdump geometry size dim shape outside xtree_fg_req xtree_textfg_req x y \
  z
simobjdump kpool DiffConst CoInit Co n nInit mwt nMin vol slave_enable \
  geomname xtree_fg_req xtree_textfg_req x y z
simobjdump kreac kf kb notes xtree_fg_req xtree_textfg_req x y z
simobjdump kenz CoComplexInit CoComplex nComplexInit nComplex vol k1 k2 k3 \
  keepconc usecomplex notes xtree_fg_req xtree_textfg_req link x y z
simobjdump stim level1 width1 delay1 level2 width2 delay2 baselevel trig_time \
  trig_mode notes xtree_fg_req xtree_textfg_req is_running x y z
simobjdump xtab input output alloced step_mode stepsize notes editfunc \
  xtree_fg_req xtree_textfg_req baselevel last_x last_y is_running x y z
simobjdump kchan perm gmax Vm is_active use_nernst notes xtree_fg_req \
  xtree_textfg_req x y z
simobjdump transport input output alloced step_mode stepsize dt delay clock \
  kf xtree_fg_req xtree_textfg_req x y z
simobjdump proto x y z
simobjdump text str
simundump geometry /kinetics/geometry 0 1e-20 3 sphere "" white black 0 0 0
simundump geometry /kinetics/geometry[1] 0 1e-18 3 sphere "" white black 0 0 \
  0
simundump geometry /kinetics/geometry[2] 0 9e-20 3 sphere "" white black 0 0 \
  0
simundump text /kinetics/notes 0 ""
call /kinetics/notes LOAD \
""
simundump text /kinetics/geometry/notes 0 ""
call /kinetics/geometry/notes LOAD \
""
simundump text /kinetics/geometry[1]/notes 0 ""
call /kinetics/geometry[1]/notes LOAD \
""
simundump text /kinetics/geometry[2]/notes 0 ""
call /kinetics/geometry[2]/notes LOAD \
""
simundump group /kinetics/PSD 0 20 black x 0 0 "" PSD defaultfile.g 0 0 0 27 \
  12 0
simundump text /kinetics/PSD/notes 0 Compartment
call /kinetics/PSD/notes LOAD \
"Compartment"
simundump kpool /kinetics/PSD/Ca 0 1e-10 0.1 0.1 0.6 0.6 0 0 6 0 \
  /kinetics/geometry 53 0 -16 6 0
simundump text /kinetics/PSD/Ca/notes 0 ""
call /kinetics/PSD/Ca/notes LOAD \
""
simundump kpool /kinetics/PSD/Ca_input 0 0 0.08 0.08 0.48 0.48 0 0 6 4 \
  /kinetics/geometry 55 black -10 2 0
simundump text /kinetics/PSD/Ca_input/notes 0 ""
call /kinetics/PSD/Ca_input/notes LOAD \
""
simundump kreac /kinetics/PSD/Ca_stim 0 500 10 "" white black -13 4 0
simundump text /kinetics/PSD/Ca_stim/notes 0 ""
call /kinetics/PSD/Ca_stim/notes LOAD \
""
simundump group /kinetics/PSD/CaM 1 blue 20 x 0 0 "" defaultfile \
  defaultfile.g 0 fbb0ff81553508bc01f3dd51428742fb 0 -28 11 0
simundump text /kinetics/PSD/CaM/notes 0 ""
call /kinetics/PSD/CaM/notes LOAD \
""
simundump kpool /kinetics/PSD/CaM/CaM 1 5e-13 40 40 240 240 0 0 6 0 \
  /kinetics/geometry pink blue -24 13 0
simundump text /kinetics/PSD/CaM/CaM/notes 0 \
  "There is a LOT of this in the cell: upto 1% of total protein mass. (Alberts et al)\nSay 25 uM. Meyer et al Science 256 1199-1202 1992 refer to studies saying\nit is comparable to CaMK levels. \n"
call /kinetics/PSD/CaM/CaM/notes LOAD \
"There is a LOT of this in the cell: upto 1% of total protein mass. (Alberts et al)" \
"Say 25 uM. Meyer et al Science 256 1199-1202 1992 refer to studies saying" \
"it is comparable to CaMK levels. " \
""
simundump kreac /kinetics/PSD/CaM/CaM-Ca3-bind-Ca 1 0.3 10 "" white blue -10 \
  10 0
simundump text /kinetics/PSD/CaM/CaM-Ca3-bind-Ca/notes 0 \
  "Use K3 = 21.5 uM here from Stemmer and Klee table 3.\nkb/kf =21.5 * 6e5 so kf = 7.75e-7, kb = 10\n24 Sep 2015\nThis is a bit too low affinity. Changing to match K2 at \nKd = 2.8."
call /kinetics/PSD/CaM/CaM-Ca3-bind-Ca/notes LOAD \
"Use K3 = 21.5 uM here from Stemmer and Klee table 3." \
"kb/kf =21.5 * 6e5 so kf = 7.75e-7, kb = 10" \
"24 Sep 2015" \
"This is a bit too low affinity. Changing to match K2 at " \
"Kd = 2.8."
simundump kpool /kinetics/PSD/CaM/CaM-Ca3 1 1e-12 0 0 0 0 0 0 6 0 \
  /kinetics/geometry hotpink blue -12 13 0
simundump text /kinetics/PSD/CaM/CaM-Ca3/notes 0 ""
call /kinetics/PSD/CaM/CaM-Ca3/notes LOAD \
""
simundump kreac /kinetics/PSD/CaM/CaM-bind-Ca 1 1.4141 8.4853 "" white blue \
  -22 10 0
simundump text /kinetics/PSD/CaM/CaM-bind-Ca/notes 0 \
  "Lets use the fast rate consts here. Since the rates are so different, I am not\nsure whether the order is relevant. These correspond to the TR2C fragment.\nWe use the Martin et al rates here, plus the Drabicowski binding consts.\nAll are scaled by 3X to cell temp.\nkf = 2e-10 kb = 72\nStemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11.\nIf kb=72, kf = 2e-10 (Exactly the same !)...."
call /kinetics/PSD/CaM/CaM-bind-Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not" \
"sure whether the order is relevant. These correspond to the TR2C fragment." \
"We use the Martin et al rates here, plus the Drabicowski binding consts." \
"All are scaled by 3X to cell temp." \
"kf = 2e-10 kb = 72" \
"Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11." \
"If kb=72, kf = 2e-10 (Exactly the same !)" \
"" \
"19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into" \
"two steps, each binding 1 Ca. This improves numerical" \
"stability and is conceptually better too." \
"" \
"Overall rates are the same, so each kf and kb is the " \
"square root of the earlier ones. So" \
"kf = 1.125e-4, kb = 8.4853" \
""
simundump kpool /kinetics/PSD/CaM/CaM-Ca2 1 1e-12 0 0 0 0 0 0 6 0 \
  /kinetics/geometry pink blue -16 13 0
simundump text /kinetics/PSD/CaM/CaM-Ca2/notes 0 \
  "This is the intermediate where the TR2 end (the high-affinity end) has\nbound the Ca but the TR1 end has not."
call /kinetics/PSD/CaM/CaM-Ca2/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has" \
"bound the Ca but the TR1 end has not."
simundump kreac /kinetics/PSD/CaM/CaM-Ca2-bind-Ca 1 0.60001 10 "" white blue \
  -14 10 0
simundump text /kinetics/PSD/CaM/CaM-Ca2-bind-Ca/notes 0 \
  "K3 = 21.5, K4 = 2.8. Assuming that the K4 step happens first, we get\nkb/kf = 2.8 uM = 1.68e6 so kf =6e-6 assuming kb = 10\n"
call /kinetics/PSD/CaM/CaM-Ca2-bind-Ca/notes LOAD \
"K3 = 21.5, K4 = 2.8. Assuming that the K4 step happens first, we get" \
"kb/kf = 2.8 uM = 1.68e6 so kf =6e-6 assuming kb = 10" \
""
simundump kreac /kinetics/PSD/CaM/CaM-Ca-bind-Ca 1 1.4141 8.4853 "" white \
  blue -18 10 0
simundump text /kinetics/PSD/CaM/CaM-Ca-bind-Ca/notes 0 \
  "Lets use the fast rate consts here. Since the rates are so different, I am not\nsure whether the order is relevant. These correspond to the TR2C fragment.\nWe use the Martin et al rates here, plus the Drabicowski binding consts.\nAll are scaled by 3X to cell temp.\nkf = 2e-10 kb = 72\nStemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11.\nIf kb=72, kf = 2e-10 (Exactly the same !)...."
call /kinetics/PSD/CaM/CaM-Ca-bind-Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not" \
"sure whether the order is relevant. These correspond to the TR2C fragment." \
"We use the Martin et al rates here, plus the Drabicowski binding consts." \
"All are scaled by 3X to cell temp." \
"kf = 2e-10 kb = 72" \
"Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11." \
"If kb=72, kf = 2e-10 (Exactly the same !)" \
"" \
"19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into" \
"two steps, each binding 1 Ca. This improves numerical" \
"stability and is conceptually better too." \
"" \
"Overall rates are the same, so each kf and kb is the " \
"square root of the earlier ones. So" \
"kf = 1.125e-4, kb = 8.4853" \
""
simundump kpool /kinetics/PSD/CaM/CaM-Ca 1 1e-12 0 0 0 0 0 0 6 0 \
  /kinetics/geometry pink blue -20 13 0
simundump text /kinetics/PSD/CaM/CaM-Ca/notes 0 \
  "This is the intermediate where the TR2 end (the high-affinity end) has\nbound the Ca but the TR1 end has not."
call /kinetics/PSD/CaM/CaM-Ca/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has" \
"bound the Ca but the TR1 end has not."
simundump kpool /kinetics/PSD/CaM/CaM-Ca4 1 1e-12 0 0 0 0 0 0 6 0 \
  /kinetics/geometry blue blue -7 13 0
simundump text /kinetics/PSD/CaM/CaM-Ca4/notes 0 ""
call /kinetics/PSD/CaM/CaM-Ca4/notes LOAD \
""
simundump group /kinetics/DEND 0 13 black x 0 0 "" DEND defaultfile.g 0 0 0 \
  11 -30 0
simundump text /kinetics/DEND/notes 0 Compartment
call /kinetics/DEND/notes LOAD \
"Compartment"
simundump kreac /kinetics/DEND/degrade_Y 1 0.4 0.01 "" white 40 -7 -28 0
simundump text /kinetics/DEND/degrade_Y/notes 0 ""
call /kinetics/DEND/degrade_Y/notes LOAD \
""
simundump kpool /kinetics/DEND/phosphatase 0 1e-12 0.4 0.4 240 240 0 0 600 0 \
  /kinetics/geometry 25 40 -3 -30 0
simundump text /kinetics/DEND/phosphatase/notes 0 ""
call /kinetics/DEND/phosphatase/notes LOAD \
""
simundump kenz /kinetics/DEND/phosphatase/P 0 0 0 0 0 600 0.41667 4 1 0 0 "" \
  red 25 "" -3 -29 0
simundump text /kinetics/DEND/phosphatase/P/notes 0 ""
call /kinetics/DEND/phosphatase/P/notes LOAD \
""
simundump kpool /kinetics/DEND/P_MAPK 1 5e-12 0 0 0 0 0 0 599.99 0 \
  /kinetics/geometry red 40 -4 -27 0
simundump text /kinetics/DEND/P_MAPK/notes 0 ""
call /kinetics/DEND/P_MAPK/notes LOAD \
""
simundump kenz /kinetics/DEND/P_MAPK/PLA2 1 0 0 0 0 599.99 0.016667 40 10 0 0 \
  "" red red "" -5 -26 0
simundump text /kinetics/DEND/P_MAPK/PLA2/notes 0 ""
call /kinetics/DEND/P_MAPK/PLA2/notes LOAD \
""
simundump kenz /kinetics/DEND/P_MAPK/activate_phosphatase 0 0 0 0 0 599.99 \
  0.00083335 0.4 0.1 0 0 "" red red "" -3 -32 0
simundump text /kinetics/DEND/P_MAPK/activate_phosphatase/notes 0 ""
call /kinetics/DEND/P_MAPK/activate_phosphatase/notes LOAD \
""
simundump kenz /kinetics/DEND/P_MAPK/phosph_chan 0 0 0 0 0 599.99 0.083335 \
  200 50 0 0 "" red red "" -7 -29 0
simundump text /kinetics/DEND/P_MAPK/phosph_chan/notes 0 ""
call /kinetics/DEND/P_MAPK/phosph_chan/notes LOAD \
""
simundump kpool /kinetics/DEND/MAPK 1 5e-12 2 2 1200 1200 0 0 599.99 0 \
  /kinetics/geometry red 40 0 -27 0
simundump text /kinetics/DEND/MAPK/notes 0 ""
call /kinetics/DEND/MAPK/notes LOAD \
""
simundump kreac /kinetics/DEND/Ca_activate_Raf 0 3.3333e-05 4 "" white 40 -5 \
  -21 0
simundump text /kinetics/DEND/Ca_activate_Raf/notes 0 ""
call /kinetics/DEND/Ca_activate_Raf/notes LOAD \
""
simundump kpool /kinetics/DEND/AA 1 1e-12 0 0 0 0 0 0 599.99 0 \
  /kinetics/geometry red 40 -8 -27 0
simundump text /kinetics/DEND/AA/notes 0 ""
call /kinetics/DEND/AA/notes LOAD \
""
simundump kpool /kinetics/DEND/act_PKC 1 0 0 0 0 0 0 0 599.99 0 \
  /kinetics/geometry blue 40 -2 -23 0
simundump text /kinetics/DEND/act_PKC/notes 0 ""
call /kinetics/DEND/act_PKC/notes LOAD \
""
simundump kenz /kinetics/DEND/act_PKC/MAPKK 1 0 0 0 0 599.99 0.016667 40 10 0 \
  0 "" red blue "" -2 -24 0
simundump text /kinetics/DEND/act_PKC/MAPKK/notes 0 ""
call /kinetics/DEND/act_PKC/MAPKK/notes LOAD \
""
simundump kpool /kinetics/DEND/PKC 1 1e-12 1 1 599.99 599.99 0 0 599.99 0 \
  /kinetics/geometry blue 40 -8 -23 0
simundump text /kinetics/DEND/PKC/notes 0 ""
call /kinetics/DEND/PKC/notes LOAD \
""
simundump kpool /kinetics/DEND/APC 1 1e-12 1 1 599.99 599.99 0 0 599.99 4 \
  /kinetics/geometry red 40 -6 -27 0
simundump text /kinetics/DEND/APC/notes 0 ""
call /kinetics/DEND/APC/notes LOAD \
""
simundump kreac /kinetics/DEND/dephosph 0 6 0 "" white 40 -7 -33 0
simundump text /kinetics/DEND/dephosph/notes 0 ""
call /kinetics/DEND/dephosph/notes LOAD \
""
simundump kpool /kinetics/DEND/Raf 0 0 1.4 1.4 840 840 0 0 600 0 \
  /kinetics/geometry blue 40 -8 -22 0
simundump text /kinetics/DEND/Raf/notes 0 ""
call /kinetics/DEND/Raf/notes LOAD \
""
simundump kpool /kinetics/DEND/act_Raf 0 0 0 0 0 0 0 0 600 0 \
  /kinetics/geometry blue 40 0 -23 0
simundump text /kinetics/DEND/act_Raf/notes 0 ""
call /kinetics/DEND/act_Raf/notes LOAD \
""
simundump kenz /kinetics/DEND/act_Raf/MAPKKK 0 0 0 0 0 600 0.0041665 40 10 0 \
  0 "" red blue "" 0 -24 0
simundump text /kinetics/DEND/act_Raf/MAPKKK/notes 0 ""
call /kinetics/DEND/act_Raf/MAPKKK/notes LOAD \
""
simundump kreac /kinetics/DEND/activate_PKC 1 2.7779e-06 2 "" white 40 -5 -24 \
  0
simundump text /kinetics/DEND/activate_PKC/notes 0 ""
call /kinetics/DEND/activate_PKC/notes LOAD \
""
simundump kpool /kinetics/DEND/Ca 0 1e-10 0.08 0.08 48 48 0 0 600 0 \
  /kinetics/geometry 54 40 -8 -20 0
simundump text /kinetics/DEND/Ca/notes 0 ""
call /kinetics/DEND/Ca/notes LOAD \
""
simundump kpool /kinetics/DEND/Ca_input 0 0 0.08 0.08 48 48 0 0 600 4 \
  /kinetics/geometry 55 40 -2 -20 0
simundump text /kinetics/DEND/Ca_input/notes 0 ""
call /kinetics/DEND/Ca_input/notes LOAD \
""
simundump kreac /kinetics/DEND/Ca_stim 0 500 10 "" white 40 -5 -19 0
simundump text /kinetics/DEND/Ca_stim/notes 0 ""
call /kinetics/DEND/Ca_stim/notes LOAD \
""
simundump kreac /kinetics/DEND/basal_phosphatase 0 0.03 0 "" white black 1 \
  -32 0
simundump text /kinetics/DEND/basal_phosphatase/notes 0 ""
call /kinetics/DEND/basal_phosphatase/notes LOAD \
""
simundump kpool /kinetics/DEND/inact_phosphatase 0 2e-12 1 1 600 600 0 0 600 \
  0 /kinetics/geometry blue black -1 -33 0
simundump text /kinetics/DEND/inact_phosphatase/notes 0 ""
call /kinetics/DEND/inact_phosphatase/notes LOAD \
""
simundump kpool /kinetics/DEND/reg_phosphatase 0 2e-12 0 0 0 0 0 0 600 0 \
  /kinetics/geometry[1] blue black -1 -30 0
simundump text /kinetics/DEND/reg_phosphatase/notes 0 ""
call /kinetics/DEND/reg_phosphatase/notes LOAD \
""
simundump kenz /kinetics/DEND/reg_phosphatase/P 0 0 0 0 0 600 0.16667 8 2 0 0 \
  "" red blue "" -1 -29 0
simundump text /kinetics/DEND/reg_phosphatase/P/notes 0 ""
call /kinetics/DEND/reg_phosphatase/P/notes LOAD \
""
simundump group /kinetics/DEND/CaM 1 blue 13 x 0 0 "" defaultfile \
  defaultfile.g 0 fbb0ff81553508bc01f3dd51428742fb 0 -21 -15 0
simundump text /kinetics/DEND/CaM/notes 0 ""
call /kinetics/DEND/CaM/notes LOAD \
""
simundump kpool /kinetics/DEND/CaM/CaM 1 5e-13 2 2 1200 1200 0 0 600 0 \
  /kinetics/geometry pink blue -17 -13 0
simundump text /kinetics/DEND/CaM/CaM/notes 0 \
  "There is a LOT of this in the cell: upto 1% of total protein mass. (Alberts et al)\nSay 25 uM. Meyer et al Science 256 1199-1202 1992 refer to studies saying\nit is comparable to CaMK levels. \n"
call /kinetics/DEND/CaM/CaM/notes LOAD \
"There is a LOT of this in the cell: upto 1% of total protein mass. (Alberts et al)" \
"Say 25 uM. Meyer et al Science 256 1199-1202 1992 refer to studies saying" \
"it is comparable to CaMK levels. " \
""
simundump kreac /kinetics/DEND/CaM/CaM-Ca3-bind-Ca 1 0.003 10 "" white blue \
  -3 -16 0
simundump text /kinetics/DEND/CaM/CaM-Ca3-bind-Ca/notes 0 \
  "Use K3 = 21.5 uM here from Stemmer and Klee table 3.\nkb/kf =21.5 * 6e5 so kf = 7.75e-7, kb = 10"
call /kinetics/DEND/CaM/CaM-Ca3-bind-Ca/notes LOAD \
"Use K3 = 21.5 uM here from Stemmer and Klee table 3." \
"kb/kf =21.5 * 6e5 so kf = 7.75e-7, kb = 10"
simundump kpool /kinetics/DEND/CaM/CaM-Ca3 1 1e-12 0 0 0 0 0 0 600 0 \
  /kinetics/geometry hotpink blue -5 -13 0
simundump text /kinetics/DEND/CaM/CaM-Ca3/notes 0 ""
call /kinetics/DEND/CaM/CaM-Ca3/notes LOAD \
""
simundump kreac /kinetics/DEND/CaM/CaM-bind-Ca 1 0.014141 8.4853 "" white \
  blue -15 -16 0
simundump text /kinetics/DEND/CaM/CaM-bind-Ca/notes 0 \
  "Lets use the fast rate consts here. Since the rates are so different, I am not\nsure whether the order is relevant. These correspond to the TR2C fragment.\nWe use the Martin et al rates here, plus the Drabicowski binding consts.\nAll are scaled by 3X to cell temp.\nkf = 2e-10 kb = 72\nStemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11.\nIf kb=72, kf = 2e-10 (Exactly the same !)...."
call /kinetics/DEND/CaM/CaM-bind-Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not" \
"sure whether the order is relevant. These correspond to the TR2C fragment." \
"We use the Martin et al rates here, plus the Drabicowski binding consts." \
"All are scaled by 3X to cell temp." \
"kf = 2e-10 kb = 72" \
"Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11." \
"If kb=72, kf = 2e-10 (Exactly the same !)" \
"" \
"19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into" \
"two steps, each binding 1 Ca. This improves numerical" \
"stability and is conceptually better too." \
"" \
"Overall rates are the same, so each kf and kb is the " \
"square root of the earlier ones. So" \
"kf = 1.125e-4, kb = 8.4853" \
""
simundump kpool /kinetics/DEND/CaM/CaM-Ca2 1 1e-12 0 0 0 0 0 0 600 0 \
  /kinetics/geometry pink blue -9 -13 0
simundump text /kinetics/DEND/CaM/CaM-Ca2/notes 0 \
  "This is the intermediate where the TR2 end (the high-affinity end) has\nbound the Ca but the TR1 end has not."
call /kinetics/DEND/CaM/CaM-Ca2/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has" \
"bound the Ca but the TR1 end has not."
simundump kreac /kinetics/DEND/CaM/CaM-Ca2-bind-Ca 1 0.006 10 "" white blue \
  -7 -16 0
simundump text /kinetics/DEND/CaM/CaM-Ca2-bind-Ca/notes 0 \
  "K3 = 21.5, K4 = 2.8. Assuming that the K4 step happens first, we get\nkb/kf = 2.8 uM = 1.68e6 so kf =6e-6 assuming kb = 10\n"
call /kinetics/DEND/CaM/CaM-Ca2-bind-Ca/notes LOAD \
"K3 = 21.5, K4 = 2.8. Assuming that the K4 step happens first, we get" \
"kb/kf = 2.8 uM = 1.68e6 so kf =6e-6 assuming kb = 10" \
""
simundump kreac /kinetics/DEND/CaM/CaM-Ca-bind-Ca 1 0.014141 8.4853 "" white \
  blue -11 -16 0
simundump text /kinetics/DEND/CaM/CaM-Ca-bind-Ca/notes 0 \
  "Lets use the fast rate consts here. Since the rates are so different, I am not\nsure whether the order is relevant. These correspond to the TR2C fragment.\nWe use the Martin et al rates here, plus the Drabicowski binding consts.\nAll are scaled by 3X to cell temp.\nkf = 2e-10 kb = 72\nStemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11.\nIf kb=72, kf = 2e-10 (Exactly the same !)...."
call /kinetics/DEND/CaM/CaM-Ca-bind-Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not" \
"sure whether the order is relevant. These correspond to the TR2C fragment." \
"We use the Martin et al rates here, plus the Drabicowski binding consts." \
"All are scaled by 3X to cell temp." \
"kf = 2e-10 kb = 72" \
"Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11." \
"If kb=72, kf = 2e-10 (Exactly the same !)" \
"" \
"19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into" \
"two steps, each binding 1 Ca. This improves numerical" \
"stability and is conceptually better too." \
"" \
"Overall rates are the same, so each kf and kb is the " \
"square root of the earlier ones. So" \
"kf = 1.125e-4, kb = 8.4853" \
""
simundump kpool /kinetics/DEND/CaM/CaM-Ca 1 1e-12 0 0 0 0 0 0 600 0 \
  /kinetics/geometry pink blue -13 -13 0
simundump text /kinetics/DEND/CaM/CaM-Ca/notes 0 \
  "This is the intermediate where the TR2 end (the high-affinity end) has\nbound the Ca but the TR1 end has not."
call /kinetics/DEND/CaM/CaM-Ca/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has" \
"bound the Ca but the TR1 end has not."
simundump kpool /kinetics/DEND/CaM/CaM-Ca4 1 1e-12 0 0 0 0 0 0 600 0 \
  /kinetics/geometry blue blue 0 -13 0
simundump text /kinetics/DEND/CaM/CaM-Ca4/notes 0 ""
call /kinetics/DEND/CaM/CaM-Ca4/notes LOAD \
""
simundump kreac /kinetics/DEND/CaM/CaM_x2 0 10 10 "" white black -27 -13 0
simundump text /kinetics/DEND/CaM/CaM_x2/notes 0 ""
call /kinetics/DEND/CaM/CaM_x2/notes LOAD \
""
simundump kpool /kinetics/DEND/CaM/CaM_xchange 0 2e-11 0 0 0 0 0 0 600 0 \
  /kinetics/geometry[1] blue blue -36 -15 0
simundump text /kinetics/DEND/CaM/CaM_xchange/notes 0 ""
call /kinetics/DEND/CaM/CaM_xchange/notes LOAD \
""
simundump kpool /kinetics/DEND/channel 0 0 1 1 600 600 0 0 600 0 \
  /kinetics/geometry 25 40 -9 -31 0
simundump text /kinetics/DEND/channel/notes 0 \
  "This is the unphosphorylated K_A channel, which has the\nfull channel conductance."
call /kinetics/DEND/channel/notes LOAD \
"This is the unphosphorylated K_A channel, which has the" \
"full channel conductance."
simundump kpool /kinetics/DEND/channel_p 0 0 0 0 0 0 0 0 600 0 \
  /kinetics/geometry 52 40 -5 -31 0
simundump text /kinetics/DEND/channel_p/notes 0 ""
call /kinetics/DEND/channel_p/notes LOAD \
""
simundump group /kinetics/SPINE 0 5 black x 0 0 "" SPINE defaultfile.g 0 0 0 \
  29 -23 0
simundump text /kinetics/SPINE/notes 0 Compartment
call /kinetics/SPINE/notes LOAD \
"Compartment"
simundump kpool /kinetics/SPINE/Ca 0 1e-10 0.11111 0.11111 6 6 0 0 54 0 \
  /kinetics/geometry[1] 50 yellow -12 -11 0
simundump text /kinetics/SPINE/Ca/notes 0 ""
call /kinetics/SPINE/Ca/notes LOAD \
""
simundump group /kinetics/SPINE/CaM 1 blue 5 x 0 0 "" defaultfile \
  defaultfile.g 0 fbb0ff81553508bc01f3dd51428742fb 0 -24 -7 0
simundump text /kinetics/SPINE/CaM/notes 0 ""
call /kinetics/SPINE/CaM/notes LOAD \
""
simundump kpool /kinetics/SPINE/CaM/CaM 1 5e-13 40 40 2160 2160 0 0 54 0 \
  /kinetics/geometry pink blue -20 -5 0
simundump text /kinetics/SPINE/CaM/CaM/notes 0 \
  "There is a LOT of this in the cell: upto 1% of total protein mass. (Alberts et al)\nSay 25 uM. Meyer et al Science 256 1199-1202 1992 refer to studies saying\nit is comparable to CaMK levels. \n"
call /kinetics/SPINE/CaM/CaM/notes LOAD \
"There is a LOT of this in the cell: upto 1% of total protein mass. (Alberts et al)" \
"Say 25 uM. Meyer et al Science 256 1199-1202 1992 refer to studies saying" \
"it is comparable to CaMK levels. " \
""
simundump kreac /kinetics/SPINE/CaM/CaM-Ca3-bind-Ca 1 0.033333 10 "" white \
  blue -6 -8 0
simundump text /kinetics/SPINE/CaM/CaM-Ca3-bind-Ca/notes 0 \
  "Use K3 = 21.5 uM here from Stemmer and Klee table 3.\nkb/kf =21.5 * 6e5 so kf = 7.75e-7, kb = 10"
call /kinetics/SPINE/CaM/CaM-Ca3-bind-Ca/notes LOAD \
"Use K3 = 21.5 uM here from Stemmer and Klee table 3." \
"kb/kf =21.5 * 6e5 so kf = 7.75e-7, kb = 10"
simundump kpool /kinetics/SPINE/CaM/CaM-Ca3 1 1e-12 0 0 0 0 0 0 54 0 \
  /kinetics/geometry hotpink blue -8 -5 0
simundump text /kinetics/SPINE/CaM/CaM-Ca3/notes 0 ""
call /kinetics/SPINE/CaM/CaM-Ca3/notes LOAD \
""
simundump kreac /kinetics/SPINE/CaM/CaM-bind-Ca 1 0.15712 8.4853 "" white \
  blue -18 -8 0
simundump text /kinetics/SPINE/CaM/CaM-bind-Ca/notes 0 \
  "Lets use the fast rate consts here. Since the rates are so different, I am not\nsure whether the order is relevant. These correspond to the TR2C fragment.\nWe use the Martin et al rates here, plus the Drabicowski binding consts.\nAll are scaled by 3X to cell temp.\nkf = 2e-10 kb = 72\nStemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11.\nIf kb=72, kf = 2e-10 (Exactly the same !)...."
call /kinetics/SPINE/CaM/CaM-bind-Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not" \
"sure whether the order is relevant. These correspond to the TR2C fragment." \
"We use the Martin et al rates here, plus the Drabicowski binding consts." \
"All are scaled by 3X to cell temp." \
"kf = 2e-10 kb = 72" \
"Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11." \
"If kb=72, kf = 2e-10 (Exactly the same !)" \
"" \
"19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into" \
"two steps, each binding 1 Ca. This improves numerical" \
"stability and is conceptually better too." \
"" \
"Overall rates are the same, so each kf and kb is the " \
"square root of the earlier ones. So" \
"kf = 1.125e-4, kb = 8.4853" \
""
simundump kpool /kinetics/SPINE/CaM/CaM-Ca2 1 1e-12 0 0 0 0 0 0 54 0 \
  /kinetics/geometry pink blue -12 -5 0
simundump text /kinetics/SPINE/CaM/CaM-Ca2/notes 0 \
  "This is the intermediate where the TR2 end (the high-affinity end) has\nbound the Ca but the TR1 end has not."
call /kinetics/SPINE/CaM/CaM-Ca2/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has" \
"bound the Ca but the TR1 end has not."
simundump kreac /kinetics/SPINE/CaM/CaM-Ca2-bind-Ca 1 0.066668 10 "" white \
  blue -10 -8 0
simundump text /kinetics/SPINE/CaM/CaM-Ca2-bind-Ca/notes 0 \
  "K3 = 21.5, K4 = 2.8. Assuming that the K4 step happens first, we get\nkb/kf = 2.8 uM = 1.68e6 so kf =6e-6 assuming kb = 10\n"
call /kinetics/SPINE/CaM/CaM-Ca2-bind-Ca/notes LOAD \
"K3 = 21.5, K4 = 2.8. Assuming that the K4 step happens first, we get" \
"kb/kf = 2.8 uM = 1.68e6 so kf =6e-6 assuming kb = 10" \
""
simundump kreac /kinetics/SPINE/CaM/CaM-Ca-bind-Ca 1 0.15712 8.4853 "" white \
  blue -14 -8 0
simundump text /kinetics/SPINE/CaM/CaM-Ca-bind-Ca/notes 0 \
  "Lets use the fast rate consts here. Since the rates are so different, I am not\nsure whether the order is relevant. These correspond to the TR2C fragment.\nWe use the Martin et al rates here, plus the Drabicowski binding consts.\nAll are scaled by 3X to cell temp.\nkf = 2e-10 kb = 72\nStemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11.\nIf kb=72, kf = 2e-10 (Exactly the same !)...."
call /kinetics/SPINE/CaM/CaM-Ca-bind-Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not" \
"sure whether the order is relevant. These correspond to the TR2C fragment." \
"We use the Martin et al rates here, plus the Drabicowski binding consts." \
"All are scaled by 3X to cell temp." \
"kf = 2e-10 kb = 72" \
"Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11." \
"If kb=72, kf = 2e-10 (Exactly the same !)" \
"" \
"19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into" \
"two steps, each binding 1 Ca. This improves numerical" \
"stability and is conceptually better too." \
"" \
"Overall rates are the same, so each kf and kb is the " \
"square root of the earlier ones. So" \
"kf = 1.125e-4, kb = 8.4853" \
""
simundump kpool /kinetics/SPINE/CaM/CaM-Ca 1 1e-12 0 0 0 0 0 0 54 0 \
  /kinetics/geometry pink blue -16 -5 0
simundump text /kinetics/SPINE/CaM/CaM-Ca/notes 0 \
  "This is the intermediate where the TR2 end (the high-affinity end) has\nbound the Ca but the TR1 end has not."
call /kinetics/SPINE/CaM/CaM-Ca/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has" \
"bound the Ca but the TR1 end has not."
simundump kpool /kinetics/SPINE/CaM/CaM-Ca4 1 1e-12 0 0 0 0 0 0 54 0 \
  /kinetics/geometry blue blue -3 -5 0
simundump text /kinetics/SPINE/CaM/CaM-Ca4/notes 0 ""
call /kinetics/SPINE/CaM/CaM-Ca4/notes LOAD \
""
simundump kreac /kinetics/SPINE/CaM/CaM_x2 0 1 100 "" white black -23 1 0
simundump text /kinetics/SPINE/CaM/CaM_x2/notes 0 ""
call /kinetics/SPINE/CaM/CaM_x2/notes LOAD \
""
simundump kpool /kinetics/SPINE/CaM/CaM_xchange 0 2e-11 0 0 0 0 0 0 54 0 \
  /kinetics/geometry[2] blue black -28 -2 0
simundump text /kinetics/SPINE/CaM/CaM_xchange/notes 0 ""
call /kinetics/SPINE/CaM/CaM_xchange/notes LOAD \
""
simundump xgraph /graphs/conc1 0 0 50 0 0.64362 0
simundump xgraph /graphs/conc2 0 0 50 0 5.8375 0
simundump xplot /graphs/conc1/P_MAPK.Co 3 524288 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" red 0 0 1
simundump xplot /graphs/conc1/phosphatase.Co 3 524288 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" 25 0 0 1
simundump xplot /graphs/conc1/channel_p.Co 3 524288 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" 52 0 0 1
simundump xplot /graphs/conc2/AA.Co 3 524288 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" red 0 0 1
simundump xplot /graphs/conc2/reg_phosphatase.Co 3 524288 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" blue 0 0 1
simundump xgraph /moregraphs/conc3 0 0 50 0 4 0
simundump xgraph /moregraphs/conc4 0 0 50 0 4 0
simundump xcoredraw /edit/draw 0 -14.326 7.3265 -34.268 -18.577
simundump xtree /edit/draw/tree 0 \
  /kinetics/#[],/kinetics/#[]/#[],/kinetics/#[]/#[]/#[][TYPE!=proto],/kinetics/#[]/#[]/#[][TYPE!=linkinfo]/##[] \
  "edit_elm.D <v>; drag_from_edit.w <d> <S> <x> <y> <z>" auto 0.6
simundump xtext /file/notes 0 1
xtextload /file/notes \
"" \
"4 Aug 2016: CaM_3compt.g: Based on CaMKII_merged91.g, just have" \
"the CaM part in all 3 compartments, for merging." \
"CaM_3compt1.g: Eliminated Ca and Ca input too." \
"" \
"4 Aug 2016: Merged CaM_3compt1.g into NN_mapk6.g, some " \
"elimination of Ca buffer pools. All now handled by CaM." \
"" \
"15 Aug 2016: Doubled CaM levels throughout, use as a surrogate" \
"for other Ca buffers." \
"" \
"28 Aug 2016: Scaled Ca_stim reacs 10x Kf and Kb, to get faster" \
" settling. Raised diffConst of Ca to 100 um^2/s" \
"" \
"06 Sep 2016: Increased Raf from 1 to 1.4 uM." \
"Saved as NN_mapk10.g" \
"" \
"09 Sep 2016: Made sharper turnon and turnoff." \
"Saved as NN_mapk11.g" \
"" \
"04 Nov 2016: Renamed K_A to channel, as it is a generic" \
"phosphorylation we're looking at here." \
"" \
"13 Nov 2016: NN_mapk_13.g Renamed phosph_KA to phosph_chan." \
"Scaled rates for phosph and dephosph of channel up 20x so tau" \
"is more like 1 s." \
"" \
"17 Nov 2016: NN_mapk14.g: Scaled rates for phosph and dephosph" \
"so that the channel_p tracks P_MAPK more closely, and faster." \
"" \
""
addmsg /kinetics/PSD/Ca_stim /kinetics/PSD/Ca REAC B A 
addmsg /kinetics/PSD/CaM/CaM-bind-Ca /kinetics/PSD/Ca REAC A B 
addmsg /kinetics/PSD/CaM/CaM-Ca-bind-Ca /kinetics/PSD/Ca REAC A B 
addmsg /kinetics/PSD/CaM/CaM-Ca2-bind-Ca /kinetics/PSD/Ca REAC A B 
addmsg /kinetics/PSD/CaM/CaM-Ca3-bind-Ca /kinetics/PSD/Ca REAC A B 
addmsg /kinetics/PSD/Ca_stim /kinetics/PSD/Ca_input REAC A B 
addmsg /kinetics/PSD/Ca_input /kinetics/PSD/Ca_stim SUBSTRATE n 
addmsg /kinetics/PSD/Ca /kinetics/PSD/Ca_stim PRODUCT n 
addmsg /kinetics/PSD/CaM/CaM-bind-Ca /kinetics/PSD/CaM/CaM REAC A B 
addmsg /kinetics/PSD/CaM/CaM-Ca3 /kinetics/PSD/CaM/CaM-Ca3-bind-Ca SUBSTRATE n 
addmsg /kinetics/PSD/CaM/CaM-Ca4 /kinetics/PSD/CaM/CaM-Ca3-bind-Ca PRODUCT n 
addmsg /kinetics/PSD/Ca /kinetics/PSD/CaM/CaM-Ca3-bind-Ca SUBSTRATE n 
addmsg /kinetics/PSD/CaM/CaM-Ca2-bind-Ca /kinetics/PSD/CaM/CaM-Ca3 REAC B A 
addmsg /kinetics/PSD/CaM/CaM-Ca3-bind-Ca /kinetics/PSD/CaM/CaM-Ca3 REAC A B 
addmsg /kinetics/PSD/CaM/CaM /kinetics/PSD/CaM/CaM-bind-Ca SUBSTRATE n 
addmsg /kinetics/PSD/CaM/CaM-Ca /kinetics/PSD/CaM/CaM-bind-Ca PRODUCT n 
addmsg /kinetics/PSD/Ca /kinetics/PSD/CaM/CaM-bind-Ca SUBSTRATE n 
addmsg /kinetics/PSD/CaM/CaM-Ca2-bind-Ca /kinetics/PSD/CaM/CaM-Ca2 REAC A B 
addmsg /kinetics/PSD/CaM/CaM-Ca-bind-Ca /kinetics/PSD/CaM/CaM-Ca2 REAC B A 
addmsg /kinetics/PSD/CaM/CaM-Ca2 /kinetics/PSD/CaM/CaM-Ca2-bind-Ca SUBSTRATE n 
addmsg /kinetics/PSD/CaM/CaM-Ca3 /kinetics/PSD/CaM/CaM-Ca2-bind-Ca PRODUCT n 
addmsg /kinetics/PSD/Ca /kinetics/PSD/CaM/CaM-Ca2-bind-Ca SUBSTRATE n 
addmsg /kinetics/PSD/CaM/CaM-Ca /kinetics/PSD/CaM/CaM-Ca-bind-Ca SUBSTRATE n 
addmsg /kinetics/PSD/CaM/CaM-Ca2 /kinetics/PSD/CaM/CaM-Ca-bind-Ca PRODUCT n 
addmsg /kinetics/PSD/Ca /kinetics/PSD/CaM/CaM-Ca-bind-Ca SUBSTRATE n 
addmsg /kinetics/PSD/CaM/CaM-bind-Ca /kinetics/PSD/CaM/CaM-Ca REAC B A 
addmsg /kinetics/PSD/CaM/CaM-Ca-bind-Ca /kinetics/PSD/CaM/CaM-Ca REAC A B 
addmsg /kinetics/PSD/CaM/CaM-Ca3-bind-Ca /kinetics/PSD/CaM/CaM-Ca4 REAC B A 
addmsg /kinetics/DEND/AA /kinetics/DEND/degrade_Y SUBSTRATE n 
addmsg /kinetics/DEND/APC /kinetics/DEND/degrade_Y PRODUCT n 
addmsg /kinetics/DEND/phosphatase/P /kinetics/DEND/phosphatase REAC eA B 
addmsg /kinetics/DEND/phosphatase /kinetics/DEND/phosphatase/P ENZYME n 
addmsg /kinetics/DEND/P_MAPK /kinetics/DEND/phosphatase/P SUBSTRATE n 
addmsg /kinetics/DEND/P_MAPK/PLA2 /kinetics/DEND/P_MAPK REAC eA B 
addmsg /kinetics/DEND/act_PKC/MAPKK /kinetics/DEND/P_MAPK MM_PRD pA 
addmsg /kinetics/DEND/phosphatase/P /kinetics/DEND/P_MAPK REAC sA B 
addmsg /kinetics/DEND/P_MAPK/phosph_chan /kinetics/DEND/P_MAPK REAC eA B 
addmsg /kinetics/DEND/act_Raf/MAPKKK /kinetics/DEND/P_MAPK MM_PRD pA 
addmsg /kinetics/DEND/P_MAPK/activate_phosphatase /kinetics/DEND/P_MAPK REAC eA B 
addmsg /kinetics/DEND/reg_phosphatase/P /kinetics/DEND/P_MAPK REAC sA B 
addmsg /kinetics/DEND/P_MAPK /kinetics/DEND/P_MAPK/PLA2 ENZYME n 
addmsg /kinetics/DEND/APC /kinetics/DEND/P_MAPK/PLA2 SUBSTRATE n 
addmsg /kinetics/DEND/P_MAPK /kinetics/DEND/P_MAPK/activate_phosphatase ENZYME n 
addmsg /kinetics/DEND/inact_phosphatase /kinetics/DEND/P_MAPK/activate_phosphatase SUBSTRATE n 
addmsg /kinetics/DEND/P_MAPK /kinetics/DEND/P_MAPK/phosph_chan ENZYME n 
addmsg /kinetics/DEND/channel /kinetics/DEND/P_MAPK/phosph_chan SUBSTRATE n 
addmsg /kinetics/DEND/act_PKC/MAPKK /kinetics/DEND/MAPK REAC sA B 
addmsg /kinetics/DEND/phosphatase/P /kinetics/DEND/MAPK MM_PRD pA 
addmsg /kinetics/DEND/act_Raf/MAPKKK /kinetics/DEND/MAPK REAC sA B 
addmsg /kinetics/DEND/reg_phosphatase/P /kinetics/DEND/MAPK MM_PRD pA 
addmsg /kinetics/DEND/Ca /kinetics/DEND/Ca_activate_Raf SUBSTRATE n 
addmsg /kinetics/DEND/Ca /kinetics/DEND/Ca_activate_Raf SUBSTRATE n 
addmsg /kinetics/DEND/Raf /kinetics/DEND/Ca_activate_Raf SUBSTRATE n 
addmsg /kinetics/DEND/act_Raf /kinetics/DEND/Ca_activate_Raf PRODUCT n 
addmsg /kinetics/DEND/P_MAPK/PLA2 /kinetics/DEND/AA MM_PRD pA 
addmsg /kinetics/DEND/degrade_Y /kinetics/DEND/AA REAC A B 
addmsg /kinetics/DEND/activate_PKC /kinetics/DEND/AA REAC A B 
addmsg /kinetics/DEND/activate_PKC /kinetics/DEND/AA REAC A B 
addmsg /kinetics/DEND/act_PKC/MAPKK /kinetics/DEND/act_PKC REAC eA B 
addmsg /kinetics/DEND/activate_PKC /kinetics/DEND/act_PKC REAC B A 
addmsg /kinetics/DEND/act_PKC /kinetics/DEND/act_PKC/MAPKK ENZYME n 
addmsg /kinetics/DEND/MAPK /kinetics/DEND/act_PKC/MAPKK SUBSTRATE n 
addmsg /kinetics/DEND/activate_PKC /kinetics/DEND/PKC REAC A B 
addmsg /kinetics/DEND/P_MAPK/PLA2 /kinetics/DEND/APC REAC sA B 
addmsg /kinetics/DEND/degrade_Y /kinetics/DEND/APC REAC B A 
addmsg /kinetics/DEND/channel_p /kinetics/DEND/dephosph SUBSTRATE n 
addmsg /kinetics/DEND/channel /kinetics/DEND/dephosph PRODUCT n 
addmsg /kinetics/DEND/Ca_activate_Raf /kinetics/DEND/Raf REAC A B 
addmsg /kinetics/DEND/Ca_activate_Raf /kinetics/DEND/act_Raf REAC B A 
addmsg /kinetics/DEND/act_Raf/MAPKKK /kinetics/DEND/act_Raf REAC eA B 
addmsg /kinetics/DEND/act_Raf /kinetics/DEND/act_Raf/MAPKKK ENZYME n 
addmsg /kinetics/DEND/MAPK /kinetics/DEND/act_Raf/MAPKKK SUBSTRATE n 
addmsg /kinetics/DEND/act_PKC /kinetics/DEND/activate_PKC PRODUCT n 
addmsg /kinetics/DEND/AA /kinetics/DEND/activate_PKC SUBSTRATE n 
addmsg /kinetics/DEND/AA /kinetics/DEND/activate_PKC SUBSTRATE n 
addmsg /kinetics/DEND/PKC /kinetics/DEND/activate_PKC SUBSTRATE n 
addmsg /kinetics/DEND/Ca_activate_Raf /kinetics/DEND/Ca REAC A B 
addmsg /kinetics/DEND/Ca_activate_Raf /kinetics/DEND/Ca REAC A B 
addmsg /kinetics/DEND/Ca_stim /kinetics/DEND/Ca REAC B A 
addmsg /kinetics/DEND/CaM/CaM-bind-Ca /kinetics/DEND/Ca REAC A B 
addmsg /kinetics/DEND/CaM/CaM-Ca-bind-Ca /kinetics/DEND/Ca REAC A B 
addmsg /kinetics/DEND/CaM/CaM-Ca2-bind-Ca /kinetics/DEND/Ca REAC A B 
addmsg /kinetics/DEND/CaM/CaM-Ca3-bind-Ca /kinetics/DEND/Ca REAC A B 
addmsg /kinetics/DEND/Ca_stim /kinetics/DEND/Ca_input REAC A B 
addmsg /kinetics/DEND/Ca_input /kinetics/DEND/Ca_stim SUBSTRATE n 
addmsg /kinetics/DEND/Ca /kinetics/DEND/Ca_stim PRODUCT n 
addmsg /kinetics/DEND/reg_phosphatase /kinetics/DEND/basal_phosphatase SUBSTRATE n 
addmsg /kinetics/DEND/inact_phosphatase /kinetics/DEND/basal_phosphatase PRODUCT n 
addmsg /kinetics/DEND/P_MAPK/activate_phosphatase /kinetics/DEND/inact_phosphatase REAC sA B 
addmsg /kinetics/DEND/basal_phosphatase /kinetics/DEND/inact_phosphatase REAC B A 
addmsg /kinetics/DEND/reg_phosphatase/P /kinetics/DEND/reg_phosphatase REAC eA B 
addmsg /kinetics/DEND/P_MAPK/activate_phosphatase /kinetics/DEND/reg_phosphatase MM_PRD pA 
addmsg /kinetics/DEND/basal_phosphatase /kinetics/DEND/reg_phosphatase REAC A B 
addmsg /kinetics/DEND/reg_phosphatase /kinetics/DEND/reg_phosphatase/P ENZYME n 
addmsg /kinetics/DEND/P_MAPK /kinetics/DEND/reg_phosphatase/P SUBSTRATE n 
addmsg /kinetics/DEND/CaM/CaM-bind-Ca /kinetics/DEND/CaM/CaM REAC A B 
addmsg /kinetics/DEND/CaM/CaM_x2 /kinetics/DEND/CaM/CaM REAC A B 
addmsg /kinetics/DEND/CaM/CaM-Ca3 /kinetics/DEND/CaM/CaM-Ca3-bind-Ca SUBSTRATE n 
addmsg /kinetics/DEND/CaM/CaM-Ca4 /kinetics/DEND/CaM/CaM-Ca3-bind-Ca PRODUCT n 
addmsg /kinetics/DEND/Ca /kinetics/DEND/CaM/CaM-Ca3-bind-Ca SUBSTRATE n 
addmsg /kinetics/DEND/CaM/CaM-Ca2-bind-Ca /kinetics/DEND/CaM/CaM-Ca3 REAC B A 
addmsg /kinetics/DEND/CaM/CaM-Ca3-bind-Ca /kinetics/DEND/CaM/CaM-Ca3 REAC A B 
addmsg /kinetics/DEND/CaM/CaM /kinetics/DEND/CaM/CaM-bind-Ca SUBSTRATE n 
addmsg /kinetics/DEND/CaM/CaM-Ca /kinetics/DEND/CaM/CaM-bind-Ca PRODUCT n 
addmsg /kinetics/DEND/Ca /kinetics/DEND/CaM/CaM-bind-Ca SUBSTRATE n 
addmsg /kinetics/DEND/CaM/CaM-Ca2-bind-Ca /kinetics/DEND/CaM/CaM-Ca2 REAC A B 
addmsg /kinetics/DEND/CaM/CaM-Ca-bind-Ca /kinetics/DEND/CaM/CaM-Ca2 REAC B A 
addmsg /kinetics/DEND/CaM/CaM-Ca2 /kinetics/DEND/CaM/CaM-Ca2-bind-Ca SUBSTRATE n 
addmsg /kinetics/DEND/CaM/CaM-Ca3 /kinetics/DEND/CaM/CaM-Ca2-bind-Ca PRODUCT n 
addmsg /kinetics/DEND/Ca /kinetics/DEND/CaM/CaM-Ca2-bind-Ca SUBSTRATE n 
addmsg /kinetics/DEND/CaM/CaM-Ca /kinetics/DEND/CaM/CaM-Ca-bind-Ca SUBSTRATE n 
addmsg /kinetics/DEND/CaM/CaM-Ca2 /kinetics/DEND/CaM/CaM-Ca-bind-Ca PRODUCT n 
addmsg /kinetics/DEND/Ca /kinetics/DEND/CaM/CaM-Ca-bind-Ca SUBSTRATE n 
addmsg /kinetics/DEND/CaM/CaM-bind-Ca /kinetics/DEND/CaM/CaM-Ca REAC B A 
addmsg /kinetics/DEND/CaM/CaM-Ca-bind-Ca /kinetics/DEND/CaM/CaM-Ca REAC A B 
addmsg /kinetics/DEND/CaM/CaM-Ca3-bind-Ca /kinetics/DEND/CaM/CaM-Ca4 REAC B A 
addmsg /kinetics/DEND/CaM/CaM /kinetics/DEND/CaM/CaM_x2 SUBSTRATE n 
addmsg /kinetics/DEND/CaM/CaM_xchange /kinetics/DEND/CaM/CaM_x2 PRODUCT n 
addmsg /kinetics/DEND/CaM/CaM_x2 /kinetics/DEND/CaM/CaM_xchange REAC B A 
addmsg /kinetics/DEND/dephosph /kinetics/DEND/channel REAC B A 
addmsg /kinetics/DEND/P_MAPK/phosph_chan /kinetics/DEND/channel REAC sA B 
addmsg /kinetics/DEND/dephosph /kinetics/DEND/channel_p REAC A B 
addmsg /kinetics/DEND/P_MAPK/phosph_chan /kinetics/DEND/channel_p MM_PRD pA 
addmsg /kinetics/SPINE/CaM/CaM-bind-Ca /kinetics/SPINE/Ca REAC A B 
addmsg /kinetics/SPINE/CaM/CaM-Ca-bind-Ca /kinetics/SPINE/Ca REAC A B 
addmsg /kinetics/SPINE/CaM/CaM-Ca2-bind-Ca /kinetics/SPINE/Ca REAC A B 
addmsg /kinetics/SPINE/CaM/CaM-Ca3-bind-Ca /kinetics/SPINE/Ca REAC A B 
addmsg /kinetics/SPINE/CaM/CaM-bind-Ca /kinetics/SPINE/CaM/CaM REAC A B 
addmsg /kinetics/SPINE/CaM/CaM_x2 /kinetics/SPINE/CaM/CaM REAC A B 
addmsg /kinetics/SPINE/CaM/CaM-Ca3 /kinetics/SPINE/CaM/CaM-Ca3-bind-Ca SUBSTRATE n 
addmsg /kinetics/SPINE/CaM/CaM-Ca4 /kinetics/SPINE/CaM/CaM-Ca3-bind-Ca PRODUCT n 
addmsg /kinetics/SPINE/Ca /kinetics/SPINE/CaM/CaM-Ca3-bind-Ca SUBSTRATE n 
addmsg /kinetics/SPINE/CaM/CaM-Ca2-bind-Ca /kinetics/SPINE/CaM/CaM-Ca3 REAC B A 
addmsg /kinetics/SPINE/CaM/CaM-Ca3-bind-Ca /kinetics/SPINE/CaM/CaM-Ca3 REAC A B 
addmsg /kinetics/SPINE/CaM/CaM /kinetics/SPINE/CaM/CaM-bind-Ca SUBSTRATE n 
addmsg /kinetics/SPINE/CaM/CaM-Ca /kinetics/SPINE/CaM/CaM-bind-Ca PRODUCT n 
addmsg /kinetics/SPINE/Ca /kinetics/SPINE/CaM/CaM-bind-Ca SUBSTRATE n 
addmsg /kinetics/SPINE/CaM/CaM-Ca2-bind-Ca /kinetics/SPINE/CaM/CaM-Ca2 REAC A B 
addmsg /kinetics/SPINE/CaM/CaM-Ca-bind-Ca /kinetics/SPINE/CaM/CaM-Ca2 REAC B A 
addmsg /kinetics/SPINE/CaM/CaM-Ca2 /kinetics/SPINE/CaM/CaM-Ca2-bind-Ca SUBSTRATE n 
addmsg /kinetics/SPINE/CaM/CaM-Ca3 /kinetics/SPINE/CaM/CaM-Ca2-bind-Ca PRODUCT n 
addmsg /kinetics/SPINE/Ca /kinetics/SPINE/CaM/CaM-Ca2-bind-Ca SUBSTRATE n 
addmsg /kinetics/SPINE/CaM/CaM-Ca /kinetics/SPINE/CaM/CaM-Ca-bind-Ca SUBSTRATE n 
addmsg /kinetics/SPINE/CaM/CaM-Ca2 /kinetics/SPINE/CaM/CaM-Ca-bind-Ca PRODUCT n 
addmsg /kinetics/SPINE/Ca /kinetics/SPINE/CaM/CaM-Ca-bind-Ca SUBSTRATE n 
addmsg /kinetics/SPINE/CaM/CaM-bind-Ca /kinetics/SPINE/CaM/CaM-Ca REAC B A 
addmsg /kinetics/SPINE/CaM/CaM-Ca-bind-Ca /kinetics/SPINE/CaM/CaM-Ca REAC A B 
addmsg /kinetics/SPINE/CaM/CaM-Ca3-bind-Ca /kinetics/SPINE/CaM/CaM-Ca4 REAC B A 
addmsg /kinetics/SPINE/CaM/CaM /kinetics/SPINE/CaM/CaM_x2 SUBSTRATE n 
addmsg /kinetics/SPINE/CaM/CaM_xchange /kinetics/SPINE/CaM/CaM_x2 PRODUCT n 
addmsg /kinetics/SPINE/CaM/CaM_x2 /kinetics/SPINE/CaM/CaM_xchange REAC B A 
addmsg /kinetics/DEND/P_MAPK /graphs/conc1/P_MAPK.Co PLOT Co *P_MAPK.Co *red 
addmsg /kinetics/DEND/phosphatase /graphs/conc1/phosphatase.Co PLOT Co *phosphatase.Co *25 
addmsg /kinetics/DEND/channel_p /graphs/conc1/channel_p.Co PLOT Co *channel_p.Co *52 
addmsg /kinetics/DEND/AA /graphs/conc2/AA.Co PLOT Co *AA.Co *red 
addmsg /kinetics/DEND/reg_phosphatase /graphs/conc2/reg_phosphatase.Co PLOT Co *reg_phosphatase.Co *blue 
enddump
// End of dump

call /kinetics/PSD/notes LOAD \
"Compartment"
call /kinetics/PSD/CaM/CaM/notes LOAD \
"There is a LOT of this in the cell: upto 1% of total protein mass. (Alberts et al)" \
"Say 25 uM. Meyer et al Science 256 1199-1202 1992 refer to studies saying" \
"it is comparable to CaMK levels. " \
""
call /kinetics/PSD/CaM/CaM-Ca3-bind-Ca/notes LOAD \
"Use K3 = 21.5 uM here from Stemmer and Klee table 3." \
"kb/kf =21.5 * 6e5 so kf = 7.75e-7, kb = 10" \
"24 Sep 2015" \
"This is a bit too low affinity. Changing to match K2 at " \
"Kd = 2.8."
call /kinetics/PSD/CaM/CaM-bind-Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not" \
"sure whether the order is relevant. These correspond to the TR2C fragment." \
"We use the Martin et al rates here, plus the Drabicowski binding consts." \
"All are scaled by 3X to cell temp." \
"kf = 2e-10 kb = 72" \
"Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11." \
"If kb=72, kf = 2e-10 (Exactly the same !)" \
"" \
"19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into" \
"two steps, each binding 1 Ca. This improves numerical" \
"stability and is conceptually better too." \
"" \
"Overall rates are the same, so each kf and kb is the " \
"square root of the earlier ones. So" \
"kf = 1.125e-4, kb = 8.4853" \
""
call /kinetics/PSD/CaM/CaM-Ca2/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has" \
"bound the Ca but the TR1 end has not."
call /kinetics/PSD/CaM/CaM-Ca2-bind-Ca/notes LOAD \
"K3 = 21.5, K4 = 2.8. Assuming that the K4 step happens first, we get" \
"kb/kf = 2.8 uM = 1.68e6 so kf =6e-6 assuming kb = 10" \
""
call /kinetics/PSD/CaM/CaM-Ca-bind-Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not" \
"sure whether the order is relevant. These correspond to the TR2C fragment." \
"We use the Martin et al rates here, plus the Drabicowski binding consts." \
"All are scaled by 3X to cell temp." \
"kf = 2e-10 kb = 72" \
"Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11." \
"If kb=72, kf = 2e-10 (Exactly the same !)" \
"" \
"19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into" \
"two steps, each binding 1 Ca. This improves numerical" \
"stability and is conceptually better too." \
"" \
"Overall rates are the same, so each kf and kb is the " \
"square root of the earlier ones. So" \
"kf = 1.125e-4, kb = 8.4853" \
""
call /kinetics/PSD/CaM/CaM-Ca/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has" \
"bound the Ca but the TR1 end has not."
call /kinetics/DEND/notes LOAD \
"Compartment"
call /kinetics/DEND/CaM/CaM/notes LOAD \
"There is a LOT of this in the cell: upto 1% of total protein mass. (Alberts et al)" \
"Say 25 uM. Meyer et al Science 256 1199-1202 1992 refer to studies saying" \
"it is comparable to CaMK levels. " \
""
call /kinetics/DEND/CaM/CaM-Ca3-bind-Ca/notes LOAD \
"Use K3 = 21.5 uM here from Stemmer and Klee table 3." \
"kb/kf =21.5 * 6e5 so kf = 7.75e-7, kb = 10"
call /kinetics/DEND/CaM/CaM-bind-Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not" \
"sure whether the order is relevant. These correspond to the TR2C fragment." \
"We use the Martin et al rates here, plus the Drabicowski binding consts." \
"All are scaled by 3X to cell temp." \
"kf = 2e-10 kb = 72" \
"Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11." \
"If kb=72, kf = 2e-10 (Exactly the same !)" \
"" \
"19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into" \
"two steps, each binding 1 Ca. This improves numerical" \
"stability and is conceptually better too." \
"" \
"Overall rates are the same, so each kf and kb is the " \
"square root of the earlier ones. So" \
"kf = 1.125e-4, kb = 8.4853" \
""
call /kinetics/DEND/CaM/CaM-Ca2/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has" \
"bound the Ca but the TR1 end has not."
call /kinetics/DEND/CaM/CaM-Ca2-bind-Ca/notes LOAD \
"K3 = 21.5, K4 = 2.8. Assuming that the K4 step happens first, we get" \
"kb/kf = 2.8 uM = 1.68e6 so kf =6e-6 assuming kb = 10" \
""
call /kinetics/DEND/CaM/CaM-Ca-bind-Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not" \
"sure whether the order is relevant. These correspond to the TR2C fragment." \
"We use the Martin et al rates here, plus the Drabicowski binding consts." \
"All are scaled by 3X to cell temp." \
"kf = 2e-10 kb = 72" \
"Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11." \
"If kb=72, kf = 2e-10 (Exactly the same !)" \
"" \
"19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into" \
"two steps, each binding 1 Ca. This improves numerical" \
"stability and is conceptually better too." \
"" \
"Overall rates are the same, so each kf and kb is the " \
"square root of the earlier ones. So" \
"kf = 1.125e-4, kb = 8.4853" \
""
call /kinetics/DEND/CaM/CaM-Ca/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has" \
"bound the Ca but the TR1 end has not."
call /kinetics/DEND/channel/notes LOAD \
"This is the unphosphorylated K_A channel, which has the" \
"full channel conductance."
call /kinetics/SPINE/notes LOAD \
"Compartment"
call /kinetics/SPINE/CaM/CaM/notes LOAD \
"There is a LOT of this in the cell: upto 1% of total protein mass. (Alberts et al)" \
"Say 25 uM. Meyer et al Science 256 1199-1202 1992 refer to studies saying" \
"it is comparable to CaMK levels. " \
""
call /kinetics/SPINE/CaM/CaM-Ca3-bind-Ca/notes LOAD \
"Use K3 = 21.5 uM here from Stemmer and Klee table 3." \
"kb/kf =21.5 * 6e5 so kf = 7.75e-7, kb = 10"
call /kinetics/SPINE/CaM/CaM-bind-Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not" \
"sure whether the order is relevant. These correspond to the TR2C fragment." \
"We use the Martin et al rates here, plus the Drabicowski binding consts." \
"All are scaled by 3X to cell temp." \
"kf = 2e-10 kb = 72" \
"Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11." \
"If kb=72, kf = 2e-10 (Exactly the same !)" \
"" \
"19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into" \
"two steps, each binding 1 Ca. This improves numerical" \
"stability and is conceptually better too." \
"" \
"Overall rates are the same, so each kf and kb is the " \
"square root of the earlier ones. So" \
"kf = 1.125e-4, kb = 8.4853" \
""
call /kinetics/SPINE/CaM/CaM-Ca2/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has" \
"bound the Ca but the TR1 end has not."
call /kinetics/SPINE/CaM/CaM-Ca2-bind-Ca/notes LOAD \
"K3 = 21.5, K4 = 2.8. Assuming that the K4 step happens first, we get" \
"kb/kf = 2.8 uM = 1.68e6 so kf =6e-6 assuming kb = 10" \
""
call /kinetics/SPINE/CaM/CaM-Ca-bind-Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not" \
"sure whether the order is relevant. These correspond to the TR2C fragment." \
"We use the Martin et al rates here, plus the Drabicowski binding consts." \
"All are scaled by 3X to cell temp." \
"kf = 2e-10 kb = 72" \
"Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11." \
"If kb=72, kf = 2e-10 (Exactly the same !)" \
"" \
"19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into" \
"two steps, each binding 1 Ca. This improves numerical" \
"stability and is conceptually better too." \
"" \
"Overall rates are the same, so each kf and kb is the " \
"square root of the earlier ones. So" \
"kf = 1.125e-4, kb = 8.4853" \
""
call /kinetics/SPINE/CaM/CaM-Ca/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has" \
"bound the Ca but the TR1 end has not."
complete_loading
