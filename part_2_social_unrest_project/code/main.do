clear all 

log using "../output/logs/main_log", replace

do "part_2_essentials.do"
do "part_2_graphs.do"
do "part_2_regressions.do"
do "part_2_business_cycles.do"

log close
