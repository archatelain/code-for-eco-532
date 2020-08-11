/* 

In this script, I perform Monte Carlo Simulations to check that the average of 
a sample is a good estimator for the mean when the true DGP is a normal 
distribution N(0,1).

To this end, I follow the steps below: 
- Step 1: I draw k = 1000 observations from a normal distribution N(0,1).
- Step 2: I take the sample average and store the value.
- Step 3: I repeat this process n = 1000 times.
- Step 4: I then look at the average of the sample averages. 

If the average of the sample averages is is close to zero, this indicates 
the the sample average is a good estimator of the mean.

*/

clear all
set seed 12345

/* 

Step 1: I draw k = 1000 observations from a normal distribution N(0,1).
Step 2: I take the sample average and store the value.

*/

quietly drop _all
quietly set obs 1000
quietly generate y = rnormal(0,1)
quietly mean y
display _b[y]

/* 

Step 3: I repeat this process n = 1000 times.

Of course, to repeat steps 1 and 2 n = 1000 times, I could simply copy paste
the piece of code above 1000 times. 

A bit cumbersome, don't you think?

Here's a smarter, more efficient way to do this.

*/ 

timer on 1

postfile buffer mhat using "./temp/monte_carlo_simulations.dta", replace

forvalues i=1/1000 {
quietly drop _all
quietly set obs 1000
quietly generate y = rnormal(0,1)
quietly mean y
post buffer (_b[y])
}

postclose buffer

use "./temp/monte_carlo_simulations.dta", clear

summarize

timer off 1

/* 

And here's an even smarter way to do this! 

*/

timer on 2

capture program drop make_simulation
program define make_simulation, rclass
	quietly drop _all
	quietly set obs 1000
	quietly generate y = rnormal(0,1)
	summarize y
	return scalar mean = r(mean)
end

simulate ymean=r(mean), reps(1000): make_simulation

summarize

timer off 2

/* 

You don't believe me? Check out the computation times for the first and the
second solution.

*/

timer list 1
timer list 2
