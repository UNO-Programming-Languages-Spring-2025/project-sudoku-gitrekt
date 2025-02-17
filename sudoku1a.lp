% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

#const n=4.

row(1..n).
col(1..n).
number(1..n).

{ sudoku(I,J,N) : row(I), col(J), number(N) }.

sudoku(I,J,N) :- initial(I,J,N).

:- { sudoku(I,J,N) } != 16.
:- sudoku(I,J,N), sudoku(I',J,N), I != I'.
:- sudoku(I,J,N), sudoku(I,J',N), J != J'.
:- sudoku(I,J,N), sudoku(I,J,N'), N != N'.

#show sudoku/3.
