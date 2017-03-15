femeie(ioana).
femeie(dana).
femeie(maria).
barbat(ion).
barbat(dan).
barbat(marius).
parinte(ioana,dan).
parinte(ion,dan).
parinte(dan,maria).
parinte(dan,marius).
parinte(dana,maria).
parinte(dana,marius).
tata(X,Y):-barbat(X),parinte(X,Y).
mama(X,Y):-femeie(X),parinte(X,Y).
fiica(X,Y):-femeie(Y),parinte(X,Y).
fiu(X,Y):-barbat(Y),parinte(X,Y).
bunic(X,Y):-barbat(X),parinte(X,Z),parinte(Z,Y).
bunica(X,Y):-femeie(X),parinte(X,Z),parinte(Z,Y).
nepot(X,Y):-bunic(X,Y),fiu(_,Y).
nepot(X,Y):-bunica(X,Y),fiu(_,Y).
nepoata(X,Y):-bunic(X,Y),fiica(_,Y).
nepoata(X,Y):-bunica(X,Y),fiica(_,Y).

figura(triunghi,albastru,3).
figura(patrat,rosu,4).
figura(romb,albastru,4).
figura(paralelogram,verde,4).
figura(pentagon,rosu,5).
patrulater(X):-figura(X,_,Y),Y=4.
cp4(X):-figura(X,_,Y),Y>=4.

copil(peter, 9).
copil(paul, 10).
copil(chris, 9).
copil(susan, 9).
pereche(X,Y):-copil(X,Z),copil(Y,Z),X@>Y.


barbat(gelu).
barbat(bogdan).
barbat(toma).
fumator(toma).
fumator(dan).
vegetarian(gelu).
partener(X):-barbat(X),not(fumator(X)).
partener(X):-barbat(X),vegetarian(X).


nu_citeste(X):-nu_literat(X).
nu_literat(X):-delfin(X).
inteligent(gicu).
delfin(gicu).
