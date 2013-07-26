{-# OPTIONS -Wall -Werror #-}

import System.Environment (getArgs)
import Data.Function (on)
import Data.List (elemIndex, minimumBy)
import Data.Maybe (fromJust, isJust)
import Data.String.Utils (join, split, strip)

main :: IO ()
main = do
  args <- getArgs
  stdin <- getContents
  let maxWidth = read $ head args
  putStr $ main' stdin maxWidth
         
-- |
-- >>> main' "    [foo, bar, baz, qux, quux]" 20
-- "    [foo, bar, baz,\n     qux, quux]"
-- >>> main' "    foo, bar, baz, qux, quux" 20
-- "    foo, bar, baz,\n    qux, quux"
main' :: String -> Int -> String
main' s n = before ++ formatting (separateWords ws $ n - offset) offset
    where offset = maybe (indentWidth s) (+ 1) $ fstIndex ['[', '{'] s
          (before, body) = splitAt offset s
          ws = map strip $ split "," body

-- |
-- >>> fstIndex [5,3] [1,2,3,4,5]
-- Just 2
-- >>> fstIndex [6,7,8] [1,2,3,4,5]
-- Nothing
fstIndex :: (Eq a) => [a] -> [a] -> Maybe Int
fstIndex xs ys = case filter isJust $ map (flip elemIndex ys) xs of
                   []  -> Nothing
                   xs' -> minimumBy (compare `on` fromJust) xs'

-- |
-- >>> indentWidth "    foo"
-- 4
indentWidth :: String -> Int
indentWidth = length . takeWhile (== ' ')

-- |
-- >>> separateWords ["foo", "bar", "baz", "qux", "quux"] 10
-- [["foo","bar"],["baz","qux"],["quux"]]
separateWords :: [String] -> Int -> [[String]]
separateWords ws maxWidth = separateWords' ws maxWidth 0 []

separateWords' :: [String] -> Int -> Int -> [String] -> [[String]]
separateWords' [] _ _ tmp = tmp: []
separateWords' wws@(w:ws) maxWidth currentWidth tmp
    | currentWidth == 0 && wordLength > maxWidth
                           = [w]: separateWords' ws maxWidth 0 []
    | newWidth <= maxWidth = separateWords' ws maxWidth newWidth (tmp ++ [w])
    | otherwise            = tmp: separateWords' wws maxWidth 0 []
    where wordLength = length w +  2
          newWidth = wordLength + currentWidth

-- |
-- >>> formatting [["foo", "bar"], ["baz", "qux"], ["quux"]] 4
-- "foo, bar,\n    baz, qux,\n    quux"
formatting :: [[String]] -> Int -> String
formatting xs offset = join (",\n" ++ indent) $ map (join ", ") xs
    where indent = replicate offset ' '
