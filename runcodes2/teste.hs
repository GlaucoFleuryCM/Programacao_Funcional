import Text.Read (readMaybe)

main = do
    la <- getLine
    lb <- getLine
    let minValue = readMaybe la :: Maybe Int
        maxValue = readMaybe lb :: Maybe Int
    case (minValue, maxValue) of
        (Just m, Just n) -> do
            putStrLn $ show $ applyF 2 factionType [m..n]
            putStrLn $ show $ applyF 1 factionType [m..n]
            putStrLn $ show $ applyF 3 factionType [m..n]
        _ -> putStrLn "Invalid input"

applyF :: Int -> (Int -> Int) -> [Int] -> Int
applyF _ _ [] = 0
applyF k f (x:xs)
    | k == f x = 1 + applyF k f xs
    | otherwise = applyF k f xs

division :: Int -> Int -> Int
division x1 x2
    | x2 == 0 = 0
    | mod x1 x2 == 0 = x2
    | otherwise = 0

tearApart :: Int -> Int -> Int
tearApart _ 0 = 0
tearApart x1 x2
    | x2 <= 0 = 0
    | otherwise = division x1 x2 + tearApart x1 (x2 - 1)

factionType :: Int -> Int
factionType x
    | x == tearApart x (x - 1) = 1
    | x > tearApart x (x - 1) = 2
    | otherwise = 3
