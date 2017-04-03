%stergere(_, [], []).
stergere(E, [E|L], L).
stergere(E, [A|L], [A|LRez]) :- A\==E, stergere(E, L, LRez).

concat([], L2, L2).
concat([E|L1], L2, [E|L]) :- concat(L1, L2, L).

reverse([], []).
reverse([E|L], LRez) :- reverse(L, LRez1), concat(LRez1, [E], LRez).

permutare([], []).
permutare([E|L], R) :- permutare(L, R1), stergere(E, R, R1).

lista_permutari(L, R) :- bagof(P, permutare(L, P), R).

elem_min([E], E).
elem_min([F|L], E) :- elem_min(L, E1), E is min(F, E1).

elem_poz(1, [E|_], E).
elem_poz(Poz, [_|L], E) :- Poz > 1, Poz1 is Poz - 1, elem_poz(Poz1, L, E).

inserare_poz(E, 1, L, [E|L]).
inserare_poz(E, Poz, [F|L], [F|LRez]) :- Poz > 1, Poz1 is Poz - 1, inserare_poz(E, Poz1, L, LRez).

interclasare([], L2, L2).
interclasare(L1, [], L1).
interclasare([E1|L1], [E2|L2], [E1|LRez]) :- E1 < E2, interclasare(L1, [E2|L2], LRez).
interclasare([E1|L1], [E2|L2], [E2|LRez]) :- E1 >= E2, interclasare([E1|L1], L2, LRez).

divide([], _, [], []).
divide([E|L], P, [E|L1], L2) :- E =< P, divide(L, P, L1, L2).
divide([E|L], P, L1, [E|L2]) :- E > P, divide(L, P, L1, L2).

quicksort([], []).
quicksort([P|L], LRez) :- divide(L, P, L1, L2), quicksort(L1, LRez1), quicksort(L2, LRez2), concat(LRez1, [P|LRez2], LRez).

ins_lista_sortata(E, [], [E]).
ins_lista_sortata(E, [F|L], [E, F|L]) :- E =< F.
ins_lista_sortata(E, [F|L], [F|LRez]) :- E > F, ins_lista_sortata(E, L, LRez).

sortare_insertie([], []).
sortare_insertie([E|L], LRez) :- sortare_insertie(L, LRez1), ins_lista_sortata(E, LRez1, LRez).

swap([E, F|L], [F, E|L]) :- E > F.
swap([E, F|L], [E|LRez]) :- E =< F, swap([F|L], LRez).
bubble_sort(L, R) :- swap(L, L1), !, bubble_sort(L1, R).
bubble_sort(L, L).

sortare_selectie_min([], []). 
sortare_selectie_min(L, [E|LRez]) :- elem_min(L, E), stergere(E, L, L1), sortare_selectie_min(L1, LRez).