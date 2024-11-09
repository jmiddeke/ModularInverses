-- The list of units modulo 'm'.
units :: Integer -> [Integer]
units m | m > 0 = [ x | x <- [1..m], gcd x m == 1 ]

-- Is 'a' its own inverse modulo 'm'?
autoInverse :: Integer -> Integer -> Bool
autoInverse m a | m > 0 = a^2 `mod` m == 1

-- Is every unit modulo 'm' its own inverse?
everyInverseAuto :: Integer -> Bool
everyInverseAuto m | m > 0 = all (autoInverse m) $ units m

-- All 'm' such that the units modulo 'm' are their own inverses.
result :: [Integer]
result = [ m | m <- [1..49], everyInverseAuto m ]

-- Print the result
main :: IO ()
main = putStrLn $ show result
