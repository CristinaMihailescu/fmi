ins_arb_cautare(E, nil, arb(nil, E, nil)).
ins_arb_cautare(E, arb(S, E, D), arb(S, E, D)).
ins_arb_cautare(E, arb(S, R, D), arb(S1, R, D)) :- E < R, ins_arb_cautare(E, S, S1).
ins_arb_cautare(E, arb(S, R, D), arb(S, R, D1)) :- E > R, ins_arb_cautare(E, D, D1).

creare_arb_cautare([], nil).
creare_arb_cautare([E|L], T) :- creare_arb_cautare(L, T1), ins_arb_cautare(E, T1, T).

inordine(nil).
inordine(arb(S, R, D)) :- inordine(S), write(R), write(' '), inordine(D).

preordine(nil).
preordine(arb(S, R, D)) :- write(R), write(' '), preordine(S), preordine(D).

postordine(nil).
postordine(arb(S, R, D)) :- postordine(S), postordine(D), write(R), write(' ').

inaltime(nil, 0).
inaltime(arb(S, _, D), H) :- inaltime(S, H1), inaltime(D, H2), H is (max(H1, H2) + 1).

concat([], L ,L).
concat([E|L1], L2, [E|Rez]) :- concat(L1, L2, Rez).

frunze(nil, []).
frunze(arb(nil, R, nil), [R]) :- !.
frunze(arb(S, _, D), L) :- frunze(S, L1), frunze(D, L2), concat(L1, L2, L).

noduri_interne(nil, []).
noduri_interne(arb(nil, _, nil), []) :- !.
noduri_interne(arb(S, R, D), L) :- noduri_interne(S, L1), noduri_interne(D, L2), concat([R|L1], L2, L).

muchii(nil, []).
muchii(arb(nil, _, nil), []).
muchii(arb(arb(S, R1, D), R, nil), [R-R1|L]) :- muchii(arb(S, R1, D), L).
muchii(arb(nil, R, arb(S, R2, D)), [R-R2|L]) :- muchii(arb(S, R2, D), L).
muchii(arb(arb(S1, R1, D1), R, arb(S2, R2, D2)), L) :- muchii(arb(S1, R1, D1), L1), muchii(arb(S2, R2, D2), L2), concat([R-R1, R-R2|L1], L2, L).


caut(Min, arb(nil, Min, D), D) :- !.
caut(Min, arb(S, R, D), arb(S1, R, D)) :- caut(Min, S, S1).

sterg(E, arb(nil, E, nil), nil).
sterg(E, arb(S, E, nil), S) :- !.
sterg(E, arb(nil, E, D), D) :- !.
sterg(E, arb(S, E, D), arb(S, Min, Rcaut)) :- caut(Min, D, Rcaut), !.
sterg(E, arb(S, R, D), arb(S, R, D1)) :- E > R, sterg(E, D, D1).
sterg(E, arb(S, R, D), arb(S1, R, D)) :- E < R, sterg(E, S, S1).