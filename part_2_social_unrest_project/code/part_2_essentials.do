* 1. Loading Data 

use "../data/ssp_public.dta", clear

browse

* 2. Variables, labels and types

describe

tabulate country
tabulate country, plot

summarize N_INJURD
summarize N_INJURD, detail

tabulate country, summarize(N_INJURD)

generate X = rnormal(0,1)
label variable X "draws from a normal distribution N(0,1)"

ssc install sutex, replace

sutex N_INJURD, ///
file("../output/tables/descriptive_statistics_injured.tex") /// 
title("Summary statistics on injured people") ///
replace

drop X

preserve
bysort year: gen n_yearly_incidents = _N
collapse (mean) n_yearly_incidents, by(year)
summarize n_yearly_incidents
restore

preserve
collapse (sum) N_INJURD, by(country)
summarize N_INJURD
restore
