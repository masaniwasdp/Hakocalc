-- メインモジュール。
-- Date: 2017/7/2
-- Authors: masaniwa

module Main where

import Data.List (intercalate)
import System.Environment (getArgs)
import Text.Printf (printf)

import HakoniwaKilling
    ( enoughMissiles
    , killingProbability
    , probabilityTransition )

import Probability (fromPercentage, toPercentage)

-- コマンドライン引数の情報。
-- 確率モード 怪獣の体力 撃つミサイルの数
-- ミサイルの数モード 怪獣の体力 倒したい確率
-- 確率推移モード 怪獣の体力 最小のミサイルの数 最大のミサイルの数
data Args = Probability Integer Integer
          | Missiles Integer Rational
          | Transition Integer Integer Integer

-- 文字列から読み取った値。
-- 文字列 -> 値
maybeRead :: Read r => String -> Maybe r
maybeRead s = case reads s of
    [(x, "")] -> Just x
    _         -> Nothing

-- 読み取ったコマンドライン引数の情報。
-- コマンドライン引数 -> 情報
readArgs :: [String] -> Maybe Args
readArgs [mode, first, second]
    | mode == probabilityMode
        = Probability <$> hp <*> quantity

    | mode == missilesMode
        = Missiles <$> hp <*> probability

    where
        hp          = maybeRead first
        quantity    = maybeRead second
        probability = fromPercentage <$> maybeRead second

readArgs [mode, first, second, third]
    | mode == transitionMode
        = Transition <$> hp <*> from <*> to

    where
        hp   = maybeRead first
        from = maybeRead second
        to   = maybeRead third

readArgs _ = Nothing

-- 割合の百分率表記。
-- 割合 -> 百分率
showPercentage :: Rational -> String
showPercentage = (++ " %") . printf "%.10f" . toPercentage

-- 計算結果。
-- コマンドライン引数 -> 結果を示す文字列
result :: Args -> Maybe String
result (Probability hp quantity) = showPercentage <$> probability where
    probability = killingProbability hp quantity

result (Missiles hp probability) = show <$> missiles where
    missiles = enoughMissiles hp probability

result (Transition hp from to) = showPercentages <$> transition where
    showPercentages = intercalate "\n" . map showPercentage
    transition      = probabilityTransition hp from to

-- 確率モードを示す文字列。
probabilityMode :: String
probabilityMode = "p"

-- ミサイルの数モードを表す文字列。
missilesMode :: String
missilesMode = "q"

-- 確率推移モードを示す文字列。
transitionMode :: String
transitionMode = "t"

-- コマンドの使い方。
usage :: String
usage = intercalate "\n" [
    "Usage:",
    "    p [hp] [quantity]: It calculates probability that the monster will die.",
    "    q [hp] [probability]: It calculates enough quantity of missiles to kill the monster.",
    "    t [hp] [from] [to]: It Calculates probability transition that the monster will die."]

-- 計算失敗を示す文字列。
failure :: String
failure = "Failed calculation."

main :: IO ()
main = do
    args' <- readArgs <$> getArgs

    case args' of
        Just args -> case result args of
            Just s  -> putStrLn s
            Nothing -> putStrLn failure

        Nothing -> putStrLn usage
