```
% Cautare de tip breadth-first
rezolva_b(NodInitial,Solutie) :- breadthfirst([[NodInitial]],Solutie).

breadthfirst([[Nod|Drum]|_],[Nod|Drum]):-scop(Nod).
breadthfirst([Drum|Drumuri],Solutie) :- extinde(Drum,DrumNoi), concat(Drumuri,DrumNoi,Drumuri1), breadthfirst(Drumuri1,Solutie).

extinde([Nod|Drum],DrumNoi) :- bagof([NodNou,Nod|Drum], (s(Nod,NodNou), \+ (membru(NodNou,[Nod|Drum]))), DrumNoi), !.
extinde(_,[]).

membru(A, [A|_]) .
membru(A, [_|T]) :- membru(A,T).

concat([],X,X).
concat([A|B],C,[A|D]) :- concat(B,C,D).

initial(stare(est,3,3,0,0,2)).
scop(stare(vest,3,3,0,0,2)).
s(stare(B,NMB,NCB,NMis,NCan,M), stare(B1,NMB1,NCB1,NMis1,NCan1,M)) :- M1 is min(NMB, M), M2 is min(NCB, M), for(0, M1, K1), for(0, M2, K2), (K1 >= K2; K1 =:= 0), K1 + K2 =< M, K1 + K2 > 0, NMis1 is NMB - K1, NCan1 is NCB - K2, (NMis1 >= NCan1; NMis1 =:= 0), NMB1 is NMis + K1, NCB1 is NCan + K2, (NMB1 >= NCB1; NMB1 =:= 0), opus(B, B1).
    
opus(est,vest).
opus(vest,est).
for(A,B,A) :- A=<B.
for(A,B,X) :- A1 is A+1, A1=<B, for(A1,B,X).
afisare([]).
afisare([H|T]) :- afisare(T),nl,afis(H).

afis(stare(B,NMB,NCB,NMis,NCan,_)) :- 
   write('Barca se afla pe malul de '),write(B),nl,
   write('Pe acest mal sunt '),write(NMB),write(' misionari si '),write(NCB),write(' canibali'), nl,
   write('Pe malul opus se afla '),write(NMis), write(' misionari si '),write(NCan),write(' canibali'),nl.
mc :- tell('C:\\Documents and Settings\\student\\Desktop\\out.txt'),initial(S),
      rezolva_b(S,Sol),afisare(Sol),told.
```
