
#const n=4.

% Defining variables
number(1..4).
row(1..n).
column(1..n).

% Guessing Possible Solutions
% choice rule where it guesses what number N should be in each position (X,Y)
{ sudoku(X, Y, N) : row(X), column(Y), number(N)}.

% Defining Constraints
% fill in the values around the board that are defined in the block of initial values
sudoku(X, Y, N) :- initial(X, Y, N).

% This ensures that there are exactly 16 (4x4) numbers selected
% "if the number of assigned values is not exactly 16, reject the solution"
:- {sudoku(X, Y, N)} != 16.

% no number appears twice in the same row
:- sudoku(X, Y, N), sudoku(X', Y, N), X != X'.

% no number appears twice in the same column
:- sudoku(X, Y, V), sudoku(X, Y', V), Y != Y'.

% no cell has more than one number
:- sudoku(X, Y, N), sudoku(X, Y, N'), N != N'.


% show the solutions with a restriction of only showing 3 possible solutions
#show sudoku/3.
