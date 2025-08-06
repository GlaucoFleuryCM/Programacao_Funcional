main = do
    -- pegando input
    la <- getLine
    let x = read la
    lb <- getLine
    let y = read lb
    putStrLn $ show $ biggest $ filtro (>=x) (crivo [2..y])

-- implementa o crivo de Erastótenes 
crivo :: Integral a => [a] -> [a] --coisas que suportam divisão
crivo [] = []
crivo (x:xs) = x : crivo (filtro ((/=0).(`mod` x)) xs)

-- dada uma lista, deixa nela só quem passa pela função teste
filtro :: (a -> Bool) -> [a] -> [a]
filtro _ [] = []
filtro f (x:xs)
    | f x = x : filtro f xs
    | otherwise = filtro f xs

-- dada uma lista, retorna a maior diferença que tem dentro dela
biggest :: (Ord a, Num a) => [a] -> a --tem que poder ser ordenado E subtraído
biggest (x1:x2:xs) = max (x2 - x1) (biggest (x2:xs)) 
-- pattern matching: se o de cima der ruim, venha à recursão de baixo (cheque nessa ordem)
biggest _ = 0

--PERGUNTAR PRO PROF: pq nn podia ter sido 'filtro (<=y) $ filtro (>=x) (crivo [2..])' + pattern matching (bro says)