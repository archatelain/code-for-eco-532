use "../data/pwt91.dta", clear

* 6. Add-on Packages

* ssc install hprescott /* /!\ run only once */

egen group_country=group(country)

replace rgdpe=subinstr(rgdpe,",",".",.)
destring rgdpe, force replace 
 
xtset group_country year
bys group_country: hprescott rgdpe, stub(hp) smooth(6.25)

egen double hpsm = rowtotal(hp_rgdpe_sm_*)
drop hp_rgdpe_sm_*
egen double hpres = rowtotal(hp_rgdpe_*)
drop hp_rgdpe_*

* 7. Combining Multiple Datasets

merge 1:n country year using "../data/ssp_public.dta" 

* Is social unrest correlated to the business cycle?

bysort group_country year: gen n_events = _N
keep country group_country year hpres hpsm n_events
duplicates drop
drop if hpres == 0

graph twoway (line hpres year)(line hpsm year) if country == "United States", ///
ytitle ("Trend and Cycle") ///
xtitle ("Year") /// 
note("Penn World Table Database")
graph export "../output/graphs/US_hp_filter.pdf", replace

graph twoway (scatter hpres n_events)(lfit hpres n_events), ///
ytitle ("Business Cycle") /// 
xtitle ("Number of Social Unrest Episodes") ///
note("Penn World Table Database") 
graph export "../output/graphs/hp_filter_social_unrest.pdf", replace
