//genesis
// kkit Version 11 flat dumpfile
 
// Saved on Mon Jul 25 11:14:36 2022
 
include kkit {argv 1}
 
FASTDT = 0.0001
SIMDT = 0.01
CONTROLDT = 5
PLOTDT = 1
MAXTIME = 100
TRANSIENT_TIME = 2
VARIABLE_DT_FLAG = 0
DEFAULT_VOL = 1.6667e-18
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
simundump geometry /kinetics/geometry 0 1.6667e-18 3 sphere "" white black 0 \
  0 0
simundump text /kinetics/notes 0 ""
call /kinetics/notes LOAD \
""
simundump text /kinetics/geometry/notes 0 ""
call /kinetics/geometry/notes LOAD \
""
simundump group /kinetics/SPINE 0 yellow black x 0 0 "" defaultfile \
  defaultfile.g 0 0 0 0 0 0
simundump text /kinetics/SPINE/notes 0 Compartment
call /kinetics/SPINE/notes LOAD \
"Compartment"
simundump kpool /kinetics/SPINE/Ca 0 1e-11 0.08 0.08 80 80 0 0 1000 0 \
  /kinetics/geometry 62 black 0 3 0
simundump text /kinetics/SPINE/Ca/notes 0 ""
call /kinetics/SPINE/Ca/notes LOAD \
""
simundump kpool /kinetics/SPINE/CaN 0 0 0.2 0.2 200 200 0 0 1000 0 \
  /kinetics/geometry 2 black -5 1 0
simundump text /kinetics/SPINE/CaN/notes 0 ""
call /kinetics/SPINE/CaN/notes LOAD \
""
simundump kpool /kinetics/SPINE/CaM 0 0 10 10 10000 10000 0 0 1000 0 \
  /kinetics/geometry 48 black 5 1 0
simundump text /kinetics/SPINE/CaM/notes 0 ""
call /kinetics/SPINE/CaM/notes LOAD \
""
simundump kpool /kinetics/SPINE/Ca4.CaM 0 0 0 0 0 0 0 0 1000 0 \
  /kinetics/geometry 48 black 4 -2 0
simundump text /kinetics/SPINE/Ca4.CaM/notes 0 ""
call /kinetics/SPINE/Ca4.CaM/notes LOAD \
""
simundump kreac /kinetics/SPINE/Ca_bind_CaN 0 1e-06 0.2 "" white black -2 1 0
simundump text /kinetics/SPINE/Ca_bind_CaN/notes 0 ""
call /kinetics/SPINE/Ca_bind_CaN/notes LOAD \
""
simundump kpool /kinetics/SPINE/Ca2_CaN 0 0 0 0 0 0 0 0 1000 0 \
  /kinetics/geometry 4 black -4 -2 0
simundump text /kinetics/SPINE/Ca2_CaN/notes 0 ""
call /kinetics/SPINE/Ca2_CaN/notes LOAD \
""
simundump kenz /kinetics/SPINE/Ca2_CaN/deph_AMPAR 0 0 0 0 0 1000 0.5 40 10 0 \
  0 "" red 4 "" -2 -5 0
simundump text /kinetics/SPINE/Ca2_CaN/deph_AMPAR/notes 0 ""
call /kinetics/SPINE/Ca2_CaN/deph_AMPAR/notes LOAD \
""
simundump kreac /kinetics/SPINE/Ca_bind_CaM 0 1e-13 4 "" white black 2 1 0
simundump text /kinetics/SPINE/Ca_bind_CaM/notes 0 ""
call /kinetics/SPINE/Ca_bind_CaM/notes LOAD \
""
simundump kpool /kinetics/SPINE/CaMKII 0 0 10 10 10000 10000 0 0 1000 0 \
  /kinetics/geometry 34 black 6 -2 0
simundump text /kinetics/SPINE/CaMKII/notes 0 ""
call /kinetics/SPINE/CaMKII/notes LOAD \
""
simundump kreac /kinetics/SPINE/CaM_act_CaMKII 0 0.0001 0.1 "" white black 5 \
  -4 0
simundump text /kinetics/SPINE/CaM_act_CaMKII/notes 0 ""
call /kinetics/SPINE/CaM_act_CaMKII/notes LOAD \
""
simundump kpool /kinetics/SPINE/act_CaMKII 0 0 0 0 0 0 0 0 1000 0 \
  /kinetics/geometry 30 black 5 -6 0
simundump text /kinetics/SPINE/act_CaMKII/notes 0 ""
call /kinetics/SPINE/act_CaMKII/notes LOAD \
""
simundump kenz /kinetics/SPINE/act_CaMKII/ph_AMPAR 0 0 0 0 0 1000 0.02 16 4 0 \
  0 "" red 30 "" 2 -5 0
simundump text /kinetics/SPINE/act_CaMKII/ph_AMPAR/notes 0 ""
call /kinetics/SPINE/act_CaMKII/ph_AMPAR/notes LOAD \
""
simundump kpool /kinetics/SPINE/AMPAR 0 0 1.6 1.6 1600 1600 0 0 1000 0 \
  /kinetics/geometry 52 black 0 -3 0
simundump text /kinetics/SPINE/AMPAR/notes 0 ""
call /kinetics/SPINE/AMPAR/notes LOAD \
""
simundump kpool /kinetics/SPINE/p_AMPAR 0 0 0.4 0.4 400 400 0 0 1000 0 \
  /kinetics/geometry 48 black 0 -7 0
simundump text /kinetics/SPINE/p_AMPAR/notes 0 ""
call /kinetics/SPINE/p_AMPAR/notes LOAD \
""
simundump kpool /kinetics/SPINE/Ca_input 0 0 0 0 0 0 0 0 1000 4 \
  /kinetics/geometry blue yellow 4 3 0
simundump text /kinetics/SPINE/Ca_input/notes 0 ""
call /kinetics/SPINE/Ca_input/notes LOAD \
""
simundump kreac /kinetics/SPINE/Ca_stim 0 10 10 "" white yellow 2 5 0
simundump text /kinetics/SPINE/Ca_stim/notes 0 ""
call /kinetics/SPINE/Ca_stim/notes LOAD \
""
simundump kpool /kinetics/SPINE/baseline_CaMKII 0 0 0 0 0 0 0 0 1000 0 \
  /kinetics/geometry 27 yellow 3 -6 0
simundump text /kinetics/SPINE/baseline_CaMKII/notes 0 ""
call /kinetics/SPINE/baseline_CaMKII/notes LOAD \
""
simundump kenz /kinetics/SPINE/baseline_CaMKII/baseline_ph 0 0 0 0 0 1000 \
  0.02 16 4 0 0 "" red 27 "" 1 -5 0
simundump text /kinetics/SPINE/baseline_CaMKII/baseline_ph/notes 0 ""
call /kinetics/SPINE/baseline_CaMKII/baseline_ph/notes LOAD \
""
simundump kreac /kinetics/SPINE/baseline_reac 0 0.4 1.6 "" white yellow -1 -5 \
  0
simundump text /kinetics/SPINE/baseline_reac/notes 0 ""
call /kinetics/SPINE/baseline_reac/notes LOAD \
""
simundump group /kinetics/DEND 0 15 black x 0 0 "" DEND defaultfile.g 0 0 0 \
  -6 -7 0
simundump text /kinetics/DEND/notes 0 Compartment
call /kinetics/DEND/notes LOAD \
"Compartment"
simundump kpool /kinetics/DEND/Ca 0 1e-11 0.08 0.08 800 800 0 0 10000 0 \
  /kinetics/geometry 62 black -6 -4 0
simundump text /kinetics/DEND/Ca/notes 0 ""
call /kinetics/DEND/Ca/notes LOAD \
""
simundump xgraph /graphs/conc1 0 0 3100.1 0 1 0
simundump xgraph /graphs/conc2 0 0 3100.1 0 10 0
simundump xplot /graphs/conc1/Ca.Co 3 524288 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" 62 0 0 1
simundump xplot /graphs/conc1/Ca2_CaN.Co 3 524288 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" 4 0 0 1
simundump xplot /graphs/conc1/p_AMPAR.Co 3 524288 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" 48 0 0 1
simundump xplot /graphs/conc2/Ca4.CaM.Co 3 524288 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" 48 0 0 1
simundump xplot /graphs/conc2/act_CaMKII.Co 3 524288 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" 30 0 0 1
simundump xgraph /moregraphs/conc3 0 0 3100.1 0 1 0
simundump xgraph /moregraphs/conc4 0 0 3100.1 0 1 0
simundump xcoredraw /edit/draw 0 -8 8 -9 7
simundump xtree /edit/draw/tree 0 \
  /kinetics/#[],/kinetics/#[]/#[],/kinetics/#[]/#[]/#[][TYPE!=proto],/kinetics/#[]/#[]/#[][TYPE!=linkinfo]/##[] \
  "edit_elm.D <v>; drag_from_edit.w <d> <S> <x> <y> <z>" auto 0.6
simundump xtext /file/notes 0 1
addmsg /kinetics/SPINE/Ca_bind_CaN /kinetics/SPINE/Ca REAC A B 
addmsg /kinetics/SPINE/Ca_bind_CaN /kinetics/SPINE/Ca REAC A B 
addmsg /kinetics/SPINE/Ca_bind_CaM /kinetics/SPINE/Ca REAC A B 
addmsg /kinetics/SPINE/Ca_bind_CaM /kinetics/SPINE/Ca REAC A B 
addmsg /kinetics/SPINE/Ca_bind_CaM /kinetics/SPINE/Ca REAC A B 
addmsg /kinetics/SPINE/Ca_bind_CaM /kinetics/SPINE/Ca REAC A B 
addmsg /kinetics/SPINE/Ca_stim /kinetics/SPINE/Ca REAC B A 
addmsg /kinetics/SPINE/Ca_bind_CaN /kinetics/SPINE/CaN REAC A B 
addmsg /kinetics/SPINE/Ca_bind_CaM /kinetics/SPINE/CaM REAC A B 
addmsg /kinetics/SPINE/Ca_bind_CaM /kinetics/SPINE/Ca4.CaM REAC B A 
addmsg /kinetics/SPINE/CaM_act_CaMKII /kinetics/SPINE/Ca4.CaM REAC A B 
addmsg /kinetics/SPINE/CaN /kinetics/SPINE/Ca_bind_CaN SUBSTRATE n 
addmsg /kinetics/SPINE/Ca /kinetics/SPINE/Ca_bind_CaN SUBSTRATE n 
addmsg /kinetics/SPINE/Ca /kinetics/SPINE/Ca_bind_CaN SUBSTRATE n 
addmsg /kinetics/SPINE/Ca2_CaN /kinetics/SPINE/Ca_bind_CaN PRODUCT n 
addmsg /kinetics/SPINE/Ca_bind_CaN /kinetics/SPINE/Ca2_CaN REAC B A 
addmsg /kinetics/SPINE/Ca2_CaN/deph_AMPAR /kinetics/SPINE/Ca2_CaN REAC eA B 
addmsg /kinetics/SPINE/Ca2_CaN /kinetics/SPINE/Ca2_CaN/deph_AMPAR ENZYME n 
addmsg /kinetics/SPINE/p_AMPAR /kinetics/SPINE/Ca2_CaN/deph_AMPAR SUBSTRATE n 
addmsg /kinetics/SPINE/CaM /kinetics/SPINE/Ca_bind_CaM SUBSTRATE n 
addmsg /kinetics/SPINE/Ca /kinetics/SPINE/Ca_bind_CaM SUBSTRATE n 
addmsg /kinetics/SPINE/Ca /kinetics/SPINE/Ca_bind_CaM SUBSTRATE n 
addmsg /kinetics/SPINE/Ca /kinetics/SPINE/Ca_bind_CaM SUBSTRATE n 
addmsg /kinetics/SPINE/Ca /kinetics/SPINE/Ca_bind_CaM SUBSTRATE n 
addmsg /kinetics/SPINE/Ca4.CaM /kinetics/SPINE/Ca_bind_CaM PRODUCT n 
addmsg /kinetics/SPINE/CaM_act_CaMKII /kinetics/SPINE/CaMKII REAC A B 
addmsg /kinetics/SPINE/Ca4.CaM /kinetics/SPINE/CaM_act_CaMKII SUBSTRATE n 
addmsg /kinetics/SPINE/CaMKII /kinetics/SPINE/CaM_act_CaMKII SUBSTRATE n 
addmsg /kinetics/SPINE/act_CaMKII /kinetics/SPINE/CaM_act_CaMKII PRODUCT n 
addmsg /kinetics/SPINE/CaM_act_CaMKII /kinetics/SPINE/act_CaMKII REAC B A 
addmsg /kinetics/SPINE/act_CaMKII/ph_AMPAR /kinetics/SPINE/act_CaMKII REAC eA B 
addmsg /kinetics/SPINE/act_CaMKII /kinetics/SPINE/act_CaMKII/ph_AMPAR ENZYME n 
addmsg /kinetics/SPINE/AMPAR /kinetics/SPINE/act_CaMKII/ph_AMPAR SUBSTRATE n 
addmsg /kinetics/SPINE/Ca2_CaN/deph_AMPAR /kinetics/SPINE/AMPAR MM_PRD pA 
addmsg /kinetics/SPINE/act_CaMKII/ph_AMPAR /kinetics/SPINE/AMPAR REAC sA B 
addmsg /kinetics/SPINE/baseline_CaMKII/baseline_ph /kinetics/SPINE/AMPAR REAC sA B 
addmsg /kinetics/SPINE/baseline_reac /kinetics/SPINE/AMPAR REAC A B 
addmsg /kinetics/SPINE/Ca2_CaN/deph_AMPAR /kinetics/SPINE/p_AMPAR REAC sA B 
addmsg /kinetics/SPINE/act_CaMKII/ph_AMPAR /kinetics/SPINE/p_AMPAR MM_PRD pA 
addmsg /kinetics/SPINE/baseline_CaMKII/baseline_ph /kinetics/SPINE/p_AMPAR MM_PRD pA 
addmsg /kinetics/SPINE/baseline_reac /kinetics/SPINE/p_AMPAR REAC B A 
addmsg /kinetics/SPINE/Ca_stim /kinetics/SPINE/Ca_input REAC A B 
addmsg /kinetics/SPINE/Ca_input /kinetics/SPINE/Ca_stim SUBSTRATE n 
addmsg /kinetics/SPINE/Ca /kinetics/SPINE/Ca_stim PRODUCT n 
addmsg /kinetics/SPINE/baseline_CaMKII/baseline_ph /kinetics/SPINE/baseline_CaMKII REAC eA B 
addmsg /kinetics/SPINE/baseline_CaMKII /kinetics/SPINE/baseline_CaMKII/baseline_ph ENZYME n 
addmsg /kinetics/SPINE/AMPAR /kinetics/SPINE/baseline_CaMKII/baseline_ph SUBSTRATE n 
addmsg /kinetics/SPINE/AMPAR /kinetics/SPINE/baseline_reac SUBSTRATE n 
addmsg /kinetics/SPINE/p_AMPAR /kinetics/SPINE/baseline_reac PRODUCT n 
addmsg /kinetics/SPINE/Ca /graphs/conc1/Ca.Co PLOT Co *Ca.Co *62 
addmsg /kinetics/SPINE/Ca2_CaN /graphs/conc1/Ca2_CaN.Co PLOT Co *Ca2_CaN.Co *4 
addmsg /kinetics/SPINE/p_AMPAR /graphs/conc1/p_AMPAR.Co PLOT Co *p_AMPAR.Co *48 
addmsg /kinetics/SPINE/Ca4.CaM /graphs/conc2/Ca4.CaM.Co PLOT Co *Ca4.CaM.Co *48 
addmsg /kinetics/SPINE/act_CaMKII /graphs/conc2/act_CaMKII.Co PLOT Co *act_CaMKII.Co *30 
enddump
// End of dump

call /kinetics/SPINE/notes LOAD \
"Compartment"
call /kinetics/DEND/notes LOAD \
"Compartment"
complete_loading
