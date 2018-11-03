% Chapter 6: More Lists

% wrong append; something weird with Tail
% app([Hx|Tx],A,App) :- app(Tx,[A|Hx],App).
% app([],L,L).

% append
app([H|Tx],L,[H|Ty]) :- app(Tx,L,Ty). % put same Heads on
app([],L,L).                          % after copying the 2nd List

% efficient list reversal using accumulator
accRev([H|T],A,R) :- accRev(T,[H|A],R).
accRev([],L,L).
rev(L,R) :- accRev(L,[],R).

% 6.1 double the list
dbl(L,D) :- app(L,L,D).

% 6.2 palindrome detection
pal(L) :- rev(L,L).
