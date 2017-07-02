-- 怪獣を倒せる確率を扱うモジュール。
-- Date: 2017/7/2
-- Authors: masaniwa

module HakoniwaKilling
    ( enoughMissiles
    , killingProbability
    , probabilityTransition ) where

import Probability (repeated)

-- 怪獣を倒せる確率。
-- 怪獣の体力 -> 撃つミサイルの数 -> 怪獣を倒せる確率
killingProbability :: Integer -> Integer -> Maybe Rational
killingProbability hp quantity
    | hp > 0 && quantity > 0
        = sum <$> mapM (repeated accuracy quantity) [hp .. quantity]

    | otherwise = Nothing

-- 怪獣を倒すために必要なミサイルの数。
-- 怪獣の体力 -> 怪獣を倒したい確率 -> ミサイルの数
enoughMissiles :: Integer -> Rational -> Maybe Integer
enoughMissiles hp probability
    | hp > 0 && probability > 0 && probability < 1
        = try hp

    | otherwise = Nothing

    where
        try quantity = do
            probability' <- killingProbability hp quantity

            if probability' >= probability
                then return quantity
                else try $ quantity + 1

-- 怪獣を倒せる確率の推移。
-- 怪獣の体力 -> 最小のミサイルの数 -> 最大のミサイルの数 -> 確率の推移
probabilityTransition :: Integer -> Integer -> Integer -> Maybe [Rational]
probabilityTransition hp from to
    | hp > 0 && from > 0 && from <= to
        = mapM (killingProbability hp) [from .. to]

    | otherwise = Nothing

-- ミサイルの命中精度。
accuracy :: Rational
accuracy = 1 / 7
