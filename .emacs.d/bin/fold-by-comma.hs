{-# OPTIONS -Wall -Werror #-}

import System.Environment (getArgs)
import Data.Function (on)
import Data.List (elemIndex, minimumBy)
import Data.Maybe (fromJust, isJust)
import Data.String.Utils (join, split, strip)

main :: IO ()
main = do
  maxWidth <- fmap (read . head) getArgs
  stdin <- getContents
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
separateWords [] _ = []
separateWords ws maxWidth = let (xs, ys) = separateWords' ws maxWidth
                            in xs: separateWords ys maxWidth

-- |
-- >>> separateWords' ["foo", "bar", "baz", "qux", "quux"] 10
-- (["foo","bar"],["baz","qux","quux"])
separateWords' :: [String] -> Int -> ([String], [String])
separateWords' [] _ = ([], [])
separateWords' wws@(w:ws) n
    | n' < 0    = ([], wws)
    | otherwise = let (xs, ys) = separateWords' ws n'
                  in (w:xs, ys)
    where n' = n - (length w + 2)


-- |
-- >>> formatting [["foo", "bar"], ["baz", "qux"], ["quux"]] 4
-- "foo, bar,\n    baz, qux,\n    quux"
formatting :: [[String]] -> Int -> String
formatting xs offset = join (",\n" ++ indent) $ map (join ", ") xs
    where indent = replicate offset ' '
