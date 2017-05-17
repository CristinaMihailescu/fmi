% 2) Scrieti un predicat a_doua_problema(A) care primeste A un arbore binar oarecare cu elemente numere naturale si afiseaza pe ecran, fiecare pe cate o linie, perechile de noduri "frati" care au aceeasi paritate.
% A = arb(arb(arb(arb(nil, 8, nil), 3, arb(nil, 10, nil)), 2, arb(nil, 4, arb(nil, 9, nil))), 7, arb(arb(nil, 1, nil), 6, arb(arb(nil, 13, nil), 5, arb(nil, 11, nil))))

par(0).
par(A) :- A1 is A - 1, \+par(A1).

impar(A) :- \+par(A).

a_doua_problema(arb(nil, _, nil)).
a_doua_problema(arb(arb(S1, S, S2), _, nil)) :- a_doua_problema(arb(S1, S, S2)), !.
a_doua_problema(arb(nil, _, arb(D1, D, D2))) :- a_doua_problema(arb(D1, D, D2)), !.
a_doua_problema(arb(arb(S1, S, S2), _, arb(D1, D, D2))) :- ((par(S), par(D)); (impar(S), impar(D))), write(S), write(" "), write(D), nl, a_doua_problema(arb(S1, S, S2)), a_doua_problema(arb(D1, D, D2)), !.
a_doua_problema(arb(arb(S1, S, S2), _, arb(D1, D, D2))) :- a_doua_problema(arb(S1, S, S2)), a_doua_problema(arb(D1, D, D2)), !.
