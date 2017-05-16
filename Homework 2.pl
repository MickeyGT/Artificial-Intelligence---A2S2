2)

sublist(X,Y):-append(X,_,Y).
sublist(X,Y):-append(_,X,Y).
sublist(X,Y):-append(X,_,Z),append(_,Z,Y).

/** <examples>
?-sublist([b, c, e], [a, b, c, d, e, f]).
?-sublist([c, d, e], [a, b, c, d, e, f]).
?-sublist([c, d, e], [c, d, e, f]).
?-sublist([c, d, e], [a,b,c, d,f,g]).
*/

3)

liniarizare([],[]).

liniarizare([First|Rest],Rez):-
	flatten(First,NewList1),
	flatten(Rest,NewList2),
	append(NewList1,NewList2,Rez).
liniarizare(List,[List]).

/** <examples>
?- liniarizare([1, 2, [3, 4], [5, [6, 7], [[8], 9]]], L) .
?- liniarizare([[1, [2], [[[3, 4]]]], [[5, [6, 7], [[8], 9]]]], L) .
*/

5)

% Varianta Recursiva
flip(List, Invers):-
    move(List, Invers).
move([First|Rest], Invers):-
    rotate(Rest, [First], Invers).
rotate([First|Rest], Temp, Invers):-
    rotate(Rest, [First|Temp], Invers).
rotate([], Temp, Temp):-!.

% Varianta Recursiva Begin

flip(List, Invers):- move(List,Invers).
move([First|Rest],Invers):- move(Rest,RestInvers), append(RestInvers,[First],Invers).
move([],[]):-!.

/** <examples>
?- flip([1,2,3,4,5,6,7,8,9], X).
?- flip([1,2,3,4], X).
?- flip([5,4,3,2,1], X).
*/

6)

palindrom([_]).
palindrom(X) :-
    append([FirstChar|Cont], [FirstChar], X),
    palindrom(Cont).


/** <examples>
?- palindrom([2,3]).
?- palindrom([1,2,3]).
?- palindrom([1,2,1]).
?- palindrom([1,2,3,2,1]).
*/

8)

stanga(st).
dreapta(dr).
rotirest([E|T], R) :-append(T,[E],R).
rotiredr(L, R) :-rotirest(R, L).
rotire(Lista,_,0,Lista).
rotire(Lista,Directie,Nr,ListaRez):-
    stanga(Directie),
	rotirest(Lista,L),Nr1 is Nr-1,rotire(L,st,Nr1,ListaRez).
rotire(Lista,Directie,Nr,ListaRez):-
    dreapta(Directie),
	rotiredr(Lista,L),Nr1 is Nr-1,rotire(L,dr,Nr1,ListaRez).

/** <examples>
?- rotire([a,b,c,d,e],st,1,X).
?- rotire([a,b,c,d,e],dr,1,X).
?- rotire([a,b,c,d,e],st,2,X).
?- rotire([a,b,c,d,e],dr,2,X).
*/
