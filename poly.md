# A Gentle Introduction to Working with Data

## Introduction

As for most scientific endeavors, the accumulation of knowledge in economics is based on a permanent "back and forth" 
movement between economic theory and empirical observations. Researchers typically:
1. Observe an empirical pattern;
2. Try to build a theory which explains this stylized fact;
3. Empirically test the theory's predictions to confirm or invalidate their understanding of the phenomenon.

Since the 1990s, the amount of data at our disposal has drastically increased, opening new avenues to find surprising stylized facts and test past theories. 
**In turn, this means you are more than likely to work with data at some point in your career as an economist.**

Unsurprisingly, as more and more academics work with observational data, standards and best practices are progressively 
emerging to ensure the transparency and replicability of research papers. In fact, an increasing number of top journals
require academics to provide detailed replication folders prior to publication (https://www.aeaweb.org/journals/policies/data-code).
**In the future, you will need to meet these standards.**

The purpose of this mini-lecture is to provide you with a gentle introduction to working with data in economics. In this course, you will:
1. Find general advice on writing and thinking about code;
2. Get a general overview of how an applied econometric project is structured;
3. Learn to work with the simplest (and commonly used) statistical programming software, namely Stata.

Note that this lecture is not intended as an econometrics course. Though a basic understanding of statistics is required, we will not spend time 
on econometric theory. Note also that this lecture does not pretend to be comprehensive. Among the material which is not covered, 
several object-oriented programming languages have gained traction in the private sector as well as in academic circles (in particular Python and R), 
and you will likely stumble upon such languages during your education and career. In the Master in Economics, several courses are taught in R
or Python, which will allow you to get acquainted with these languages. Keep in mind that most of the concepts and tips in this lecture may be 
transposed to more advanced programming languages.

We will start with a brief introduction to coding in general and stata in particular. Then we will explore together the SPEED database 
(i.e. a large record of global social unrest episodes). 

> **What is Stata?**
> 
> *"Stata is a general-purpose statistical software package created in 1985 by StataCorp. Most of its users work in research, especially in the fields of economics, sociology, political science, biomedicine, and epidemiology.[2] Stata's capabilities include data management, statistical analysis, graphics, simulations, regression, and custom programming. It also has a system to disseminate user-written programs that lets it grow continuously. The name Stata is a syllabic abbreviation of the words statistics and data." (Wikipedia)*
>
> It makes sense to begin with Stata for several reasons: 
> - It is widely used by economists, so you need to understand its logic if you want to read most replication folders in the past decades.
> - It is super easy-to-use.
> - The documentation is neat, and commands as well as add-on packages are very reliable.
> - Most cutting edge econometric techniques are already implemented (which is not necessarily the case in other languages/softwares).	
>
> Nonetheless, Stata does have some limitations:
> - Stata is a software, not a programming language. It is more limited than R or Python. For web-scraping, machine learning, developing apps... 
You have knocked on the wrong door.
> - Stata has its own logic for data manipulation, which makes it easy-to-use but rather counter-intuitive once you look at more advanced alternatives.
> - Stata is built to analyze structured datasets. If you want to recover unstructured data to later clean it up, output a structured dataset, and analyze 
it, then you need to consider alternatives (examples of unstructured data: social media data, google queries, online purchases, text data in general). 

## I. The Basics

You get why you're here now. So how do we work with data? Well, if you're Rain Man, I guess you could use a piece of paper. 
For all the others, I would recommend to have a computer do the work for you. 
Open Stata to get started.

### 1. Key Concepts 

#### 1.1. Directories 

> A directory is a folder in which you store various files related to your project.

You will need to store your work somewhere (e.g. your data sources, scripts and results). Download the folder code-for-econometrics-101 from this git repo. 
This will be the main directory of this mini-course. Then create a subfolder named "basics" in the main directory. 
We will work in this  subdirectory for part I.

#### 1.2. The command line

> *"A command-line interface (CLI) processes commands to a computer program in the form of lines of text." (Wikipedia)*

You interact with the computer through the **command line**. The command line is the interface which translates the operations you would like the 
computer to perform into something the computer can understand. 

In Stata, the command line is a box at the bottom of the interface. Type the following command and see what happens:

```
display "This is a test."
```

#### 1.3 Scripts

> A script is a text file in which are written series of ordered commands to the command line. 

In most projects, you will likely ask many things to the computer (e.g. format the data, compute things, output the results, etc.), which will result into
multiple commands. **Scripts** help you keep track of the commands sent to the computer through the command line. 

In Stata, scripts are called "do-files". At the top on the left of the interface, click on "New Do-File Editor" and write the following chunk of code:

```
display "Hello human. Thank you for creating me."
sleep 5000
display "I will now proceed to destroy the world."
display "..."
display "1"
sleep 1000
display "2"
sleep 1000
display "3"
sleep 1000
display "4"
sleep 1000
display "5"
sleep 1000
display "Just kidding. See you around, human."
```

Now save your do-file as  "killer_robot.do" in your directory, and then run the do-file by clicking on "Execute (do)".

As you are likely to write multiple scripts for multiple subtasks in your project, it is good practice to have one script call all the other scripts
of your project. In this way, instead of executing manually all your scripts one by one, you can simply execute this overarching script ("one in script
to rule them all...").

Create a script called "main.do" in your directory, and write this chunk of code:

```
do "killer_robot.do"
```

In this do-file, you simply call your "killer_robot.do" file. Of course, if you had multiple do-files, you could call them sequentially like this:

```
do "killer_robot.do"
do "another_do_file.do"
do "and_another.do"
do "and_so_on_and_so_forth.do"
```

#### 1.4 Log files

> *"In computing, a log file is a file that records [...] events that occur in an operating system or other software runs." (Wikipedia)*

I hate to break it out to you, but more often than not, things will go wrong. **Log files** help you keep track of what the computer did and 
whether it flagged some errors. Edit your "main.do" file to look like this:

```
log using "./logs/main_log", replace
do "killer_robot.do"
log close
```

Now run this do-file. Have a look at the file "main_log" in the "logs" subdirectory.

Congrats! You've just written your first fully automated code pipeline.

### 2. Additional advice
- Write small chunks of code and test them before moving on. Think of coding as LEGOs. You need to tear every piece apart before putting them back together.
- You will never know all the commands, so learn to search efficiently. In Stata, you may type "help *your_command*" to access the documentation for 
this command.  

> **The Stata "help" command**
>
> Open a do-file in stata and type the following piece of code:
>
> ```
> help rnormal
> ```	

## II. Exploring a Dataset

We are now ready to work with a real data set and explore stata's functionalities. We will work with the Social, Political and Economic Event 
Database Project (SPEED). We will work in the subdirectory "social_unrest_project" for part II. 

To follow along, please create a do-file "part_2_explanations.do" and save it in "./social_unrest_project/codes/".

> **The SPEED Database according to its authors**
>
> *"SPEED is a technology-intensive effort to extract event data from a global archive of news reports covering the Post WWII era. It is designed to provide insights into key behavioral patterns and relationships that are valid across countries and over time. Within SPEED, event data is generated by human analysts using a suite of sophisticated tools to implement carefully structured and pretested protocols. These protocols are category-specific electronic documents that are tailored to the information needs of a particular category of events (civil unrest, property rights, electoral processes, etc.). SPEED data will produce insights that complement those generated by other components of the SID project (constitutional data, archival data, survey-based data, etc.) because event data generates "bottom-up" observations from news reports. In generating these event data SPEED leverages tens of billions of dollars that have been invested in compiling news reports from throughout the world."*

### 1. Loading Data 
You first need to load the database into Stata. In order to do this, run the following command:

```
use "../data/ssp_public.dta", clear

```

To see the database like an excel spreadsheet, type:

```
browse

```

### 2. Variables, Labels and Types

As you can see, each column represents a variable, and each row an observation. To get a general overview of the database, type:

```
describe
```

There are 62,141 observations in the database and 106 variables. Each variable has a name, a type and a label. The variable name is 
the name you should use to perform operations on the variable. The variable's type determines how the data will be stored (e.g. integer, 
float, string, etc.). This is somewhat constraining: for instance, a variable cannot jointly display character and numeric values, 
but only one of the two. For more information on variable storage types:

```
help data_types
```

The variable's label is for human comprehension. You want variable names to be clear, but rather short, so you can add more information if 
needed in the variable's label. Variables may be easily created and labeled using the "generate" and "label" commands:

```
/*
I generate draws from a normal distribution with mean 0 and standard deviation 1.
I name the variable X, and I label it "draws from a normal distribution N(0,1)"
*/

generate X = rnormal(0,1)
label variable X "draws from a normal distribution N(0,1)"
```

To look at specific variables:

```
tabulate country
summarize N_INJURD
```

Sometimes, you might want to look at the options for each command:

```
help summarize
summarize N_INJURD, detail
```

You can also combine tabulate and summarize if you need to:

```
tabulate country, summarize(N_INJURD)
```

### 3. Cleaning/Preserving/Filtering Data

To drop a variable, you can simply type:

```
drop X
```

To keep specific variables:

``` 
keep country year month
```

To keep specific observations:

```
keep if country == "United States"
```

Sometimes, you will want to do several operations on a database (which will mess it up), but keep a copy of the original data. To do that:

```
preserve 
*your operations
restore
```

### 4. Combining Multiple Datasets

```
merge
```

### 5. Graphs

There's nothing like a good graph to get your point across. To have a look at the complete documentation on graphs in Stata, type:

```
help graph
```

I will let you read this at home. In the meantime, here are two examples.

```
* Correlation Between Violence and Number of Injured People



* Bar plot of Event Location Types


``` 

### 6. Regression Analysis

Regression analysis is at the core of econometric theory. You will see the ins and outs of this tool in your econometrics courses. Let me simply 
provide you with the commands to estimate regression models in Stata:

```
reg y x
```

> **Training Exercise**
>
> 1. How many incidents are recorded for France? 
> 2. Which country had the most incidents? which region?
> 3. What is the average number of incidents per year over the period?
> 4. Plot the number of recorded incidents per year.
> 5. Plot the number of recorded incidents per year for the United States.
> 6. Plot the number of recorded incidents per year for each country (Hint: use a loop!).
> 7. How many injured people were there per country according to the database?
> 8. Plot the distribution of the number of injured people (Hint: use the command "kdensity").
> 9. Make a histogram of the number of incidents for the top-10 countries with the most incidents.
> 10. What country characteristics could explain social unrest? 
> 11. How does social unrest relate to the business cycle? (Hint: install hp-filter!)
>
> Solutions are here: "./social_unrest_project/code/part_2_solutions.do"

### III. Rules to live by

Getting the computer to do what you want is good, but you should also take many other factors into consideration. 
Here are the core rules you should always have in mind when you write some code.

##### Your code should not be hieroglyphs!

Anyone should be able to read your code without reading the documentation. 
 
- **Clarity**: Name your variables, functions and classes with explicit titles. 
- **Consistency**: Be consistent in your coding style (e.g. If all the sequences you have coded up-to-now are named "sequ_fibonacci", "sequ_hexagonal", etc. 
Don't name the next sequence "quadratic_sequ".)
- **Simplicity**: Add comments when needed, but do not comment obvious operations as this will 
overburden the reader with superfluous information. To write a comment within your script, combine asterisks and forward slashes:

```
/* 
This is a comment. 

It will not be considered as a command for the command line, but may clarify what your code does for the reader. 

Comments can be written over multiple lines and be as long as you wish (but please be concise!).
*/

* This is also a comment, but for one-liners.
```

All this may sound ridiculous at first, but consider this: 
1. You will be working in teams in the future, and many colleagues may have to fix your code at some point. 
2. Sometimes, you will go back to code you wrote months or years before, and wish you had not called all your economic variables "x","y" and "z", 
instead of "gdp", "population" and "gini_index". 

##### More advanced considerations

- **Automation**: It's OK to be lazy, but in a smart way. You should always follow the DRY principle (don't repeat yourself), also known as DIE 
(duplication is evil). This will allow your code to be *reusable* for other projects by yourself and other people. What looks like a waste of time at first
becomes a fruitful investment.

- **Efficiency**: Some projects will require very large computational power. There are many ways to do the same task, try to go for the most efficient 
solution whenever possible, as this will increase the *scalability* of your code. 

> **Some Examples**
>
>


## Additional Material 

**Coding in General** 
- http://web.stanford.edu/~gentzkow/research/CodeAndData.pdf
- http://www.danielmsullivan.com/pages/tutorial_workflow_3bestpractice.html
- 99,9% of the questions you're asking yourself have already been asked by someone on stackoverflow (www.stackoverflow.com).
- Keeping track of different versions of your code may be cumbersome. Thankfully, very nice solutions exist and take half a day to get used to. Half a day against struggling for eternity... your choice! (www.github.com OR www.gitlab.com)

**Finding Data Sources**
- Réseau Quetelet (http://quetelet.progedo.fr/)
- ICPSR (https://www.icpsr.umich.edu/icpsrweb/)
- INSEE (https://www.insee.fr/)
- Other options: social media, newspapers, congress records, e-commerce platforms, etc. But you'll have to work a bit harder to get those!

**Stata**
- User manual (https://www.stata.com/manuals13/u.pdf)
- A more comprehensive and detailed course on Stata (https://data.princeton.edu/stata)

**Common (slightly more advanced) programming languages**
- Python (https://tanthiamhuat.files.wordpress.com/2018/04/pythondatasciencehandbook.pdf)
- R (https://www.econometrics-with-r.org/)