% Chapter 6: More Lists

% wrong append; something weird with Tail
% app([Hx|Tx],A,App) :- app(Tx,[A|Hx],App).
% app([],L,L).

% append
app([H|T],L2,[H|L3]) :- app(T,L2,L3). % put same Heads on
app([],L,L).                          % after copying the 2nd List

% efficient list reversal using accumulator
accRev([H|T],A,R) :- accRev(T,[H|A],R).
accRev([],L,L).
rev(L,R) :- accRev(L,[],R).

% 6.1 double the list
dbl(L,D) :- app(L,L,D).

% 6.2 palindrome detection
pal(L) :- rev(L,L).

% 6.4.1 last element in list using rev/2
lastRev(L,H) :- rev(L,[H|_]).

% 6.4.2 last element in list using recursion
lastRec([X],X).
lastRec([_|T],X) :- lastRec(T,X).