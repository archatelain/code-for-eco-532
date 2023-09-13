**********************************************************
*	PROJECT: Stata training
*	EXERCISE 3 
**********************************************************

*****************
** 1. Settings **
*****************

** 1.1 Settings
// Do-files should start with settings. Make sure all numerics are set type double and add any other settings you require. 
	clear all
	capture log close
	set more off, permanently
	set type double
	set excelxlsxlargefile on // might not work. Ignore it if it's the case
	set matsize 11000 // same comment 
	


*****************
** 2. Analysis **
*****************

/************************************************
**** First part: Clubs of origin by country  ****
*************************************************/

* 1. Create a bar chart showing how many players in the French team come from each club
/*	0. create the data you need for this graph
	1. sort bars by descending order
	2. are you happy with x-axis labels? reduce their size to vsmall and set angle to 45 degrees
	3. rename the title of the y-axis to "number of players"
	4. create a graph title stating the name of the team (i.e. "France") 
	5. export the graph to output folder as Clubs_France.png */

	
	
* 2. Automate this procedure for every country in a loop 
/* 	hint: you could make very good use of "levelsof" and preserve/restore 
	warning: do not forget to adjust the title and name of the exported graph*/

	
	
	
/*************************************************************
**** Second part: Clubs of origin by country and position  ***
*************************************************************/

* In the bar chart showing how many players in the French team come from each club,
* break down the number of players by position (i.e. stack bars)
/* hint: make sure to use the previous label pos_lab for the variable position */




	
/***********************************************************
**** Third part: Players by club of origin and position  ***
************************************************************/

	
* 1. create a variable n_players providing the number of players coming from each club	



* 2. keep only top 10 clubs
/*	a. using a preserve restore, keep only clubs and number of players variables (duplicates drop)
	b. sort your database by descending orders of number of players by club (hint: use "gsort")
	c. keep only the 10 first observations
	d. save this dataset as a "tempfile"
	e. merge this tempfile with your initial database 
	f. keep only obs that are matched in order to keep only top 10 clubs */



* 3. For each club, create a bar chart showing how many players play in each national team. 
* Each bar should also shows a breakdown of these players by position (stack bars)
/*	1. sort bars by descending order
	2. Are you happy with how the labels look like on the x axis?
			a/ reuce the size of your labels to vsmall
			b/ change the angle to 45°
	3. Rename the ytitle to "# of players"
	4. Create a graph title, providing the club name
	5. Export as e.g. Country_pos_Juventus.png */


	
/*********************************************************
** CONGRATS!!! You now know most of the basics in Stata! *
**********************************************************/



