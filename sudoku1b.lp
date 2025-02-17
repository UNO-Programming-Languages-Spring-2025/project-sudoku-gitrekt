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

% Assign subgrid labels based on position
% The 4x4 grid is divided into 4 subgrids:
%   - Top-left  (1,1) to (2,2) -> Subgrid 1
%   - Top-right (1,3) to (2,4) -> Subgrid 2
%   - Bottom-left (3,1) to (4,2) -> Subgrid 3
%   - Bottom-right (3,3) to (4,4) -> Subgrid 4
% Ensure X and Y are bound by row/column
subgrid(X, Y, 1) :- row(X), column(Y), X <= 2, Y <= 2.
subgrid(X, Y, 2) :- row(X), column(Y), X <= 2, Y > 2.
subgrid(X, Y, 3) :- row(X), column(Y), X > 2, Y <= 2.
subgrid(X, Y, 4) :- row(X), column(Y), X > 2, Y > 2.

% Show the solutions
#show sudoku/3.
#show subgrid/3.
