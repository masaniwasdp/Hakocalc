module Probability (combination, repeated) where

combination :: Integral i => i -> i -> i

combination n r
    | n >= 0 && r >= 0
        = upper `div` lower

    where
        upper = product [(n - r + 1) .. n]
        lower = product [1 .. r]

repeated :: Integral i => Rational -> i -> i -> Rational

repeated p n k
    | p >= 0 && n >= 0 && k >= 0
        = nCk * pk * qnk

    where
        nCk = toRational $ combination n k
        pk = p ^ k
        qnk = (1 - p) ^ (n - k)
