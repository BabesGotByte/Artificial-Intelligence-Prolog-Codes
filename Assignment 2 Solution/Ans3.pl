s(S0,S) :- np(S0,S1), vp(S1,S).


vp(S0,S) :- v(S0,S1), np(S1,S).

vp(S0,S) :- v(S0,S1), n(S1,S).


np(S0,S) :- n(S0,S1), iv(S1,S).

np(S0,S) :- n(S0,S1), iv(S1,S2), np(S2,S).

np(S0,S) :- n(S0,S1), iv(S1,S2), vp(S2,S).

np(S0,S) :- iv(S0,S1), n(S1,S).

np(S0,S) :- iv(S0,S1), n(S1,S2), np(S2,S).

np(S0,S) :- iv(S0,S1), n(S1,S2), vp(S2,S).

np(S0,S) :- iv(S0,S1), np(S1,S).

np(S0,S) :- iv(S0,S1), vp(S1,S).

np(S0,S) :- n(S0,S).


n(S0,S) :- S0=['Fred'|S].

n(S0,S) :- S0=['John'|S].

n(S0,S) :- S0=['Mary'|S].


v(S0,S) :- S0=[see|S].

v(S0,S) :- S0=[saw|S].

v(S0,S) :- S0=[seen|S].

v(S0,S) :- S0=[told|S].

v(S0,S) :- S0=[believed|S].


iv(S0,S) :-S0=[was|S].

iv(S0,S) :-S0=[have|S].

iv(S0,S) :-S0=[been|S].

iv(S0,S) :-S0=[to|S].

iv(S0,S) :-S0=[by|S].
