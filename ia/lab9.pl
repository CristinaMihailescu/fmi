```
rezolva_b(NodInitial,Solutie) :- breadthfirst([[NodInitial]],Solutie).

breadthfirst([[Nod|Drum]|_],[Nod|Drum]):-scop(Nod).
breadthfirst([Drum|Drumuri],Solutie) :- extinde(Drum,DrumNoi), concat(Drumuri,DrumNoi,Drumuri1), breadthfirst(Drumuri1,Solutie).

extinde([Nod|Drum],DrumNoi) :- bagof([NodNou,Nod|Drum], (s(Nod,NodNou), \+ (membru(NodNou, [Nod|Drum]))), DrumNoi), !.
extinde(_,[]).

membru(A, [A|_]) .
membru(A, [_|T]) :- membru(A,T).

concat([],X,X).
concat([A|B],C,[A|D]) :- concat(B,C,D).

scop(st(X, Y)) :- 18 =:= 3*X + 4*Y, X - 2*Y =:= -4 .
s(st(X,Y), st(X1,Y1)) :- (X1 is X + 1, Y1 is Y);
						 (X1 is X - 1, Y1 is Y);
						 (Y1 is Y + 1, X1 is X);
						 (Y1 is Y - 1, X1 is X).
						 
sistem(X,Y) :- rezolva_b(st(0,0),[st(X,Y)|_]).
sistem1(X,Y,L) :- rezolva_b(st(0,0),L), L=[st(X,Y)|_].
```
