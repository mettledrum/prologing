%%% Chapter 4: Lists %%%


%%% Exercises %%%

% 4.3) get 2nd element of list
get2nd([_,X|_], X).

% 4.4) check to see lists match, except for switched 1st & 2nd elements.
swap12([X,Y|T], [Y,X|T]).

% 4.5) translate
tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([G|T1],[E|T2]) :- listtran(T1,T2), tran(G,E).
listtran([],[]).

% 4.6) write twice/2
twice([H|T1],[H,H|T2]) :- twice(T1,T2).
twice([],[]).


%%% Practical Session %%%

% 1) combine1
comb1([H1|T1],[H2|T2],[H1,H2|T3]) :- comb1(T1,T2,T3).
comb1([],[],[]).

% 2) combine2
comb2([H1|T1],[H2|T2],[[H1,H2]|T3]) :- comb2(T1,T2,T3).
comb2([],[],[]).

% 3) combine3
comb3([H1|T1],[H2|T2],[j(H1,H2)|T3]) :- comb3(T1,T2,T3).
comb3([],[],[]).
