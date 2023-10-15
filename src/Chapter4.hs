module Chapter4
    ( chapter4
    , halve
    , third, third', third''
    , safetail, safetail', safetail''
    ) where

chapter4 :: IO ()
chapter4 = mapM_ (putStrLn . row) (zip [1..] sol) where
    row (n, xs) = "Sol " ++ show n ++ ": " ++ xs

intdata :: [Int]
intdata = [1..10]

mty :: [Int]
mty = []

sol :: [String]
sol = [
        show (halve intdata),
        show (third intdata == third' intdata && third' intdata == third'' intdata),
        show (safetail mty == safetail' mty &&
              safetail mty == safetail'' mty &&
              safetail intdata == safetail' intdata &&
              safetail intdata == safetail'' intdata),
        show (or' False True &&
              or'' True False &&
              or''' True True &&
              not (or' False False) &&
              not (or'' False False) &&
              not (or''' False False))
      ]

sol2 :: String
sol2 = show (third [1, 2, 3, 4, 5])

halve :: [a] -> ([a], [a])
halve xs = (take hlen xs, drop hlen xs) where
    hlen = div (length xs) 2

third :: [a] -> a
third xs = head (tail (tail xs))

third' :: [a] -> a
third' xs = xs !! 2

third'' :: [a] -> a
third'' (_:_:x:xs) = x

safetail :: [a] -> [a]
safetail xs = if null xs then [] else tail xs

safetail' :: [a] -> [a]
safetail' xs | null xs   = []
             | otherwise = tail xs

safetail'' :: [a] -> [a]
safetail'' [] = []
safetail'' xs = tail xs

or' :: Bool -> Bool -> Bool
False `or'` False = False
False `or'` True  = True
True  `or'` False = True
True  `or'` True  = True

or'' :: Bool -> Bool -> Bool
False `or''` False = False
_     `or''` _     = True

or''' :: Bool -> Bool -> Bool
or''' False b = b
or''' _     _ = True

-- or''' :: Bool -> Bool -> Bool
-- or''' b b = b
-- or''' _ _ = True
