include "alldifferent.mzn";

int: n;
array[1..n] of var 1..n: rows; % variables & domains 

% column attack constraints
constraint alldifferent(rows);

% diagonal attack constraints
constraint alldifferent([rows[i] + i | i in 1..n]);
constraint alldifferent([rows[i] - i | i in 1..n]);

solve satisfy;
