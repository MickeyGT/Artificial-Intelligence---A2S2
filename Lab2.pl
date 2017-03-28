
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
