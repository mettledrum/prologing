% 1.04 length
my_len([], 0).
my_len([_|Tail], Answer) :- my_len(Tail, Tally), Answer is Tally + 1.

% 1.01 last element
my_last([Answer|Tail], Answer) :- my_len(Tail, 0).
my_last([_|Tail], Answer) :- my_last(Tail, Answer).

% 1.02 penultimate element
my_pen([Ans|Tail], Ans) :- my_len(Tail, 1).
my_pen([_|Tail], Ans) :- my_pen(Tail, Ans).

% 1.03 kth element
my_kth([Ans|Tail], Ans, K) :- my_len(Tail, K).
my_kth([_|Tail], Ans, K) :- my_kth(Tail, Ans, K).

% 1.05 reverse
my_rev([], []).
my_rev([X], [X]).
% ???
