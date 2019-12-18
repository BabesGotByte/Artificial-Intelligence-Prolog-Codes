:-initialization(start).

start:- write('\nindex is from 1 to 3\n'),playHelp([0,0,0,0,0,0,0,0,0],1,1).

printb(X,I):-mod(I,3)=\=0,nth(I,X,Y),write(' '),write(Y),write(' |'),J is I+1,printb(X,J).
printb(X,I):-mod(I,3)=:=0,I=\=9,nth(I,X,Y),write(' '),write(Y),write('\n---+---+---\n'),J is I+1,printb(X,J).
printb(X,I):-I=:=9,nth(I,X,Y),write(' '),write(Y),write('\n\n'),!.

addInputUser(X,Y,NX):-write('Enter row:\n'),read_integer(I),write('Enter column:\n'),read_integer(J),convertlist(X,I,J,Y,NX).

convertlist([_,A12,A13,A21,A22,A23,A31,A32,A33],1,1,Y,NX):-NX=[Y,A12,A13,A21,A22,A23,A31,A32,A33].
convertlist([A11,_,A13,A21,A22,A23,A31,A32,A33],1,2,Y,NX):-NX=[A11,Y,A13,A21,A22,A23,A31,A32,A33].
convertlist([A11,A12,_,A21,A22,A23,A31,A32,A33],1,3,Y,NX):-NX=[A11,A12,Y,A21,A22,A23,A31,A32,A33].
convertlist([A11,A12,A13,_,A22,A23,A31,A32,A33],2,1,Y,NX):-NX=[A11,A12,A13,Y,A22,A23,A31,A32,A33].
convertlist([A11,A12,A13,A21,_,A23,A31,A32,A33],2,2,Y,NX):-NX=[A11,A12,A13,A21,Y,A23,A31,A32,A33].
convertlist([A11,A12,A13,A21,A22,_,A31,A32,A33],2,3,Y,NX):-NX=[A11,A12,A13,A21,A22,Y,A31,A32,A33].
convertlist([A11,A12,A13,A21,A22,A23,_,A32,A33],3,1,Y,NX):-NX=[A11,A12,A13,A21,A22,A23,Y,A32,A33].
convertlist([A11,A12,A13,A21,A22,A23,A31,_,A33],3,2,Y,NX):-NX=[A11,A12,A13,A21,A22,A23,A31,Y,A33].
convertlist([A11,A12,A13,A21,A22,A23,A31,A32,_],3,3,Y,NX):-NX=[A11,A12,A13,A21,A22,A23,A31,A32,Y].

changethelist([_,A2,A3,A4,A5,A6,A7,A8,A9],1,Y,NX):-NX=[Y,A2,A3,A4,A5,A6,A7,A8,A9].
changethelist([A1,_,A3,A4,A5,A6,A7,A8,A9],2,Y,NX):-NX=[A1,Y,A3,A4,A5,A6,A7,A8,A9].
changethelist([A1,A2,_,A4,A5,A6,A7,A8,A9],3,Y,NX):-NX=[A1,A2,Y,A4,A5,A6,A7,A8,A9].
changethelist([A1,A2,A3,_,A5,A6,A7,A8,A9],4,Y,NX):-NX=[A1,A2,A3,Y,A5,A6,A7,A8,A9].
changethelist([A1,A2,A3,A4,_,A6,A7,A8,A9],5,Y,NX):-NX=[A1,A2,A3,A4,Y,A6,A7,A8,A9].
changethelist([A1,A2,A3,A4,A5,_,A7,A8,A9],6,Y,NX):-NX=[A1,A2,A3,A4,A5,Y,A7,A8,A9].
changethelist([A1,A2,A3,A4,A5,A6,_,A8,A9],7,Y,NX):-NX=[A1,A2,A3,A4,A5,A6,Y,A8,A9].
changethelist([A1,A2,A3,A4,A5,A6,A7,_,A9],8,Y,NX):-NX=[A1,A2,A3,A4,A5,A6,A7,Y,A9].
changethelist([A1,A2,A3,A4,A5,A6,A7,A8,_],9,Y,NX):-NX=[A1,A2,A3,A4,A5,A6,A7,A8,Y].

playHelp(X,1,MoveNumber):-MoveNumber<10,\+iswin(X,2),printb(X,1),addInputUser(X,1,NX),NextMove is MoveNumber+1,playHelp(NX,2,NextMove).

playHelp(X,1,MoveNumber):-MoveNumber<10,iswin(X,2),printb(X,1),giveResult(2),!.

playHelp(X,2,MoveNumber):-MoveNumber>2,MoveNumber<10,\+iswin(X,1),printb(X,1),computerPlay(X,NX),NextMove is MoveNumber+1,playHelp(NX,1,NextMove).

playHelp(X,2,MoveNumber):-MoveNumber>2,MoveNumber<10,iswin(X,1),printb(X,1),giveResult(1),!.
playHelp(X,2,MoveNumber):-MoveNumber=:=2,nth(5,X,Value),Value=:=0,changethelist(X,5,2,NX),printb(X,1),NextMove is MoveNumber+1,playHelp(NX,1,NextMove).

playHelp(X,2,MoveNumber):-MoveNumber=:=2,nth(1,X,Value),Value=:=0,changethelist(X,1,2,NX),printb(X,1),NextMove is MoveNumber+1,playHelp(NX,1,NextMove).

playHelp(X,_,10):-iswin(X,1),giveResult(1),!.

playHelp(X,_,10):- \+iswin(X,1),giveResult(0),!.

iswin([A11,A12,A13,_,_,_,_,_,_],I):-A11=I,A11=A12,A12=A13.
iswin([_,_,_,A21,A22,A23,_,_,_],I):-A21=I,A21=A22,A22=A23.
iswin([_,_,_,_,_,_,A31,A32,A33],I):-A31=I,A31=A32,A32=A33.
iswin([A11,_,_,A21,_,_,A31,_,_],I):-A11=I,A11=A21,A21=A31.
iswin([_,A12,_,_,A22,_,_,A32,_],I):-A12=I,A12=A22,A22=A32.
iswin([_,_,A13,_,_,A23,_,_,A33],I):-A13=I,A13=A23,A23=A33.
iswin([A11,_,_,_,A22,_,_,_,A33],I):-A11=I,A11=A22,A22=A33.
iswin([_,_,A13,_,A22,_,A31,_,_],I):-A31=I,A31=A22,A22=A13.

giveResult(0):-write('Draw!\n').
giveResult(1):-write('You win!\n').
giveResult(2):-write('I win!\n').

computerPlay(X,NX):-findBestMove(X,NewPos),changethelist(X,NewPos,2,NX).

isMovesLeft(X):- \+isMovesLeftHelper(X,1).

isMovesLeftHelper(X,I):-I<10,nth(I,X,Value),Value=\=0,NextI is I+1,isMovesLeftHelper(X,NextI).

isMovesLeftHelper(_,I):-I=:=10.

% If player 2 has won, then the score is 10
evaluate(X,Score):-iswin(X,2),Score is 10.
% If player 1 has won, then the score is -10
evaluate(X,Score):-iswin(X,1),Score is (-10).
% If no one has one, then the score is 0
evaluate(X,Score):- \+iswin(X,1),\+iswin(X,2),Score is 0.

minimax(X,Depth,_,Result):-evaluate(X,Score),Score=:=10,Result=Score-Depth,!.

minimax(X,Depth,_,Result):-evaluate(X,Score),Score=:=(-10),Result=Score+Depth,!.

minimax(X,_,_,Result):- \+isMovesLeft(X),Result=0,!.

minimax(X,Depth,IsMax,Result):-isMovesLeft(X),IsMax = 1,Best is (-1000),
NewDepth is Depth+1,
(
((nth(1,X,Value1),Value1=:=0,changethelist(X,1,2,NX1),minimax(NX1,NewDepth,0,Result1));Result1 is Best),
((nth(2,X,Value2),Value2=:=0,changethelist(X,2,2,NX2),minimax(NX2,NewDepth,0,Result2));Result2 is Best),
((nth(3,X,Value3),Value3=:=0,changethelist(X,3,2,NX3),minimax(NX3,NewDepth,0,Result3));Result3 is Best),
((nth(4,X,Value4),Value4=:=0,changethelist(X,4,2,NX4),minimax(NX4,NewDepth,0,Result4));Result4 is Best),
((nth(5,X,Value5),Value5=:=0,changethelist(X,5,2,NX5),minimax(NX5,NewDepth,0,Result5));Result5 is Best),
((nth(6,X,Value6),Value6=:=0,changethelist(X,6,2,NX6),minimax(NX6,NewDepth,0,Result6));Result6 is Best),
((nth(7,X,Value7),Value7=:=0,changethelist(X,7,2,NX7),minimax(NX7,NewDepth,0,Result7));Result7 is Best),
((nth(8,X,Value8),Value8=:=0,changethelist(X,8,2,NX8),minimax(NX8,NewDepth,0,Result8));Result8 is Best),
((nth(9,X,Value9),Value9=:=0,changethelist(X,9,2,NX9),minimax(NX9,NewDepth,0,Result9));Result9 is (-1000))),
FindMaxFrom = [Result1,Result2,Result3,Result4,Result5,Result6,Result7,Result8,Result9],
max_list(FindMaxFrom,Result).

minimax(X,Depth,IsMax,Result):-isMovesLeft(X),IsMax = 0,Best is 1000,
NewDepth is Depth+1,
(
((nth(1,X,Value1),Value1=:=0,changethelist(X,1,1,NX1),minimax(NX1,NewDepth,1,Result1));Result1 is Best),
((nth(2,X,Value2),Value2=:=0,changethelist(X,2,1,NX2),minimax(NX2,NewDepth,1,Result2));Result2 is Best),
((nth(3,X,Value3),Value3=:=0,changethelist(X,3,1,NX3),minimax(NX3,NewDepth,1,Result3));Result3 is Best),
((nth(4,X,Value4),Value4=:=0,changethelist(X,4,1,NX4),minimax(NX4,NewDepth,1,Result4));Result4 is Best),
((nth(5,X,Value5),Value5=:=0,changethelist(X,5,1,NX5),minimax(NX5,NewDepth,1,Result5));Result5 is Best),
((nth(6,X,Value6),Value6=:=0,changethelist(X,6,1,NX6),minimax(NX6,NewDepth,1,Result6));Result6 is Best),
((nth(7,X,Value7),Value7=:=0,changethelist(X,7,1,NX7),minimax(NX7,NewDepth,1,Result7));Result7 is Best),
((nth(8,X,Value8),Value8=:=0,changethelist(X,8,1,NX8),minimax(NX8,NewDepth,1,Result8));Result8 is Best),
((nth(9,X,Value9),Value9=:=0,changethelist(X,9,1,NX9),minimax(NX9,NewDepth,1,Result9));Result9 is Best)),
FindMinFrom = [Result1,Result2,Result3,Result4,Result5,Result6,Result7,Result8,Result9],
min_list(FindMinFrom,Result).

findBestMove(X,NewPos):-Best is (-1000),
(
((nth(1,X,Value1),Value1=:=0,changethelist(X,1,2,NX1),minimax(NX1,0,0,Result1));Result1 is Best),
((nth(2,X,Value2),Value2=:=0,changethelist(X,2,2,NX2),minimax(NX2,0,0,Result2));Result2 is Best),
((nth(3,X,Value3),Value3=:=0,changethelist(X,3,2,NX3),minimax(NX3,0,0,Result3));Result3 is Best),
((nth(4,X,Value4),Value4=:=0,changethelist(X,4,2,NX4),minimax(NX4,0,0,Result4));Result4 is Best),
((nth(5,X,Value5),Value5=:=0,changethelist(X,5,2,NX5),minimax(NX5,0,0,Result5));Result5 is Best),
((nth(6,X,Value6),Value6=:=0,changethelist(X,6,2,NX6),minimax(NX6,0,0,Result6));Result6 is Best),
((nth(7,X,Value7),Value7=:=0,changethelist(X,7,2,NX7),minimax(NX7,0,0,Result7));Result7 is Best),
((nth(8,X,Value8),Value8=:=0,changethelist(X,8,2,NX8),minimax(NX8,0,0,Result8));Result8 is Best),
((nth(9,X,Value9),Value9=:=0,changethelist(X,9,2,NX9),minimax(NX9,0,0,Result9));Result9 is Best)),
FindMinFrom = [Result1,Result2,Result3,Result4,Result5,Result6,Result7,Result8,Result9],
max_list(FindMinFrom,Value),
nth(NewPos,FindMinFrom,Value).
