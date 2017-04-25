```maude
fmod LIST-INT3 is
  protecting INT .
  sort List .
  subsort Int < List .
  op nil : -> List .
  op _ _ : Int List -> List [id: nil] .
endfm

fmod TREE is
  
  protecting INT .
  protecting LIST-INT3 .
  sort Tree .
  op empty : -> Tree .
  op _ _ _ : Tree Int Tree -> Tree .
  
  vars N P : Int .
  vars T TS TD : Tree .
  
  op search : Int Tree -> Bool .
  eq search(N, empty) = false .
  eq search(N, TS N TD) = true .
  eq search(N, TS P TD) = if N <= P then search(N, TS) else search(N, TD) fi .
  eq search(N, T) = false .
  
  op depth : Tree -> Int .
  eq depth(empty) = 0 .
  eq depth(empty N empty) = 0 .
  eq depth(TS N TD) = 1 + max(depth(TS), depth(TD)) .
  
  op SRD : Tree -> List .
  eq SRD(empty) = nil .
  eq SRD(TS N TD) = SRD(TS) N SRD(TD) .
  
  op RSD : Tree -> List .
  eq RSD(empty) = nil .
  eq RSD(TS N TD) = N RSD(TS) RSD(TD) .
  
  op SDR : Tree -> List .
  eq SDR(empty) = nil .
  eq SDR(TS N TD) = SDR(TS) SDR(TD) N .
  
endfm
```
```maude
red search(6, ((empty 1 empty) 2 (empty 3 empty)) 5 ((empty 6 empty) 7 (empty 8 empty))) .
red depth(((empty 1 empty) 2 (empty 3 empty)) 5 ((empty 6 empty) 7 (empty 8 empty))) .
red SRD(((empty 1 empty) 2 (empty 3 empty)) 5 ((empty 6 empty) 7 (empty 8 empty))) .
red RSD(((empty 1 empty) 2 (empty 3 empty)) 5 ((empty 6 empty) 7 (empty 8 empty))) .
red SDR(((empty 1 empty) 2 (empty 3 empty)) 5 ((empty 6 empty) 7 (empty 8 empty))) .
```
