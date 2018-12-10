%%% Exercises

% 7.1
s1 --> foo1,bar1,wiggle1.
foo1 --> [choo].
foo1 --> foo1,foo1.
bar1 --> mar1,zar1.
mar1 --> me1,my1.
me1 --> [i].
my1 --> [am].
zar1 --> blar1,car1.
blar1 --> [a].
car1 --> [train].
wiggle1 --> [toot].
wiggle1 --> wiggle1,wiggle1.

% 7.2
% DCG for a^n•b^n - {""}
s2 --> a2,b2.
a2 --> [a].
a2 --> [a],a2,b2.
b2 --> [b].

% 7.3
% DCG for a^n•b^2n
s3 --> [].
s3 --> a3,b3.
a3 --> [a].
a3 --> [a],a3,b3.
b3 --> [b],[b].


%%% Practical Session

% 1 
% a^2n
evens --> [].
evens --> evenAs.
evenAs --> evenAsTerm.
evenAs --> evenAsTerm,evenAs.
evenAsTerm --> [a],[a].

% 2
% a^n•b^2m•c^2m•d^n
