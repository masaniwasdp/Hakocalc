module Main where

import Control.Monad (when)
import Data.List (intercalate)
import System.Environment (getArgs)

import HakoniwaKilling (calcEnoughMissiles, calcProbability)

data Args = Probability Integer Integer
          | EnoughMissiles Integer Rational

readArgs :: [String] -> Maybe Args

readArgs [mode, first, second]
    | mode == probabilityMode && hp > 0 && quantity > 0
        = Just $ Probability hp quantity

    | mode == enoughMissilesMode && hp > 0 && probability > 0 && probability < 1
        = Just $ EnoughMissiles hp probability

    | otherwise
        = Nothing

    where
        hp = read first
        quantity = read second
        probability = (toRational . read) second / 100

readArgs _ = Nothing

probabilityMode = "p"

enoughMissilesMode = "e"

usage = intercalate "\n" [
    "usage: [args...]",
    "args:",
    "    p [hp] [quantity]: Calculate probability of killing monster.",
    "    e [hp] [probability (%)] : Calculate enough quantity of missiles for killing monster."]

main = do
    args <- readArgs <$> getArgs
    case args of
        Just (Probability hp quantity) -> print . fromRational $ calcProbability hp quantity * 100
        Just (EnoughMissiles hp probability) -> print $ calcEnoughMissiles hp probability
        Nothing -> putStrLn usage
