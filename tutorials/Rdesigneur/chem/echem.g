//genesis
// kkit Version 11 flat dumpfile
 
// Saved on Wed Dec 22 12:48:46 2021
 
include kkit {argv 1}
 
FASTDT = 0.0001
SIMDT = 0.01
CONTROLDT = 5
PLOTDT = 1
MAXTIME = 100
TRANSIENT_TIME = 2
VARIABLE_DT_FLAG = 0
DEFAULT_VOL = 1.6667e-21
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
simundump geometry /kinetics/geometry 0 1.6667e-21 3 sphere "" white black 0 \
  0 0
simundump text /kinetics/notes 0 ""
call /kinetics/notes LOAD \
""
simundump text /kinetics/geometry/notes 0 ""
call /kinetics/geometry/notes LOAD \
""
simundump group /kinetics/glu 0 yellow black x 0 0 "" glu defaultfile.g 0 0 0 \
  -3 5 0
simundump text /kinetics/glu/notes 0 ""
call /kinetics/glu/notes LOAD \
""
simundump kpool /kinetics/glu/Ca 0 0 0.08 0.08 0.08 0.08 0 0 1 0 \
  /kinetics/geometry 62 yellow -2 3 0
simundump text /kinetics/glu/Ca/notes 0 ""
call /kinetics/glu/Ca/notes LOAD \
""
simundump kreac /kinetics/glu/remove_Ca 0 25 25 "" white yellow 0 4 0
simundump text /kinetics/glu/remove_Ca/notes 0 ""
call /kinetics/glu/remove_Ca/notes LOAD \
""
simundump kpool /kinetics/glu/Ca_ext 0 0 0.08 0.08 0.08 0.08 0 0 1 4 \
  /kinetics/geometry 52 yellow 2 3 0
simundump text /kinetics/glu/Ca_ext/notes 0 ""
call /kinetics/glu/Ca_ext/notes LOAD \
""
simundump kreac /kinetics/glu/vesicle_release 0 30 0 "" white yellow 0 2 0
simundump text /kinetics/glu/vesicle_release/notes 0 \
  "High cooperativity, 4 or higher. Several refs:\nMcDargh and O-Shaughnessy, BioRxiv 2021 \nVoleti, Jaczynska, Rizo, eLife 2020\nChen.... Scheller, Cell 1999\n"
call /kinetics/glu/vesicle_release/notes LOAD \
"High cooperativity, 4 or higher. Several refs:" \
"McDargh and O-Shaughnessy, BioRxiv 2021 " \
"Voleti, Jaczynska, Rizo, eLife 2020" \
"Chen.... Scheller, Cell 1999" \
""
simundump kpool /kinetics/glu/RR_pool 0 0 0.2 0.2 0.2 0.2 0 0 1 0 \
  /kinetics/geometry 1 yellow -2 1 0
simundump text /kinetics/glu/RR_pool/notes 0 ""
call /kinetics/glu/RR_pool/notes LOAD \
""
simundump kpool /kinetics/glu/vesicle_pool 0 0 0.2 0.2 0.2 0.2 0 0 1 4 \
  /kinetics/geometry 27 yellow 2 -1 0
simundump text /kinetics/glu/vesicle_pool/notes 0 ""
call /kinetics/glu/vesicle_pool/notes LOAD \
""
simundump kreac /kinetics/glu/remove 0 200 0 "" white yellow 0 0 0
simundump text /kinetics/glu/remove/notes 0 ""
call /kinetics/glu/remove/notes LOAD \
""
simundump kpool /kinetics/glu/glu 0 0 0 0 0 0 0 0 1 0 /kinetics/geometry 7 \
  yellow 2 1 0
simundump text /kinetics/glu/glu/notes 0 ""
call /kinetics/glu/glu/notes LOAD \
""
simundump kreac /kinetics/glu/replenish_vesicle 0 0.5 0.5 "" white yellow 0 \
  -2 0
simundump text /kinetics/glu/replenish_vesicle/notes 0 ""
call /kinetics/glu/replenish_vesicle/notes LOAD \
""
simundump xgraph /graphs/conc1 0 0 100 0 1 0
simundump xgraph /graphs/conc2 0 0 100 0 1 0
simundump xgraph /moregraphs/conc3 0 0 100 0 1 0
simundump xgraph /moregraphs/conc4 0 0 100 0 1 0
simundump xcoredraw /edit/draw 0 -5 4 -4 7
simundump xtree /edit/draw/tree 0 \
  /kinetics/#[],/kinetics/#[]/#[],/kinetics/#[]/#[]/#[][TYPE!=proto],/kinetics/#[]/#[]/#[][TYPE!=linkinfo]/##[] \
  "edit_elm.D <v>; drag_from_edit.w <d> <S> <x> <y> <z>" auto 0.6
simundump xtext /file/notes 0 1
addmsg /kinetics/glu/remove_Ca /kinetics/glu/Ca REAC A B 
addmsg /kinetics/glu/vesicle_release /kinetics/glu/Ca REAC A B 
addmsg /kinetics/glu/vesicle_release /kinetics/glu/Ca REAC A B 
addmsg /kinetics/glu/vesicle_release /kinetics/glu/Ca REAC A B 
addmsg /kinetics/glu/vesicle_release /kinetics/glu/Ca REAC A B 
addmsg /kinetics/glu/Ca /kinetics/glu/remove_Ca SUBSTRATE n 
addmsg /kinetics/glu/Ca_ext /kinetics/glu/remove_Ca PRODUCT n 
addmsg /kinetics/glu/remove_Ca /kinetics/glu/Ca_ext REAC B A 
addmsg /kinetics/glu/RR_pool /kinetics/glu/vesicle_release SUBSTRATE n 
addmsg /kinetics/glu/glu /kinetics/glu/vesicle_release PRODUCT n 
addmsg /kinetics/glu/Ca /kinetics/glu/vesicle_release SUBSTRATE n 
addmsg /kinetics/glu/Ca /kinetics/glu/vesicle_release SUBSTRATE n 
addmsg /kinetics/glu/Ca /kinetics/glu/vesicle_release SUBSTRATE n 
addmsg /kinetics/glu/Ca /kinetics/glu/vesicle_release SUBSTRATE n 
addmsg /kinetics/glu/vesicle_release /kinetics/glu/RR_pool REAC A B 
addmsg /kinetics/glu/replenish_vesicle /kinetics/glu/RR_pool REAC B A 
addmsg /kinetics/glu/replenish_vesicle /kinetics/glu/vesicle_pool REAC A B 
addmsg /kinetics/glu/remove /kinetics/glu/vesicle_pool REAC B A 
addmsg /kinetics/glu/glu /kinetics/glu/remove SUBSTRATE n 
addmsg /kinetics/glu/vesicle_pool /kinetics/glu/remove PRODUCT n 
addmsg /kinetics/glu/vesicle_release /kinetics/glu/glu REAC B A 
addmsg /kinetics/glu/remove /kinetics/glu/glu REAC A B 
addmsg /kinetics/glu/vesicle_pool /kinetics/glu/replenish_vesicle SUBSTRATE n 
addmsg /kinetics/glu/RR_pool /kinetics/glu/replenish_vesicle PRODUCT n 
enddump
// End of dump

call /kinetics/glu/vesicle_release/notes LOAD \
"High cooperativity, 4 or higher. Several refs:" \
"McDargh and O-Shaughnessy, BioRxiv 2021 " \
"Voleti, Jaczynska, Rizo, eLife 2020" \
"Chen.... Scheller, Cell 1999" \
""
complete_loading
