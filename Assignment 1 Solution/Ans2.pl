toh(1,X,Y,_):-
	write("move top disk from "),
	write(X),
	write(" to "),
	write(Y),
	nl.
toh(N,X,Y,Z):-
	M is N-1,
	toh(M,X,Z,Y),
	toh(1,X,Y,_),
	toh(M,Z,Y,X).
	
