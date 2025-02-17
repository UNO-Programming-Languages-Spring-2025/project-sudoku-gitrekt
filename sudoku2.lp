#const n=9.

% Defining variables
number(1..n).
row(1..n).
column(1..n).

% Guessing Possible Solutions
% Each cell (X, Y) must contain exactly one number (1 to 9)
1 { sudoku(X, Y, N) : number(N) } 1 :- row(X), column(Y).

% Defining Constraints
% Predefined initial values
sudoku(X, Y, N) :- initial(X, Y, N).

% No number appears twice in the same row
:- sudoku(X, Y, N), sudoku(X', Y, N), X != X'.

% No number appears twice in the same column
:- sudoku(X, Y, N), sudoku(X, Y', N), Y != Y'.

% Assign subgrid labels based on position
% The 9x9 grid is divided into 9 subgrids (3x3 each):
%   - Subgrid (1,1) to (3,3) -> Subgrid 1
%   - Subgrid (1,4) to (3,6) -> Subgrid 2
%   - Subgrid (1,7) to (3,9) -> Subgrid 3
%   - Subgrid (4,1) to (6,3) -> Subgrid 4
%   - Subgrid (4,4) to (6,6) -> Subgrid 5
%   - Subgrid (4,7) to (6,9) -> Subgrid 6
%   - Subgrid (7,1) to (9,3) -> Subgrid 7
%   - Subgrid (7,4) to (9,6) -> Subgrid 8
%   - Subgrid (7,7) to (9,9) -> Subgrid 9

subgrid(X, Y, 1) :- row(X), column(Y), X <= 3, Y <= 3.
subgrid(X, Y, 2) :- row(X), column(Y), X <= 3, Y > 3, Y <= 6.
subgrid(X, Y, 3) :- row(X), column(Y), X <= 3, Y > 6.
subgrid(X, Y, 4) :- row(X), column(Y), X > 3, X <= 6, Y <= 3.
subgrid(X, Y, 5) :- row(X), column(Y), X > 3, X <= 6, Y > 3, Y <= 6.
subgrid(X, Y, 6) :- row(X), column(Y), X > 3, X <= 6, Y > 6.
subgrid(X, Y, 7) :- row(X), column(Y), X > 6, Y <= 3.
subgrid(X, Y, 8) :- row(X), column(Y), X > 6, Y > 3, Y <= 6.
subgrid(X, Y, 9) :- row(X), column(Y), X > 6, Y > 6.

% No number appears twice in the same subgrid
:- sudoku(X, Y, N), sudoku(X', Y', N), subgrid(X, Y, S), subgrid(X', Y', S), (X, Y) != (X', Y').

% Show only sudoku/3 facts
#show sudoku/3.
