use "../data/ssp_public.dta", clear

sutex N_INJURD, ///
file("../output/tables/descriptive_statistics_injured.tex") /// 
title("Summary statistics on injured people") ///
replace


reg N_INJURD coup

xi: reg N_INJURD i.WEAP_GRD

display e(N)
display e(r2)
matrix list e(b)
display _b[_cons]

predict predicted_injured, xb

eststo clear

eststo: xi: reg N_INJURD i.WEAP_GRD
eststo: xi: reg N_INJURD i.WEAP_GRD i.region

esttab est1 est2, ///
addnotes("Source: SPEED Database")

esttab using "../output/tables/regression_weapons.tex", replace 
