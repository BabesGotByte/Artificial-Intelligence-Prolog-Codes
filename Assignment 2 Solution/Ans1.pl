egde(a,b,10,5,3).
egde(b,a,10,5,3).
egde(a,c,5,6,3).
egde(c,a,5,6,3).
egde(b,f,7,4,6).
egde(f,b,7,4,6).
egde(c,d,9,2,4).
egde(d,c,9,2,4).
egde(d,e,8,3,6).
egde(e,d,8,3,6).
egde(e,f,9,1,6).
egde(f,e,9,1,6).
egde(a,e,10,9,8).
egde(e,a,10,9,8).

printK([]).
printK([H|L]):-
	printK(L), write(H).

append([], Y, Y).
append([H|X], Y, [H|Z]):- append(X, Y, Z).
   
route(A,A,L,Tlist,Cost,Fcurrent,Mil,Finitial):-
    printK(L),
    nl,
    write(Cost),
    nl,
    fail.
	
route(A,B,L,Tlist,Cost,Fcurrent,Mil,Finitial):-
    egde(A,X,Dist,Traffic,Rc),
    not(member(X,Tlist)),
    ReqFuel is Dist/Mil,
    Finitial >= ReqFuel,
    Fuel2 is Fcurrent - ReqFuel,
    (
        Fuel2 < 0 ->
        append([" REFUEL "],L,L1),
        Fcurrent1 is Finitial - ReqFuel,
        Cost2 is Cost+Dist+Traffic+Rc,
        route(X,B,[X|L1],[X|Tlist],Cost2,Fcurrent1,Mil,Finitial)
        ; 
        Cost2 is Cost+Dist+Traffic+Rc,
        route(X,B,[X|L],[X|Tlist],Cost2,Fuel2,Mil,Finitial)
    ).
