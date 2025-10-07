include "alldifferent.mzn";

int: n;
array[1..n] of var 1..n: X; % variables & domains 

% ### AllDiff decomposition ###

% column attack constraint
constraint forall(i, j in 1 .. n where i < j)(X[i] != X[j]);

% diagonal attack constraints
constraint forall(i, j in 1..n where i<j)(X[i]+i != X[j] + j);
constraint forall(i, j in 1..n where i<j)(X[i] - i != X[j] - j);

solve :: int_search(X, input_order, indomain_min) satisfy;
