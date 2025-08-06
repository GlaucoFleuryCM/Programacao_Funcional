--checar se é triângulo + calcular área SE for triângulo;
main = do
    --pegando input
    la <- getLine
    let x = read la
    lb <- getLine
    let y = read lb
    lc <- getLine
    let z =  read lc
    --usando a formula para calcular
    putStrLn $ calcularArea x y z

checarTriangulo a b c
    | a + b < c = False
    | a + c < b = False
    | b + c < a = False
    | otherwise = True

--calcula a área;
calcularArea a b c
    | checarTriangulo a b c =  show heron
    | otherwise = "-"
        where 
            s = 1/2 * (a + b + c)
            heron = sqrt (s * (s - a) * (s - b) * (s - c))


