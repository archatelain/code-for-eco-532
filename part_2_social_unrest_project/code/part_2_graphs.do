/* 
Training exercises on the database
*/

clear all

use "../data/ssp_public.dta", clear

* Number of recorded incidents per year

preserve
bysort year: gen n_events = _N

graph twoway (line n_events year), ///
ytitle("Number of Events") /// 
xtitle("Year") ///
note("Source: SPEED Database") ///
graphregion(fcolor(white))

graph export "../output/graphs/yearly_events.pdf", replace
restore

* Number of recorded incidents per year for the United States

preserve
bysort country year: gen n_events = _N

graph twoway (line n_events year) if country == "United States", ///
ytitle("Number of Events") ///
xtitle("Year") ///
note("Source: SPEED Database") ///
graphregion(fcolor(white))

graph export "../output/graphs/yearly_events_US.pdf", replace
restore

* Bar plot of event types

preserve
bysort EV_TYPE: gen n_events = _N
keep EV_TYPE n_events
duplicates drop

graph bar (mean) n_events, over(EV_TYPE) ///
ytitle("Number of Events") /// 
note("Source: SPEED Database") ///
graphregion(fcolor(white))

graph export "../output/graphs/event_types.pdf", replace
restore

* Distribution of injured people

kdensity N_INJURD_D, ///
ytitle("Density") ///
xtitle ("# of Injured People") ///
graphregion(fcolor(white))

graph export "../output/graphs/density_injured.pdf", replace

* Correlation between political violence and number of injured people

graph twoway ///
(scatter POL_VIOL N_INJURD) ///
(lfit POL_VIOL N_INJURD) ///
if N_INJURD < 10000, /// 
ytitle("Political Violence") ///
xtitle("# of People Injured") ///
note("Source: SPEED Database") ///
graphregion(fcolor(white))

graph export "../output/graphs/corr_violence_injured.pdf", replace

