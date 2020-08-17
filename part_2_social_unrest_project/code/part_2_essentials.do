/* 
In this script, we explore the SPEED Database (1945-2005):
- We load the database and make usual descriptive statistics.
- We enrich the database with complementary information on country GDPs
from the Penn World Table (PWT) database. 
*/

clear all

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

* 3. Cleaning, preserving, filtering data

preserve
bysort year: gen n_yearly_incidents = _N
collapse (mean) n_yearly_incidents, by(year)
summarize n_yearly_incidents
restore
