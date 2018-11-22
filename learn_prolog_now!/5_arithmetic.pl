%%% Chapter 5: Arithmetic %%%

% - Accumulators with tail recursion are a good idea; the solution is ready
%   without additional unification that needs to build back from the stack.
% - Vars to right of arithmetic must be instantiated already... this limits
%   the inputs you can plug into the funcs.


%%% Exercises %%%

% 5.1) increment/2
increment(X,Y) :- Y is X+1.

% 5.2) sum/2
sum(X,Y,Z) :- Z is X+Y. % X and Y must be to right of is/2

% 5.3) add1/2

% oops, this one reverses the list too
% add1Acc([H|T],Acc,OutL) :- add1Acc(T,[P1|Acc],OutL), P1 is H+1.
% add1Acc([],L,L).
% add1(InL,OutL) :- add1Acc(InL,[],OutL).

add1([Hi|Ti],[Ho|To]) :- add1(Ti,To), Ho is Hi+1.
add1([],[]).

%%% Practical Session %%%

% 1) min/2 using minAcc/3
minAcc([H|T],Acc,Min) :- H > Acc, minAcc(T,Acc,Min).
minAcc([H|T],Acc,Min) :- H =< Acc, minAcc(T,H,Min).
minAcc([],Min,Min).
myMin([H|T],Min) :- minAcc(T,H,Min).

% 2) scalarMult/3
scalarMult(M,[Hi|Ti],[Ho|To]) :- scalarMult(M,Ti,To), Ho is M*Hi.
scalarMult(_,[],[]).

% 2) dot/3
% sumacc([H|T],A,S) :- A is A+H, sumacc(T,A,S).
% sumacc([],S,S).
% sumem(L,S) :- sumacc(L,0,S).
% dotacc([H1|T1],[H2|T2],[Acc|Ta]) :- dotacc(T1,T2,Ta), Acc is (H1*H2)+ .
% dotacc([],[],Mult,Mult). 