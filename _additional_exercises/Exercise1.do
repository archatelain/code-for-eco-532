**********************************************************
*	PROJECT: Stata training
*	EXERCISE 1 -- Instructions
**********************************************************

*****************
** 1. Settings **
*****************

// Do-files should start with settings. Make sure all numerics are set type double and add any other settings you require. 
	clear all
	capture log close
	set more off, permanently
	set type double
	set excelxlsxlargefile on // this option might not work, ignore it if it does not
	set matsize 11000 // same comment 
	
	
*****************
** 2. Analysis **
*****************

/********************************************
**** First part: Basics and goals scored ****
********************************************/

* 1. Import the excel file “Worldcup games.xls”
/*  1. you can either use the built-in menu from stata found at file > import > excel, and then copy paste the generated command line to your script
    2. or directly use the “import excel” function
    3. whatever the option, make sure you use the global path defined above in your script */

* 2. Inspect the data using "browse"

* 3. Inspect the games played by the French team using “browse” with an "if" condition

* 4. “Describe” the data

* 5. “Codebook” the data

* 6. “Tabulate” the variable team to see how many games they have played

* 7. “Summarize” the data

* 8. “Summarize” the variable goals_for with some “detail” 

* 9. What is the largest number of goals a team scored in a game? Identify this game (or such games) using an automated procedure
/*  1. “egenerate” the variable max_goals_for as the “max” value of goals_for
    2. “generate” a variable mystery_game equal to 0 for every game
    3. “replace” the value by a 1 “if” a game(s) goals_for is equal to max_goals_for
    4. “browse” the data under the “if” condition that mystery_game is equal to 1 */

* 10. What is the largest total number of goals scored in a game? Identify this game (or such games) using an automated procedure
/*  1. “generate” the variable total_goals as the sum of goals and identify game(s) adapting the above procedure */

* 11. How did teams perform at scoring goals during the world cup?
/*  1. “egenerate” the variable nb_goals as the “sum” of goals “by” team */

* 12. How many games did each team play?
/*  1. “egenerate” the variable nb_games as the “count” of games “by” team */

* 13. How did teams perform at scoring goals per game?
/*  1. “egenerate” the variable nb_goals_g “sum” of goals/game “by” team */

* 14. Keep the information at the team level (we want one line per country i.e. no "duplicates") and save it for Stata and for Excel in output folder
/*  1. “keep” relevant variables, “drop” “duplicates”
    2. “save” dataset in output folder goals_analysis.dta (stata format)
    3. “export” dataset in output folder as goals_analysis.xls (excel format) */
	
* 15. "Sort" it by team and "save" it as goals_analysis_for in Stata format in temp folder (tip: always specify the replace option)

* 16. Represent the results in a bar chart (tip: to break a long line, use ///)
/*  1. “bar” the number of goals per game “over” the different teams 
    2. are you happy with the x-legend? set an “angle” of 70 degrees for the “label” of teams (hint: this is done within the “over” command)
    3. are you happy with the y-legend? set an “angle” of 0 degrees for “ylabel” and add a “ytitle” to the axis “Goals scored per game”
    4. are you happy with the graph readability? add the number of goals at the top of each bar using “blabel”
    5. looks like there are too many decimals, right? add some rounding to blabel using the “format” suboption  */
		

/**********************************************
**** Second part: Merge with goals conceded ***
***********************************************/

* We now wish to add to the previous bar chart the number of goals conceded *

* 1. Re-import the original dataset from excel

* 2. How many goals did team concede? per game?

* 3. Keep the information at the team level (we want one line per country)

* 4. "Sort" data by team and "save" it as goals_analysis_against in Stata format in temp folder

* 5. "Merge" the dataset goals_analysis_against with the dataset goals_analysis_for

* 6. "Drop" the _merge variable and save the merged data as goals_analysis.dta in temp folder

* 7. Represent both goals for and against in a bar chart using your previous bar chart command
/*  1. are you happy with the readability of the numbers on top of the bars? change their "orientation" and "size"
    2. are you happy with the labelling of the legend? Override it using the "label" command in the "legend" option */
	
* 8. "Export" this graph as bar_goals_per_game.png in the output folder (tip: always specify the replace option)

* 9. Clean the data (if needed) and export it to excel as analysis_goals_per_game.xls in output folder

/****************************************************
**** Third part: automated analysis with collapse ***
****************************************************/

* 1. Re-import the original dataset

* 2. Construct in one "collapse" command the variables nb_games nb_goals_for nb_goals_against

* 3. "Generate" the variables nb_goals_for_g and nb_goals_against_g 

* 4. Check it is consistent with previous analysis using the "cf" command

* 5. Stata may suggest there are some mismatch, are there? try to understand what is happening!

/**************************************************************
** CONGRATS!!! You have done your first analysis with Stata! **
**************************************************************/







