% 1.04 # of elements of a list
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

% append
my_append([], Same, Same).
my_append([H|T], Same, [H|Appended]) :- my_append(T, Same, Appended).

% 1.14 double elements of a list (doesn't work with dupes)
my_double([], []).
my_double([H|T], [H,H|X]) :- my_double(T, X).
