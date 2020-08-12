/* 
In this script, we explore the SPEED Database (1945-2005).
We load the data and make usual descriptive statistics.
*/

/* 
To read the database:
*/

use "../data/ssp_public.dta", clear

/*
To see the database as an excel spreadsheet:
*/

browse

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
To plot graphs:
*/

use "../data/ssp_public.dta", clear
graph twoway 



