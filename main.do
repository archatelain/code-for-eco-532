clear all 

log using "./output/logs/main_log", replace

do "./code/basics/hello_world.do"
do "./code/basics/farewell.do"

log close
