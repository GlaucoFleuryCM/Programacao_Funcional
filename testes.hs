-- perguntar coisa pro user é impuro (dá valores diferentes 
-- == efeito colateral); getine é impuro, read é puro
main = do
  -- geram strings: devem converter pra número
  -- o get vê q tu usou as variaveis em bhaskara (como nnumeros)
  -- e converte; se nn tiver uso no progrma ou 2 usos, ele nao
  -- sabe para o que converter e nao compila;
  la <- getLine
  let a = read la --ATENÇÃO: precisa do la, lb, lc (pq?)
  lb <- getLine
  let b = read lb
  lc <- getLine
  let c = read lc
  -- se bhaskara virasse impuro (usasse um putsrt, sla), tem que 
  -- mudar TUDO e fica evidente o errro (codigo seguro)
  let resultado = explica $ bhaskara a b c
  putStrLn $ show $ bhaskara 1 4 (-10)

  putStrLn $ resultado
    where
    explica [] = "nao ha raizes"
    explica [x] = "ha uma raiz" ++ show x
    explica [x1, x2]  = "ha duas raizes" ++ show x1 ++ "e" ++ show x2

-- função sinal em Haskell
signal x
 | x < 0 = -1
 | x == 0 = 0
 | otherwise = 1 -- otherwise == true (executa em ordem)

-- as guardas "|" são comparadas em ordem

-- função módulo
absolute x
 | x >= 0 = x
 | x < 0 = -x

-- soma números positivos numa lista
sumPos [] = 0
sumPos (x:xs)
 | x > 0 = x + sumPos xs
 | otherwise = sumPos xs

-- implementacao mais foda
sumPosit [] = 0
sumPosit (x:xs)
 | x > 0 = x + sc
 | otherwise = sc
   where
     sc = sumPosit xs

-- bhaskara fica muito feio slk
bhaskara a b c
 | delta < 0 = []
 | delta == 0 = [x]
 | otherwise = [x', x'']
   where
     delta = b ^ 2 - 4 * a * c
     x = (-b) / (2*a)
     x' = (-b + sqrtD) / (2*a)
     x'' = (-b - sqrtD) / (2*a)
     sqrtD = sqrt delta

-- DETALHES: não comece coisas com UPPER CASE + cuidado com indentação (é tudo espaço)
-- COMO FAZER FUNCOES: COM OU SEM PARENTESES EM ARGUMENTOS (ex: sqrt a b c ou (a b c))