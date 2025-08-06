main = do
    --lendo o input do usuário;
    la <- getLine
    let min = read la 
    lb <- getLine
    let max = read lb 

    --printando os resultados;
    putStrLn $ show $ applyF 2 factionType [min..max]
    putStrLn $ show $ applyF 1 factionType [min..max]
    putStrLn $ show $ applyF 3 factionType [min..max] 

--a função 'ApplyF' recebe um vetor genérico (que
--no nosso caso será de inteiros) e aplica a função
--dada como argumento em cada elemento, retornando
--um vetor com o resultado de cada f em seus elementos;
applyF :: Int -> (Int -> Int) -> [Int] -> Int
applyF _ _ [] = 0
applyF k f (x:xs)
    | k == f x = 1 + applyF k f xs 
    | otherwise = applyF k f xs

--'divsion' testa se dá pra dividir um pelo outro. Se sim,
--retorna o divisor; se não, retorna 0; 
division :: Int -> Int -> Int
division x1 x2
    | x2 == 0 = 0 --só por precaução (evitando indeterminado);
    | mod x1 x2 == 0 = x2
    | otherwise = 0 
 
--para um inteiro dado, a função tearApart descasca-o
--em seus divisores, retornando a soma deles;
tearApart :: Int -> Int -> Int
tearApart _ 0 = 0 
tearApart x1 x2 
    | x2 <= 0 = 0 --só pra caso tearApart receba, sla, 0
    | otherwise = division x1 x2 + tearApart x1 (x2-1)

--para x e o tearApart, checa igualdade entre ambos, codificando
--1 para iguais, 2 para x1 > tApart, e 3 para o caso que resta;
factionType :: Int -> Int
factionType x
    | x == tearApart x (x-1) = 1
    | x > tearApart x (x-1) = 2 --SE LIVRAR DO FACTION TYPE: NA PRÓPRIA DIVISAO JÁ AVALIAR A PARADAD
    | otherwise = 3


