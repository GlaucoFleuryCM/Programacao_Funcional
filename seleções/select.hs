import Data.Ord
import Data.List
main = do
    linha <- getLine
    let numbers = map read (words linha) :: [Int]
    conteudo <- readFile "dados.csv"
    let paises = parserLinhas $ lines conteudo
    --somar Actives de países com confirmed >= n1
    putStrLn $
     show $
     sum $
     map active $
     filter ((>= numbers !! 0).confirmed) $
     paises
    --somar Deaths de n3 países com menor valor de confirmed
    --entre os n2 países com maior valor de active
    putStrLn $
     show $
     sum $
     map deaths $
     take (numbers !! 2) $
     sortBy (comparing confirmed) $
     take (numbers !! 1) $
     reverse $
     sortBy (comparing active) $
     paises
     -- ordem alfabetica os n4 países com maior Confirmed
    putStrLn $
     unlines $
     map nome $
     sortBy (comparing nome) $
     take (numbers !! 3) $
     reverse $
     sortBy (comparing confirmed) $
     paises

--conteúdo de cada linha
data Pais = Pais {
    nome :: String,
    confirmed :: Int,
    deaths :: Int,
    recovery :: Int,
    active :: Int
} 

-- separa de acordo com alguma condição
wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s =  case dropWhile p s of
                      "" -> []
                      s' -> w : wordsWhen p s''
                            where (w, s'') = break p s'

-- retorna lista de países (1 por linha)
parserLinhas :: [String] -> [Pais]
parserLinhas [] = []
parserLinhas (x:xs) = pais : parserLinhas xs
  where
    [n, c, d, r, a] = wordsWhen (== ',') x
    pais = Pais n (read c) (read d) (read r) (read a)


