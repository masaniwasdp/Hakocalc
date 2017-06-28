module Main where

import Control.Monad (when)
import Data.List (intercalate)
import System.Environment (getArgs)

import HakoniwaKilling (enoughMissiles, killingProbability)

data Args = Probability Integer Integer
          | Missiles Integer Rational

readArgs :: [String] -> Maybe Args

readArgs [mode, first, second]
    | mode == probabilityMode && hp > 0 && quantity > 0
        = Just $ Probability hp quantity

    | mode == missilesMode && hp > 0 && probability > 0 && probability < 1
        = Just $ Missiles hp probability

    | otherwise
        = Nothing

    where
        hp = read first
        quantity = read second
        probability = (toRational . read) second / 100

readArgs _ = Nothing

probabilityMode = "p"

missilesMode = "q"

usage = intercalate "\n" [
    "usage: [args...]",
    "args:",
    "    p [hp] [quantity]: Calculate probability of killing monster.",
    "    q [hp] [probability (%)] : Calculate enough quantity of missiles for killing monster."]

main = do
    args <- readArgs <$> getArgs

    case args of
        Just (Probability hp quantity) -> print . fromRational $ killingProbability hp quantity * 100
        Just (Missiles hp probability) -> print $ enoughMissiles hp probability
        Nothing -> putStrLn usage
