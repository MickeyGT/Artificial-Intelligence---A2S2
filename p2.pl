figura(triunghi,albastru,3).
figura(patrat,rosu,4).
figura(romb,albastru,4).
figura(paralelogram,verde,4).
figura(pentagon,rosu,5).
patrulater(X):-figura(X,_,Y),Y=4.
cp4(X):-figura(X,_,Y),Y>=4.
