%  ion      ioana       marian     maria
%   |         |            |        |
%   -----------            ----------
%      |                        |
%    ionel                   mariana    
%      |                        |       
%      --------------------------       
%           |        |        |               
%  dana gheorghe georgeta georgiana      cristian  
%    |     |                  |            |               
%    -------                  --------------               
%       |                        |      |                    
%     roxana                    paul  paula              


barbat(ion).
barbat(marian).
barbat(ionel).
barbat(cristian).
barbat(gheorghe).
barbat(paul).

femeie(ioana).
femeie(maria).
femeie(mariana).
femeie(dana).
femeie(roxana).
femeie(paula).
femeie(georgeta).
femeie(georgiana).

parinte(ion, ionel).
parinte(ioana, ionel).
parinte(marian, mariana).
parinte(maria, mariana).
parinte(ionel, georgiana).
parinte(ionel, gheorghe).
parinte(ionel, georgeta).
parinte(mariana, georgiana).
parinte(mariana, gheorghe).
parinte(mariana, georgeta).
parinte(gheorghe, roxana).
parinte(dana, roxana).
parinte(georgiana, paul).
parinte(georgiana, paula).
parinte(cristian, paul).
parinte(cristian, paula).

casatorit(ion, ioana).
casatorit(ioana, ion).
casatorit(marian, maria).
casatorit(maria, marian).
casatorit(ionel, mariana).
casatorit(mariana, ionel).
casatorit(georgiana, cristian).
casatorit(cristian,georgiana).
casatorit(gheorghe, dana).
casatorit(dana, gheorghe).

sotie(X,Y):-femeie(X),casatorit(X,Y).
frate(X,Y):-barbat(X), parinte(Z,X),parinte(Z,Y),X\=Y.
sora(X,Y):-femeie(X), parinte(Z,X),parinte(Z,Y),X\=Y.
bunica_materna(X,Y):-femeie(X),parinte(X,Z),parinte(Z,Y).
bunic_matern(X,Y):-barbat(X),parinte(X,Z),parinte(Z,Y).
unchi(X,Y):-barbat(X),parinte(Z,Y),frate(X,Z).
vara_primara(X,Y):-femeie(X),parinte(Z,X),parinte(F,Y),frate(Z,F).
vara_primara(X,Y):-femeie(X),parinte(Z,X),parinte(F,Y),sora(Z,F).
socru(X,Y):-barbat(X),casatorit(Y,Z),femeie(Y),parinte(X,Z).
cuscra(X,Y):-femeie(X),parinte(X,Z),casatorit(Z,F),parinte(Y,F).
cumnat(X,Y):-barbat(X),frate(X,Z),casatorit(Z,Y).
nora(X,Y):-femeie(X),parinte(X,Z),femeie(Z),casatorit(Z,Y).
stranepot(X,Y):-bunica_materna(Y,Z),parinte(Z,X).
stranepot(X,Y):-bunic_matern(Y,Z),parinte(Z,X).



    


