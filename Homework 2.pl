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

5)

invers([],[]). 
invers([H|T],R):-  naiverev(T,RevT),  append(RevT,[H],R).

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
