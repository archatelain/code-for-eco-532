**********************************************************
*	PROJECT: Stata training
*	EXERCISE 2 -- Instructions
**********************************************************

*****************
** 1. Settings **
*****************

// Do-files should start with settings. Make sure all numerics are set type double and add any other settings you require. 
	clear all
	capture log close
	set more off, permanently
	set type double
	set excelxlsxlargefile on // this might not work. Ignore it if it's the case
	set matsize 11000 // same comment 
	
*****************
** 2. Analysis **
*****************


/*********************************************************
**** First part: players date of births and positions ****
*********************************************************/

* 1. Import the csv file “Worldcup teams.csv” (hint: do not forget the clear option)

* 2. Inspect the data

* 3. Try generating a "histogram" of players date of birth (dob). What's the problem?

* 4. "Generate" a variable date_of_birth as a Stata "date" from the variable dob

* 5. Is the new variable really informative? Try giving it a date "format" to date_of_birth

* 6. Try generating a "histogram" of date_of_birth that displays the number of players in each bin

* 7. "label" the variable date_of_birth such that its label appears on every graphs

* 8. Add the normal distribution to the histogram using the "normal" option

* 9. Construct the average date of birth and set it as a "global" called mean_dob

* 10. Add a vertical line with "xline" option at mean_dob (tip: as for the path, use ${mean_dob})

* 11. "xline" appears at the back? Set bins "fcolor" to "none" and "lcolor" to "black"
	
* 12. Rotate "xlabel" using the "angle" suboption and set it to 30 degrees

* 13. Split this beautiful histogram "by" position (hint: drop the incompatible options if any)
	
* 14. You may want to attach a more transparent label to position. However, you can only label numerical variables.
* "Encode" the variable position as pos_index, "define" a "label" pos_label, apply this label to "values" of pos_index

* 15. Re-do the histogram split "by" pos_index and take out the "note" at the bottom

* 16. "Export" this graph to player_dob_by_position.png in output folder

/******************************************
**** Second part: players age and caps ****
*******************************************/

* 1. Provide summary statistics on the variables age and caps

* 2. Compute their correlation

* 3. Check whether this is stable across positions
/* Loop over the values of pos_index to compute the correlation by position (hint: use "forvalues") */

* 4. Check graphically whether this holds across countries
	* 4a. "collapse" the data to mean_age and mean_caps "by" country

	* 4b. draw a "scatter" plot of the two variables
	/*  1. add marker labels ("mlabel") 
		2. add xtitle and ytitle 
		3. add a linear fit of the two variables ("lfit") 
		4. turn "off" the "legend" */
	
	* 4c. "export" the graph as age_caps_countries.png in output folder 
	
* IMORTANT TIP: to not have to re-open the initial dataset every time,
* insert the command "preserve" to temporarily save the data (i.e. before the collapse here)
* and add the command "restore" whenever you want to retrieve the initial data (i.e. after the graph here) 

* 5. Going back to the intial dataset, check whether this holds within countries
/*  1. Loop over the different teams to compute their correlation by team (hint: use "levelsof") 
	2. to avoid flooding the results window, try to "quietly" execute the corr command and "display" the result "rho"*/


/**************************************************************
** CONGRATS!!! You have done your second analysis with Stata! **
**************************************************************/







