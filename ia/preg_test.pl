% 1) Scrieti un predicat prima_problema(L,R) care primeste L o lista de numere naturale nenule si calculeaza R o lista ce contine toate elementele E din L care au cel putin 2 divizori distincti proprii (diferiti de 1 si E) printre elementele lui L.

verif(_, [], 0).
verif(E, [E|L], N) :- verif(E, L, N), !.
verif(E, [F|L], N) :- E mod F =:= 0, F =\= 1, verif(E, L, N1), N is N1 + 1, !.
verif(E, [_|L], N) :- verif(E, L, N).

rezolva(_, [], []).
rezolva(I, [E|L], [E|R]) :- verif(E, I, N), N >= 2, rezolva(I, L, R), !.
rezolva(I, [_|L], R) :- rezolva(I, L, R).

prima_problema(L, R) :- rezolva(L, L, R).

% 2) Scrieti un predicat a_doua_problema(A) care primeste A un arbore binar oarecare cu elemente numere naturale si afiseaza pe ecran, fiecare pe cate o linie, perechile de noduri "frati" care au aceeasi paritate.
% A = arb(arb(arb(arb(nil, 8, nil), 3, arb(nil, 10, nil)), 2, arb(nil, 4, arb(nil, 9, nil))), 7, arb(arb(nil, 1, nil), 6, arb(arb(nil, 13, nil), 5, arb(nil, 11, nil))))

a_doua_problema(arb(nil, _, nil)).
a_doua_problema(arb(S, _, nil)) :- a_doua_problema(S), !.
a_doua_problema(arb(nil, _, D)) :- a_doua_problema(D), !.
a_doua_problema(arb(arb(S1, S, S2), _, arb(D1, D, D2))) :- S mod 2 =:= D mod 2, write(S), write(" "), write(D), nl, a_doua_problema(arb(S1, S, S2)), a_doua_problema(arb(D1, D, D2)), !.
a_doua_problema(arb(S, _, D)) :- a_doua_problema(S), a_doua_problema(D), !.

% 3) Se da urmatorul predicat:
% om(popescu, ana, 20).
% om(georgescu, alex, 53).
% om(ionescu, george, 14).
% om(popescu, denisa, 6).
% om(ionescu, liliana, 78).
% om(georgescu, oana, 35).
% om(georgescu, vlad, 14).
% om(ionescu, anca, 2).
% om(popescu, ioana, 40).
% om(ionescu, dan, 16).

% Scrieti un predicat a_treia_problema care sa afiseze in fisierul "familii.txt", pe cate o linie,
% numele de familie apoi prenumele si varsta pentru toti membrii acelei familii, ordonati crescator dupa varste.

% popescu: denisa 6, ana 20, ioana 40
% georgescu: vlad 14, oana 35, alex 53
% ionescu: anca 2, george 14, dan 16, liliana 78

om(popescu, ana, 20).
om(georgescu, alex, 53).
om(ionescu, george, 14).
om(popescu, denisa, 6).
om(ionescu, liliana, 78).
om(georgescu, oana, 35).
om(georgescu, vlad, 14).
om(ionescu, anca, 2).
om(popescu, ioana, 40).
om(ionescu, dan, 16).

scrie(ionescu) :- om(Fam, N1, V1), om(Fam, N2, V2), om(Fam, N3, V3), om(Fam, N4, V4),
    		  N1 \= N2, N1 \= N3, N2 \= N3, N1 \= N4, N2 \= N4, N3 \= N4,
    		  V1 =< V2, V2 =< V3, V3 =< V4,
    		  write(Fam), write(": "), write(N1), write(" "), write(V1), write(" "), write(N2), write(" "), write(V2), write(" "), write(N3), write(" "), write(V3), write(" "), write(N4), write(" "), write(V4),  nl, !.

scrie(Fam) :- om(Fam, N1, V1), om(Fam, N2, V2), om(Fam, N3, V3), N1 \= N2, N1 \= N3, N2 \= N3, V1 =< V2, V2 =< V3, write(Fam), write(": "), write(N1), write(" "), write(V1), write(" "), write(N2), write(" "), write(V2), write(" "), write(N3), write(" "), write(V3), nl, !.

mc :- tell('C:\\RailsInstaller\\familii.txt'), scrie(popescu), scrie(georgescu), scrie(ionescu), told.
