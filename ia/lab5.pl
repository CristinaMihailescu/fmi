membru(E,[E|_]).
membru(E,[_|L]):- membru(E,L).

concat([],L,L).
concat([E|L1],L2,[E|Rez]):- concat(L1,L2,Rez).

conflict1(L1/C1,L):-membru(L2/C2,L),(L1==L2;C1==C2;abs(L1-L2)=:=abs(C1-C2)).
dame([]).
dame([L1/C1|L]):-dame(L),membru(C1,[1,2,3,4,5,6,7,8]),\+conflict1(L1/C1,L).

nr_rez1(N):-L=[1/_,2/_,3/_,4/_,5/_,6/_,7/_,8/_],bagof(L,dame(L),L1),length(L1,N).
nr_rez2(N):-L=[1/_,2/_,3/_,4/_,5/_,6/_,7/_,8/_],setof(L,dame(L),L1),length(L1,N).

vecin(romania,[moldova,ucraina,ungaria,serbia,bulgaria,mneagra]).
vecin(moldova,[romania,ucraina,mneagra]).
vecin(ucraina,[moldova,romania,ungaria,mneagra]).
vecin(ungaria,[ucraina,romania,serbia]).
vecin(serbia,[ungaria,romania,bulgaria]).
vecin(bulgaria,[romania,serbia,mneagra]).
vecin(mneagra,[romania,bulgaria,moldova,ucraina]).

conflict2(T1/C1,L):-membru(T2/C2,L),C1==C2,vecin(T1,L2),membru(T2,L2).

colorare([]).
colorare([T1/C1|L]):-colorare(L),membru(C1,[rosu,albastru,galben,verde]),\+conflict2(T1/C1,L).

hanoi(1,A,B,_):-write('de pe '),write(A),write(' pe '),write(B),nl.
hanoi(N,A,B,C):-N1 is N-1,hanoi(N1,A,C,B),hanoi(1,A,B,C),hanoi(N1,C,B,A).

ins_arb_cautare(E,nil,arb(nil,E,nil)).
ins_arb_cautare(E,arb(S,E,D),arb(S,E,D)).
ins_arb_cautare(E,arb(S,R,D),arb(S1,R,D)):-E<R,ins_arb_cautare(E,S,S1).
ins_arb_cautare(E,arb(S,R,D),arb(S,R,D1)):-E>R,ins_arb_cautare(E,D,D1).

creare_arb_cautare([],nil).
creare_arb_cautare([E|L],T):-creare_arb_cautare(L,T1),ins_arb_cautare(E,T1,T).