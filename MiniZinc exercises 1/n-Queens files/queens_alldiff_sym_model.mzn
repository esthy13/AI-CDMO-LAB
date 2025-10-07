include "alldifferent.mzn";
include "lex_lesseq.mzn";

int: n; % number of queens
array[1..n] of var 1..n: X; % variables & domains

% column attack constraints
constraint alldifferent(X);

% diagonal attack constraints
constraint alldifferent([X[i] + i | i in 1..n]);
constraint alldifferent([X[i] - i | i in 1..n]);

% dual model
array[1..n, 1..n] of var bool: B; % dual variables & domains

% channeling constraints
constraint forall(i in 1..n, j in 1..n)(
    B[i,j] <-> (X[i]=j)
);

% symmetry breaking constraints
constraint lex_lesseq([B[i,j] | i in 1..n, j in 1..n], [B[j,i] | i in 1..n, j in 1..n]);
constraint lex_lesseq([B[i,j] | i in 1..n, j in 1..n], [B[i,j] | i in reverse(1..n), j in 1..n]);
constraint lex_lesseq([B[i,j] | i in 1..n, j in 1..n], [B[j,i] | i in 1..n, j in reverse(1..n)]);
constraint lex_lesseq([B[i,j] | i in 1..n, j in 1..n], [B[i,j] | i in 1..n, j in reverse(1..n)]);
constraint lex_lesseq([B[i,j] | i in 1..n, j in 1..n], [B[j,i] | i in reverse(1..n), j in 1..n]);
constraint lex_lesseq([B[i,j] | i in 1..n, j in 1..n], [B[i,j] | i in reverse(1..n), j in reverse(1..n)]);
constraint lex_lesseq([B[i,j] | i in 1..n, j in 1..n], [B[j,i] | i in reverse(1..n), j in reverse(1..n)]);

solve satisfy;
