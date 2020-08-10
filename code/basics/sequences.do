/* 
In this do-file, I show two implementations of the Fibonacci sequence 
and the hexagonal sequence.

The Fibonacci sequence is defined as follows:
U_0 = 1 
U_1 = 1
U_n = U_[n-1] + U_[n-2] if n > 1

The hexagonal sequence is defined as follows:
U_n = 2*n^2 - n for all n >= 0

*/

clear all

* POOR CODE

program f_sequ /* makes program */
args n /* argument of the program */
qui set obs `n'
qui gen a=1 /* initialize */
qui replace a=a[_n-1]+a[_n-2] in 3/l /* compute fibonacci sequence based on the formula */
end

f_sequ 100

program sequ_h /* makes program */
args n /* argument of the program */
qui set obs `n'
gen b = 2*_n^2 - _n /* compute hexagonal sequence based on the formula */
end

sequ_h 100

* NEAT CODE

/*
This program computes the Fibonacci sequence up to a specified value of n.

The Fibonacci sequence is defined as follows:
U_0 = 1 
U_1 = 1
U_n = U_[n-1] + U_[n-2] if n > 1

Input = value of n (integer)
Output = variable 'fibonacci' with n ordered values of Fibonacci's sequence. 
*/

program compute_fibonacci_sequence
args n
qui set obs `n'
qui gen fibonacci = 1
qui replace fibonacci=fibonacci[_n-1]+fibonacci[_n-2] in 3/l
end

compute_fibonacci_sequence 100

/*
This program computes the hexagonal sequence up to a specified value of n.

The hexagonal sequence is defined as follows:
U_n = 2*n^2 - n for all n >= 0

Input = value of n (integer)
Output = variable 'hexagonal' with n ordered values of the hexagonal sequence. 
*/

program compute_hexagonal_sequence 
args n 
qui set obs `n'
gen hexagonal = 2*_n^2 - _n 
end

compute_hexagonal_sequence 100
