module Main where

import Tree23
import Data.List
import Data.List.Split

main :: IO ()
main = do
         line <- getLine
         let list = read $ "[" ++
                           concat (intersperse "," (splitOn " " line)) ++
                           "]" :: [Int]
         print $ fromList list
