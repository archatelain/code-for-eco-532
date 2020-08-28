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
