% Run this by using:
% clingo lights-out-general.lp sample-problem.lp

% Definitions of problem topology
coord(1..N, 1..M) :- dim(N, M).
adjacent(X, Y, A, B) :-
    |X-A| + |Y-B| <= 1,
    coord(X, Y),
    coord(A, B).

% Each cell needs to be selected at most once in the solution.
% This is represented by the choice of action/2 in model.
0 {action(X, Y)} 1 :- coord(X, Y).

% Penalize each action, i.e. minimize the total number of solution steps.
:~ action(X, Y). [1@1,(X,Y)]

% An action must be performed odd number of times in neighborhood of each cell in order
% to switch invert it. In other words it cannot be performed even number of times.
:- C = #count{ (A,B) : adjacent(A, B, X, Y), action(A, B)},
   C \ 2 = 1,
   coord(X, Y), 
   not x(X, Y).

% Cells marked by x/2, on the other hand, should keep their values.
% So an action cannot be performed odd number of times.
:- C = #count{ (A,B) : adjacent(A, B, X, Y), action(A, B)},
   C \ 2 = 0,
   x(X, Y).

#show action/2.
