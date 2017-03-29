
meloman(stefan).
vanator(petre).
actrita(sotiapetre).

soti(stefan,sotiastef).
soti(petre,sotiapetre).
vecini(X,Y):-vecini(Z,Y),soti(X,Z).
vecini(stefan,petre).
sentimental(X):-meloman(X).
mincinos(X):-vanator(X).
iubeste(X,Y):-actrita(X),sentimental(Y).


%gcd(+X,+Y,-D)
gcd(X,0,X).
gcd(X,Y,D):-Y\=0, R is mod(X,Y), gcd(Y,R,D).

divizibil(X,Y):-integer(X),integer(Y), R is mod(X,Y), R=0.

prim(X) :- X>1,prim(X,2).
prim(X,Y) :- Y*Y=<X, \+ divizibil(X,Y), Z is Y+1, prim(X,Z).
prim(X,Y) :- Y*Y>X.


hanoi(N):- hanoi(N,stanga,mijloc,dreapta).
hanoi(1,Src,_,Dest):-
 write("Muta disc de la "), write(Src),write(" la "),write(Dest),nl.
hanoi(N,Src,Temp,Dest):-N1 is N-1,
 hanoi(N1,Src,Dest,Temp),
 hanoi(1,Src,Temp,Dest),
 hanoi(N1,Temp,Src,Dest).

minte(leu,luni).
minte(leu,marti).
minte(leu,miercuri).
minte(unicorn,joi).
minte(unicorn,vineri).
minte(unicorn,sambata).
urmeaza(luni,marti).
urmeaza(marti,miercuri).
urmeaza(miercuri,joi).
urmeaza(joi,vineri).
urmeaza(vineri,sambata).
urmeaza(sambata,duminica).
urmeaza(duminica,luni).
posibil(Animal,Azi):- urmeaza(Ieri,Azi), minte(Animal,Azi), \+ minte(Animal,Ieri).
posibil(Animal,Azi):- urmeaza(Ieri,Azi), minte(Animal,Ieri), \+ minte(Animal,Azi).

azi(X):- posibil(leu,X), posibil(unicorn,X).
