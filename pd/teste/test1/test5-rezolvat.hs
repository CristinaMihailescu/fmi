{-
1.
Daca toate perechile de numere pare
dintr-o lista au produsul elementelor mai mare decat 10

> prodMare [(2, 8), (1, 5), (10, 10)]
True  -- 16, (1 si 5 sunt impare), 100

> prodMare [(0, 4), (100, 5)]
False  -- 0, (5 este impar)
-}
prodMare, prodMare', prodMareHOF, prodMareHOF2 :: [(Int, Int)] -> Bool
prodMare l = and [f * s > 10 | (f, s) <- l, even f, even s]

prodMare' [] = True
prodMare' ((f,s):r)
  | even f && even s = f * s > 10 && prodMare' r
  | otherwise        = False

prodMareHOF = filter (even . fst) >>> filter (even . snd) >>> filter ((>10) . uncurry (*)) >>> length >>> (>0)
prodMareHOF2 = all (\(a, b) -> even a && even b && a * b > 10)


{-
2.
Cate vocale exista intre doua litere date

> vocaleIntre 'a' 'f'
2  -- a si e
-}
vocaleIntre, vocaleIntre', vocaleIntre'' :: Char -> Char -> Int
vocaleIntre l1 l2 = length (filter (`elem` "aeiou") [l1..l2])

vocaleIntre' l1 l2 = helper [l1..l2]
  where helper "" = 0
        helper (c:cs)
          | c `elem` "aeiou"   = 1 + helper cs
          | otherwise          = helper cs

vocaleIntre'' l1 l2 = length [c | c <- [l1..l2], c `elem` "aeiou"]



{-
3.
Dispersia unui vector - diferenta la patrat a fiecarui element fata de medie, insumate

> dispersie [0, 2, 4, 6]
20.0  -- (media = 3) ~> [0-3, 2-3, 4-3, 6-3] ~> [-3^2, -1^2, 1^2, 3^2] ~> 20
-}
dispersie :: [Float] -> Float
dispersie v = sum [(x - m)^2 | x<-v]
  where m = sum v / fromIntegral (length v)



{-
> parseInt "123"
123
-}
parseInt :: String -> Int
parseInt inp
  | all isDigit inp  = helper (reverse inp) 0
  | otherwise        = error "The string is not made only of digits"
    where helper "" _ = 0
          helper (c:cs) pow = (digitToInt c * 10^pow) + helper cs (pow+1)
{-
4.
Totalul valorilor obtinute prin inmultirea cifrelor din fiecare numar mai mare decat 10
Hint1: puteti folosi functia words. ex: words "ab cd ef" = ["ab", "cd", "ef"]
Hint2: puteti folosi functia parseInt

> f "Am 3 mere, 25 pere, 31 banane si 100 prune"
13  -- (3 ignorat) + 2*5 + 3*1 + 1*0*0 ~> 10 + 3 + 0 ~> 13

-}
f :: String -> Int
f = words >>> filter (all isDigit) >>> filter (parseInt >>> (>10)) >>> map prodOfDigits >>> sum
  where prodOfDigits = map digitToInt >>> product
