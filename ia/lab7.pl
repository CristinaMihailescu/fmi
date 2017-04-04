graf([1-2, 1-3, 2-7, 3-4, 3-5, 4-8, 5-8, 6-7, 6-9, 7-8, 8-9]).

adiacent(A, B, [A - B | _]).
adiacent(B, A, [A - B | _]).
adiacent(A, B, [_ - _ | Graf]) :- adiacent(A, B, Graf).

membru(E,[E|_]).
membru(E,[_|L]):- membru(E,L).

lista_noduri([], []).
lista_noduri([A - B | Graf], L) :- lista_noduri(Graf, L1), (membru(A, L1) -> L2 = L1; L2 = [A | L1]), (membru(B, L2) -> L = L2; L = [B | L2]).

grad_nod([], _, 0).
grad_nod([Nod - _ | Graf], Nod, Grad) :-  grad_nod(Graf, Nod, Grad1), Grad is Grad1 + 1, !.
grad_nod([_ - Nod | Graf], Nod, Grad) :-  grad_nod(Graf, Nod, Grad1), Grad is Grad1 + 1, !.
grad_nod([_ - _ | Graf], Nod, Grad) :-  grad_nod(Graf, Nod, Grad).

drum(A, B, Graf, Drum) :- drum1(A, [B], Graf, Drum).
drum1(A, [E | BL], Graf, Drum) :- adiacent(A, E, Graf) -> Drum = [A, E| BL]; 
													      (adiacent(E, X, Graf), (\+membru(X, BL) -> drum1(A, [X, E | BL], Graf, Drum))).

neconex(Graf) :- lista_noduri(Graf, L), membru(X, L), membru(Y, L), \+drum(X, Y, Graf, _).				  
conex(Graf) :- \+neconex(Graf).

aciclic(Graf) :- \+ciclic(Graf).
ciclic(Graf) :- membru(X - Y, Graf), drum(X, Y, Graf, Drum), length(Drum, L), L > 2.