include "alldifferent.mzn";

int: n;
array[1..n] of var 1..n: X; % variables & domains 

% Channeling matrix: B[i,j] = 1 iff X[i] = j
array[1..n, 1..n] of var bool: B;

% column attack constraints
constraint alldifferent(X);

% diagonal attack constraints
constraint alldifferent([X[i] + i | i in 1..n]);
constraint alldifferent([X[i] - i | i in 1..n]);

% Channeling constraints
constraint forall(i in 1..n, j in 1..n)(
    (X[i] = j) <-> (B[i,j])
);

% Symmetry breaking: lex-leader (fix first queen in first half columns)
constraint X[1] <= ceil(n/2);

solve satisfy;
