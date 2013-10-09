
isFactor :: Int -> Int -> Bool
isFactor num fac = mod num fac == 0

sumMultiples :: [Int] -> Int -> Int
sumMultiples mults max = sum [n | n <- [1..max], any (==True) (map (isFactor n) mults)] 

main = print (sumMultiples [3, 5] 1000)
