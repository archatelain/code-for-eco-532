clear all 

log using "./logs/main_log", replace

do "hello_world.do"
do "farewell.do"

log close
