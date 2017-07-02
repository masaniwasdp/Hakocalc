-- 確率計算を扱うモジュール。
-- Date: 2017/7/1
-- Authors: masaniwa

module Probability
    ( combination
    , fromPercentage
    , toPercentage
    , repeated ) where

-- 割合の百分率への変換。
-- 割合 -> 百分率
toPercentage :: Rational -> Double
toPercentage = fromRational . (* 100)

-- 百分率の割合への変換。
-- 百分率 -> 割合
fromPercentage :: Double -> Rational
fromPercentage = toRational . (/ 100)

-- 組み合わせの総数。
-- n -> r -> 組み合わせの総数
combination :: Integer -> Integer -> Maybe Integer
combination n r
    | n >= 0 && r >= 0
        = Just $ upper `div` lower

    | otherwise = Nothing

    where
        upper = product [(n - r + 1) .. n]
        lower = product [1 .. r]

-- 反復試行の確率。
-- p -> n -> k -> 確率
repeated :: Rational -> Integer -> Integer -> Maybe Rational
repeated p n k
    | p >= 0 && n >= 0 && k >= 0
        = (* success) . (* failure) . toRational <$> combination n k

    | otherwise = Nothing

    where
        success = p ^ k
        failure = (1 - p) ^ (n - k)
