clear all 
use "../data/pwt91.dta"

ssc install hprescott, replace
help hprescott

egen group_country=group(country)

replace rgdpe=subinstr(rgdpe,",",".",.)
destring rgdpe, force replace 
 
xtset group_country year
bys group_country: hprescott rgdpe, stub(hp) smooth(6.25)

egen double hpsm = rowtotal(hp_rgdpe_sm_*)
drop hp_rgdpe_sm_*
egen double hpres = rowtotal(hp_rgdpe_*)
drop hp_rgdpe_*

merge 1:n country year using "../data/ssp_public.dta" 

drop if hpres == 0

preserve
keep if country=="United States"
drop if hpres == 0

graph twoway line hpres year, ///
ytitle("Business Cycle") ///
xtitle("Year") ///
note("Penn World Table Database")

graph export "../output/graphs/US_hp_cycle.pdf", replace
restore 

preserve
keep if country=="United States"
drop if hpsm == 0

graph twoway scatter hpsm year, ///
ytitle("Business Trend") ///
xtitle("Year") ///
note("Penn World Table Database")

graph export "../output/graphs/US_hp_trend.pdf", replace
restore

preserve
keep if CLASS_CONFLICT == 1

bysort group_country year: gen n_events = _N
keep country group_country year hpres hpsm n_events
duplicates drop

graph twoway (scatter hpres n_events)(lfit hpres n_events), ///
ytitle("Business Cycle") /// 
xtitle("Number of Social Unrest Episodes") ///
note("Penn World Table Database") 

graph export "../output/graphs/hp_filter_social_unrest.pdf", replace
restore
