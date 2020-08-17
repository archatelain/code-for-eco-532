/* 
In this script, I give you examples of:
- writing a program to automate a series of operations;
- writing a loop to perform the same operation on multiple different variables
efficiently.
*/

/* WRITING A PROGRAM */

/* 
This program repeats the phrase it is provided with.
*/

capture program drop echo
program define echo
    display as text "`0'"
end

echo Taiooho Taiooho Taioohohohohoho

/*
This program takes a number as input and outputs its square.
*/

capture program drop square
program define square
	display `0'^2
end

square 9


/* WRITING A LOOP */

/*
I write a loop using the program echo to have stata count to ten for us.
I add a second between each enumeration.
*/

foreach num of numlist 1 2 3 4 5 6 7 8 9 10 {
    echo `num'
	quietly sleep 1000
}

/*
I write a similar loop using the program square.
I add a second between each enumeration.
*/

foreach num of numlist 1 2 3 4 5 6 7 8 9 10 {
    square `num'
	quietly sleep 1000
}
