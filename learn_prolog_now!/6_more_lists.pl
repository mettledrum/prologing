%%% Chapter 6: More Lists %%%

% append
app([H|T],L2,[H|L3]) :- app(T,L2,L3). % put same Heads on
app([],L,L).                          % after copying the 2nd List

% efficient list reversal using accumulator
accRev([H|T],A,R) :- accRev(T,[H|A],R).
accRev([],L,L).
rev(L,R) :- accRev(L,[],R).

% suffix
suff(S,L) :- app(_,S,L).

% prefix
pref(P,L) :- app(P,_,L).

% subList
subList(SubL,L) :- suff(S,L), pref(SubL,S).


%%% Exercises %%%

% 6.1) double the list
dbl(L,D) :- app(L,L,D).

% 6.2) palindrome detection
pal(L) :- rev(L,L).

% 6.3) shave off first and last elements of a list
notFirst([_|T],T).
notLast([H|T],[H|L]) :- notLast(T,L).
notLast([_],[]).
topTail(InL,OutL) :- notFirst(InL,X), notLast(X,OutL).

% 6.4.1) last element in list using rev/2
lastRev(L,H) :- rev(L,[H|_]).

% 6.4.2) last element in list using recursion
lastRec([X],X).
lastRec([_|T],X) :- lastRec(T,X).

% 6.5) see if lists are the same except for first and last elements being swapped
firstOne([H|_],H).
lastOne([X],X).
lastOne([_|T],X) :- last(T,X).
swapfl(InL,OutL) :- topTail(InL,X), topTail(OutL,X), 
                    firstOne(InL,Y), lastOne(OutL,Y).

% 6.6) who owns the zebra?
isMember([X|_], X).
isMember([_|T],X) :- isMember(T,X).

% see if X2 is right of X1 in the list
isRight([X1|T],X1,X2) :- isMember(T,X2).
isRight([_|T],X1,X2) :- isRight(T,X1,X2).

% The Englishman lives in the red house.
% The jaguar is the pet of the Spanish family.
% The Japanese lives to the right of the snail keeper.
% The snail keeper lives to the left of the blue house.
hood([H1,H2,H3]) :- isMember([H1,H2,H3], house(color(red),natl(english),pet(_))),
                    isMember([H1,H2,H3], house(color(_),natl(spanish),pet(jaguar))),
                    isRight([H1,H2,H3],  house(color(_),natl(_),pet(snail)), house(color(_),natl(japanese),pet(_))),
                    isRight([H1,H2,H3],  house(color(_),natl(_),pet(snail)), house(color(blue),natl(_),pet(_))).

zebra(Z) :- hood(L), isMember(L, house(color(_),natl(Z),pet(zebra))).


%%% Practical Session %%%

% 1) write member/2 in one line using append/3
% X is a member of L if you can construct L using X
memberOneLine(L,X) :- app(_,[X|_],L).

% 2) write set/2 using member/2
setAcc([H|T],A,OutL) :- not(isMember(A,H)), setAcc(T,[H|A],OutL).
setAcc([H|T],A,OutL) :- isMember(A,H), setAcc(T,A,OutL).
setAcc([],A,A).
set(InL,OutL) :- setAcc(InL,[],R), rev(R,OutL).

% 3) write flatten/2 without using append/3
