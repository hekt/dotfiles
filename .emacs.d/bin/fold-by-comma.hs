import System.Environment (getArgs)
import Data.List

main = do
  args <- getArgs
  stdin <- getContents
  let maxWidth = read $ head args
  putStr $ main' stdin maxWidth
         
-- |
-- >>> main' "    [foo, bar, baz, qux, quux]" 20
-- "    [foo, bar, baz,\n     qux, quux]"
main' :: String -> Int -> String
main' s n = before ++ formatting (separateWords words $ n - offset) offset
    where i = maybe (getOffset s) (+ 1) $ elemIndex' ['[', '{'] s
          (before, body) = splitAt i s
          offset = length before
          words = map strip $ splitBy ',' body

-- |
-- >>> elemIndex' ['g','b'] "abcdefg"
-- Just 1
-- >>> elemIndex' ['h'] "abcdefg"
-- Nothing
elemIndex' :: (Eq a) => [a] -> [a] -> Maybe Int
elemIndex' xs ys = elemIndex'' xs ys 0

elemIndex'' :: (Eq a) => [a] -> [a] -> Int -> Maybe Int
elemIndex'' _ [] i = Nothing
elemIndex'' xs (y:ys) i
    | y `elem` xs = Just i
    | otherwise = elemIndex'' xs ys (i+1)

-- |
-- >>> splitBy '/' "foo/bar/baz"
-- ["foo","bar","baz"]
splitBy :: Char -> String -> [String]
splitBy _ [] = []
splitBy c cs = xs: splitBy c ys
    where (xs, ys) = splitBy' c cs

splitBy' :: Char -> String -> (String, String)
splitBy' c cs = (xs , ys)
    where xs = takeWhile (/= c) cs
          ys = let ys_ = dropWhile (/= c) cs
               in if null ys_ then [] else tail ys_

-- |
-- >>> lstrip "   \nfoo"
-- "foo"
lstrip :: String -> String
lstrip = dropWhile (flip elem [' ', '\n'])

-- |
-- >>> rstrip "bar   \n"
-- "bar"
rstrip :: String -> String
rstrip = reverse . dropWhile (flip elem [' ', '\n']) . reverse

-- |
-- >>> strip "\n baz \n"
-- "baz"
strip :: String -> String
strip = rstrip . lstrip

-- |
-- >>> join " / " ["foo", "bar", "baz"]
-- "foo / bar / baz"
join :: [a] -> [[a]] -> [a]
join _ [] = []
join _ [x] = x
join d (x:xs) = x ++ d ++ join d xs

-- |
-- >>> getOffset "    foo"
-- 4
getOffset :: String -> Int
getOffset = length . takeWhile (== ' ')


-- |
-- >>> separateWords ["foo", "bar", "baz", "qux", "quux"] 10
-- [["foo","bar"],["baz","qux"],["quux"]]
separateWords :: [String] -> Int -> [[String]]
separateWords [] _ = []
separateWords words maxWidth = l: separateWords ws maxWidth
    where (l, ws) = separateWords' words maxWidth 0 []

separateWords' :: [String] -> Int -> Int -> [String] -> ([String], [String])
separateWords' [] _ _ tmp = (tmp, [])
separateWords' wws@(w:ws) maxWidth currentWidth tmp
    | currentWidth == 0 && wordLength > maxWidth
                           = ([w], ws)
    | newWidth <= maxWidth = separateWords' ws maxWidth newWidth (tmp ++ [w])
    | otherwise            = (tmp, wws)
    where wordLength = length w +  2
          newWidth = wordLength + currentWidth

-- |
-- >>> formatting [["foo", "bar"], ["baz", "qux"], ["quux"]] 4
-- "foo, bar,\n    baz, qux,\n    quux"
formatting :: [[String]] -> Int -> String
formatting xs offset = join (",\n" ++ indent) $ map (join ", ") xs
    where indent = replicate offset ' '
