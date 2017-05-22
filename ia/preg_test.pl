Bagof, Setof si Findall: https://en.wikibooks.org/wiki/Prolog/Bagof,_Setof_and_Findall

% 1) Scrieti un predicat prima_problema(L,R) care primeste L o lista de numere naturale nenule si calculeaza R o lista ce contine toate elementele E din L care au cel putin 2 divizori distincti proprii (diferiti de 1 si E) printre elementele lui L.

verif(_, [], 0).
verif(E, [E|L], N) :- verif(E, L, N), !.
verif(E, [F|L], N) :- E mod F =:= 0, F =\= 1, verif(E, L, N1), N is N1 + 1, !.
verif(E, [_|L], N) :- verif(E, L, N).

membru(E, [E | _]).
membru(E, [_ | L]) :- membru(E, L).

prima_problema(L, R) :- findall(E, (membru(E, L), verif(E, L, N), N >= 2), R).

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

scrie([]) :- nl.
scrie([[Age, Name] | Result]) :- write(Name), write(" "), write(Age), write(" "), scrie(Result).

rezolva2([]).
rezolva2([Familie | Lista]) :- setof([Age, Name], om(Familie, Name, Age), Result), write(Familie),
                   write(": "), scrie(Result), rezolva2(Lista).

%Name ^ Age ^ .. = Nu afisa aceeasi Familie pentru Name si Age diferite.
rezolva() :- setof(Familie, Name ^ Age ^ om(Familie, Name, Age), Lista), rezolva2(Lista).

mc :- tell('C:\\RailsInstaller\\familii.txt'), rezolva, told.

%findall vs bagof vs setof

membru(E, [E | _]).
membru(E, [_ | L]) :- membru(E, L).

%toate numerele care au divizori proprii
test1(L) :- findall(E, (membru(E, L), membru(Y, L), Y < E, Y =\= 1, mod(E, Y) =:= 0), R), write(R), write(" findall"), nl.

%pentru fiecare divizor afisez toate numerele care il au ca divizor propriu
%Y ^ .. => nu mai afisez in functie de Y (echivalent cu findall)
test2(L) :- bagof(E, Y ^ (membru(E, L), membru(Y, L), Y < E, Y =\= 1, mod(E, Y) =:= 0), R), write(R), write(" bagof"), nl.

%%pentru fiecare divizor afisez toate numerele care il au ca divizor propriu + elimin duplicatele + ordonez
%%Y ^ .. => nu mai afisez in functie de Y (echivalent cu findall/bagof + eliminare duplicate)
test3(L) :- setof(E, Y ^ (membru(E, L), membru(Y, L), Y < E, Y =\= 1, mod(E, Y) =:= 0), R), write(R), write(" setof"), nl.
