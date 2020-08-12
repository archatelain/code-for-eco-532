/* 
In this script, we explore the SPEED Database (1945-2005).
We load the data and make usual descriptive statistics.
*/

clear all

/* 
To read the database:
*/

use "../data/ssp_public.dta", clear

/* 
To get a general overview of the database, type:
*/

describe

/*
I generate draws from a normal distribution with mean 0 and standard deviation 1.
I name the variable X, and I label it "draws from a normal distribution N(0,1)"
*/

generate X = rnormal(0,1)
label variable X "draws from a normal distribution N(0,1)"	

/*
To look at specific variables:
*/

tabulate country
summarize N_INJURD
summarize N_INJURD, detail

/*
To drop a variable, you can simply type:
*/

drop X

/*
To keep specific variables:
*/

keep country year month

/*
To keep specific values:
*/

keep if country == "United States"

/* 
Training exercises on the database
*/

use "../data/ssp_public.dta", clear

* Questions 1 and 2
tabulate country, plot
tabulate region, sort

* Question 3
preserve
bysort year: gen n_yearly_incidents = _N
collapse (mean) n_yearly_incidents, by(year)
summarize n_yearly_incidents
restore

* Question 4
preserve
bysort year: gen n_events = _N
graph twoway (line n_events year), ytitle("Number of Events") xtitle("Year") note("Source: SPEED Database") 
graph export "../output/graphs/yearly_events.pdf", replace
restore

* Question 5
preserve
bysort country year: gen n_events = _N
graph twoway (line n_events year) if country == "United States", ytitle("Number of Events") xtitle("Year") note("Source: SPEED Database")
graph export "../output/graphs/yearly_events_US.pdf", replace
restore

*Question 6

replace country = subinstr(country, "(", "", .) 
replace country = subinstr(country, ")", "", .) 
replace country = subinstr(country, ",", "", .) 
replace country = subinstr(country, " ", "", .) 
replace country = subinstr(country, ".", "", .) 

levelsof country, local (lev) 
foreach mycountry in `lev' {
	preserve
	display "`mycountry'"
	keep if country == "`mycountry'"
	bysort year: gen n_events = _N
	graph twoway (line n_events year), ytitle("Number of Events") xtitle("Year") note("Source: SPEED Database") 
	graph export "../output/graphs/yearly_events_`mycountry'.pdf", replace
	restore
}

* Question 7
preserve
collapse (sum) N_INJURD, by(country)
summarize N_INJURD
summarize N_INJURD, detail
restore

* Question 8
kdensity N_INJURD, ytitle("Density") xtitle ("# of Injured People") 
graph export "../output/graphs/density_injured.pdf", replace

* Question 9
preserve
bysort country: gen n_events = _N
keep country n_events
duplicates drop
gsort - n_events
keep if _n < =5
graph bar (mean) n_events, over(country), ytitle("Number of Events") xtitle("Country") note("Source: SPEED Database")
graph export "../output/graphs/top_5.pdf", replace
restore
