
#const n=4.

% Defining variables
number(1..4).
row(1..n).
column(1..n).

% Guessing Possible Solutions
% each cell (X, Y) must contain exactly one number (1 to 4)
1 { sudoku(X, Y, N) : number(N) } 1 :- row(X), column(Y).

% Defining Constraints
% predefined initial values
sudoku(X, Y, N) :- initial(X, Y, N).

% no number appears twice in the same row
:- sudoku(X, Y, N), sudoku(X', Y, N), X != X'.

% no number appears twice in the same column
:- sudoku(X, Y, N), sudoku(X, Y', N), Y != Y'.

% no number appears twice in the same subgrid
subgrid(X, Y, 1) :- row(X), column(Y), X <= 2, Y <= 2.
subgrid(X, Y, 2) :- row(X), column(Y), X <= 2, Y > 2.
subgrid(X, Y, 3) :- row(X), column(Y), X > 2, Y <= 2.
subgrid(X, Y, 4) :- row(X), column(Y), X > 2, Y > 2.

:- sudoku(X, Y, N), sudoku(X', Y', N), subgrid(X, Y, S), subgrid(X', Y', S), (X,Y) != (X',Y').

% Show the solutions
#show sudoku/3.
