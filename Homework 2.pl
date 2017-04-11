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

