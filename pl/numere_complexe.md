```maude
fmod COMPLEX is

  sort Int Cpx .
  op 0 : -> Int .
  op s_ : Int -> Int .
  op p_ : Int -> Int .
  op _+_ : Int Int -> Int [assoc comm prec 33] .
  op _-_ : Int Int -> Int [assoc prec 33] .
  op _*_ : Int Int -> Int [assoc comm prec 31] .
  op <_,_> : Int Int -> Cpx [ctor] .
  
  vars N M P Q : Int .
  
  ***rel
  eq s(p(M)) = M .
  eq p(s(M)) = M .
  
  *** +
  eq 0 + M = M .
  eq s(N) + M = s(N + M) .
  eq p(N) + M = p(N + M) .
  
  *** -
  eq M - 0 = M .
  eq N - s(M) = p(N - M) .
  eq N - p(M) = s(N - M) .
  
  *** *
  eq 0 * M = 0 .
  eq s(N) * M = (N * M) + M .
  eq p(N) * M = (N * M) - M .
  
  op _+_ : Cpx Cpx -> Cpx [assoc comm prec 33] .
  eq < N, M > + < P, Q > = < N + P, M + Q > .
  
  op _*_ : Cpx Cpx -> Cpx [assoc comm prec 31] .
  eq < N, M > * < P, Q > = < N * P - M * Q, N * Q + M * P > .
  
endfm
```
```maude
red < s(0), s(s(0)) > .
red < s(0), s(s(0)) > + < s(0), s(s(0)) > .
red < s(0), s(s(0)) > * < s(0), s(s(0)) > .

```
