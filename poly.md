# Code for Econometrics 101

## Introduction

As for most scientific endeavors, the accumulation of knowledge in economics is based on a permanent "back and forth" 
movement between economic theory and empirical observations. Researchers typically:
1. Observe an empirical pattern;
2. Try to build a theory which explains this stylized fact;
3. Empirically test the theory's predictions to confirm or invalidate their understanding of the phenomenon.

With the surge of computational power, the amount of data at our disposal has drastically increased
in the past decades, opening many new avenues to find surprising stylized facts and test past theories. 
**In turn, this means you are more than likely to work with data at some point in your career as an economist.**

Unsurprisingly, as more and more academics work with observational data, standards and best practices are progressively 
emerging to ensure the transparency and replicability of research papers. In fact, an increasing number of top-journals
require academics to provide detailed replication folders prior to publication (https://www.aeaweb.org/journals/policies/data-code).

The purpose of this short lecture is to provide you with a gentle introduction to working with data in economics. In this course, you will:
1. Get a general overview of how an applied econometric project is conducted/structured;
2. Find general advice on writing and thinking about code;
3. Learn to work with the simplest (and commonly used) statistical programming software, namely Stata.

We'll start with a brief introduction to coding in general and stata in particular. Then we will explore together the SPEED database 
(i.e. a large record of global social unrest episodes) and attempt to formulate research questions on the determinants of social unrest. 
Hopefully, at the end this lecture, you'll have learned technical skills, formulated many questions and found fragile answers... 
They call that research!

> **An Example of Economic Research in Practice**
>
> **Stylized fact** = Many countries have implemented subsidies on the rental of flats. In France, they are called the APL (Aides Pour le Logement).
> At the same time, rental prices for flats have increased.
> 
> **Theoretical explanation** = In the market for rentals, subsidizing the rental of flats shifts the demand curve upwards, 
> which in turn increases rental prices. The economic incidence of the subsidy will actually depend on the shape of the 
> supply and demand curves, and on the specifics of the subsidy 
> (e.g. is it given to everyone or under specific conditions).
>
> **Empirical test** = In fact, several studies have confirmed this diagnosis in different countries at different time periods.
> For a study on the French market, you may refer in the folder references to 
*"L'impact des aides au logement sur le secteur locatif privé"* (Céline Grislain-Letrémy et Corentin Trevien (2014)).

## I. Getting Started

So how do we work with data? Well, if your Rainman, I guess you could use a piece of paper. 
For all the others, I would recommend to have a computer do the work for you. 
In order to that, you need to know how to interact with the computer. 
Let's review some key concepts to get us started.

### Key Concepts

- **Command line**: *"A command-line interface (CLI) processes commands to a computer program in the form of lines of text." (Wikipedia)* 
The command line is the interface which translates the operations you would like the computer to perform, which you write as text, 
into something the computer can understand.
- **Scripts**: You will want to have the computer do many things sequentially. Scripts help you keep track of the commands sent to the 
computer through the command line. A script is a text file in which are written series of ordered commands for the command line. 
- **Directories**: You will also want to store your work somewhere. Directories are precisely folders in which you store various files 
(such as data sources, scripts and results).
- **Log files**: More often than not, things will go wrong. Log files help you keep track of what the computer did and whether it flagged some errors.

Let's put these concepts in practice, now.

> **Training Exercise**
> 
> 1. Create a folder named "basics". This will be your main directory.
>
> 2. Open stata. At the top on the left of the interface, click on "New Do-File Editor".
>
> 3. Write the following chunk of code:
>
> ```
> display "Hello human. Thank you for creating me."
> sleep 5000
> display "I will now proceed to destroy the world."
> ```
>
> 4. Save the do-file as "hello_world.do".
>
> 5. Run the do-file by clicking on "Execute (do)".
>
> 6. Open another do-file and write the following chunk of code:
>
> ```
> display "..."
> sleep 5000
> display "Just kidding. See you around, human."
> ```
>
> 7. Save the do-file as "farewell.do".
>
> 8. Run the do-file by clicking on "Execute (do)".
>
> 9. Now create one last do-file, which we will save as "main.do":
>
> ```
> clear all 
> log using "./logs/main_log", replace
> do "hello_world.do"
> do "farewell.do"
> log close
> ```
>
> 10. Run the do-file by clicking on "Execute (do)".
>
> Congrats! You've just written your first fully automated code pipeline.


### Rules to live by 

Getting the computer to do what you want it to do is good, but you also take many other factors into consideration. 
Here are the core rules you should always have in mind when you write some code.

#### The basics 

Anyone should be able to read your code without reading the documentation. Your code should be clear, consistent and simple. This may sound ridiculous 
at first, but consider this: 
1. You will be working in teams in the future, and that many colleagues may have to fix your code at some point. 
2. Sometimes, you will go back to code you wrote months or years before, and wish you had not called all your economic variables "x","y" and "z", 
instead of "gdp", "population" and "gini_index". 
 
- **Clarity**: Name your variables, functions and classes with explicit titles. 
- **Consistency**: Be consistent in your coding style (e.g. If all the sequences you have coded up-to-now are named "sequ_fibonacci", "sequ_hexagonal", etc. 
Don't name the next sequence "quadratic_sequ"!)
- **Simplicity**: Add comments when needed, but do not comment obvious operations as this will 
overburden the reader with superfluous information.

> ** Example: Computing Sequences **

#### More advanced considerations

- **Automation**: It's OK to be lazy, but in a smart way. You should always follow the DRY principle (don't repeat yourself), also known as DIE 
(duplication is evil). This will allow your code to be *reusable* for other projects by yourself and other people. What looks like a waste of time at first
becomes a fruitful investment.

- **Efficiency**: Some projects will require very large computational power. There are many ways to do the same task, try to go for the most efficient 
solution whenever possible, as this will increase the *scalability* of your code. 

> ** Example: Monte Carlo Simulations **

### Additional advice
- Write small chunks of code and test them before moving on. Think of coding as LEGOs. You need to tear every piece apart before putting them back together.
- Keep in mind that a machine is DUMB. Be rigorous when naming variables and functions, as the command line will usually not tolerate approximative naming
and throw an error. 
- You'll never know all the commands, so learn to search efficiently. In stata, you may type "help *your_command*" to access the documentation.  

## II. Exploring a Dataset

We are now ready to work with a real data set and explore stata's functionalities. We will work with the Social, Political and Economic Event Database Project (SPEED), which you will find in "./social_unrest_project/data/ssp_public.csv".

> The SPEED Database according to its authors
> *"SPEED is a technology-intensive effort to extract event data from a global archive of news reports covering the Post WWII era. It is designed to provide insights into key behavioral patterns and relationships that are valid across countries and over time. Within SPEED, event data is generated by human analysts using a suite of sophisticated tools to implement carefully structured and pretested protocols. These protocols are category-specific electronic documents that are tailored to the information needs of a particular category of events (civil unrest, property rights, electoral processes, etc.). SPEED data will produce insights that complement those generated by other components of the SID project (constitutional data, archival data, survey-based data, etc.) because event data generates "bottom-up" observations from news reports. In generating these event data SPEED leverages tens of billions of dollars that have been invested in compiling news reports from throughout the world."*

Data 
- reading data
- variables and types

Merge
- merge with socio-economic data for each country

Tables
- summarize, tabulate, describe

Graphs
- graph syntax 

------------------------------------------------

Related scripts
--> "./code/social_unrest/exploring_data.do"

------------------------------------------------

## III. Thinking About Data

Formulating research questions and trying to find preliminary answers

- How does social unrest relate to the business cycle?
- How does social unrest relate to fiscal policies?
- How does social unrest relate to a neighbouring country's social unrest episodes?

--> To seriously answer these questions, you need to pay attention in your econometrics lecture!

------------------------------------------------

Related scripts
--> "./code/social_unrest/digging_deeper.do"

------------------------------------------------

## Conclusion



## Additional Material 

Coding in General 
- http://web.stanford.edu/~gentzkow/research/CodeAndData.pdf
- http://www.danielmsullivan.com/pages/tutorial_workflow_3bestpractice.html
- 99,9% of the questions you're asking yourself have already been asked by someone on stackoverflow (www.stackoverflow.com).
- Keeping track of different versions of your code may be cumbersome. Thankfully, very nice solutions exist and take half a day to get used to. Half a day against struggling for eternity... your choice! (www.github.com OR www.gitlab.com)

Finding Data Sources
- Réseau Quetelet (http://quetelet.progedo.fr/)
- ICPSR (https://www.icpsr.umich.edu/icpsrweb/)
- INSEE (https://www.insee.fr/)
- Other options: social media, newspapers, congress records, e-commerce platforms, etc. But you'll have to work a bit harder to get those!

Stata
- User manual (https://www.stata.com/manuals13/u.pdf)

Common (slightly more advanced) programming languages
- Python (https://tanthiamhuat.files.wordpress.com/2018/04/pythondatasciencehandbook.pdf)
- R (https://www.econometrics-with-r.org/)
- Matlab