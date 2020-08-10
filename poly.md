# Code for Econometrics 101

## Introduction

Why we work with data: theory and empirics in economics

The importance of transparency and replication 
- https://www.aeaweb.org/journals/policies/data-code
- Examples: Matthew Gentzkow's replication folders

Objectives of the course:
- provide you with a general overview of how an applied econometric project is conducted/structured
- provide you with general advice on writing and thinking about code
- get you going with the simplest and most used statistical programming software: Stata

Software used: Stata
Data used: Global Social Unrest Episodes (SPEED Database)

## I. Getting Started

KEY CONCEPTS
- Directories = Folders in which you wish to store various files (such as data sources, codes and results).
- Command line = "A command-line interface (CLI) processes commands to a computer program in the form of lines of text." (Wikipedia)
- Scripts = Series of ordered commands for the command line. 
- Log files = Helps you keep track of what went wrong.

------------------------------------------------

A WORKING EXAMPLE

--> "./code/basics/hello_world.do"
--> "./code/basics/farewell.do"
--> Wrap both scripts in a "main.do" script

------------------------------------------------

RULES TO LIVE BY
Important stuff
- Clarity (good variable names, good comments: don't comment obvious stuff!, good documentation if needed)
- Consistency (keep variable and function names consistent)
- Simplicity (I want to understand your code) --> remove anything superfluous

/!\ Example: computing sequences /!\

More advanced considerations
- Automation (it's OK to be lazy, but in a smart way)
--> DRY principle (don't repeat yourself), also known as DIE (duplication is evil) 
--> reusability

/!\ Example: Monte Carlo simulations /!\

- Efficiency (try to reduce the time to solution) 
--> scalability

/!\ Example: Monte Carlo simulations with multiple cores /!\

ADDITIONAL ADVICE
- Write small chunks of code and test them before moving on.
- Keep in mind that a machine is DUMB. Be rigorous when naming variables and functions. 
- You'll never know all the commands, so learn to search efficiently. --> help 
- Read other people's code to get better.

## II. Exploring a Dataset

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
- Other introductory courses (Antoine Bozio)

Common (slightly more advanced) programming languages
- Python for data science (https://tanthiamhuat.files.wordpress.com/2018/04/pythondatasciencehandbook.pdf)
- R for Econometrics (https://www.econometrics-with-r.org/)
- Matlab