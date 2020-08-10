# Code for Econometrics 101

## Introduction

Why we work with data: theory and empirics in economics

The importance of transparency and replication

Objectives of the course:
- provide you with a general overview of how an applied econometric project is conducted/structured
- provide you with general advice on writing and thinking about code
- get you going with the simplest and most used statistical programming software: Stata

Software used: Stata
Data used: Global Social Unrest Episodes (SPEED Database)

## I. Getting Started

Key concepts
- Directories = Folders in which you wish to store various files (such as data sources, codes and results).
- Command line = "A command-line interface (CLI) processes commands to a computer program in the form of lines of text." (Wikipedia)
- Scripts = Series of ordered commands for the command line. 
- Log files = Keep track of what went wrong.

Scripts
- Automation (it's OK to be lazy, but in a smart way) / DRY principle (don't repeat yourself), also known as DIE (duplication is evil) --> reusability
- Clarity (good variable names, good comments: don't comment obvisous stuff!, good documentation if needed)
- Consistency (keep variable and function names consistent)
- Simplicity (I want to understand your code) --> remove anything superfluous
- Efficiency (try to reduce the time to solution) --> scalability

Additional Advice
- WRITE SMALL CHUNKS OF CODE AND TEST THEM BEFORE MOVING ON.
- Keep in mind that a machine is DUMB. Be rigorous.
- You'll never know all the commands, so learn to search efficiently. 
- Read code to get better (opensource platforms).

Training exercises --> simple_problems.do

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

Training exercises --> exploring_data.do

## III. Thinking About Data

Formulating research questions and trying to find preliminary answers

- How does social unrest relate to the business cycle?
- How does social unrest relate to fiscal policies?
- How does social unrest relate to a neighbouring country's social unrest episodes?

--> That's why you need to learn a bit more about econometrics!

Training exercises --> digging_deeper.do

## Conclusion

Other programming languages outthere

## Additional Material 

Coding in General 
- Gentzkow
- Github/Gitlab
- Stackoverflow

Finding Data Sources
- Réseau Quetelet
- ICPSR
- INSEE
- Other options: social media, newspapers, congress records, e-commerce platforms, etc. But you'll have to work a bit harder to get those!

Stata
- User manual
- Other introductory courses

Python
- Python for data science

R
- R for Econometrics

Matlab
- User manual 
- Find course on modeling with matlab