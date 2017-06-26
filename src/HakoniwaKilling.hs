module HakoniwaKilling (calcProbability, calcEnoughMissiles) where

import Probability (repeated)

calcProbability :: Integral i => i -> i -> Rational

calcProbability hp quantity
    | hp > 0 && quantity > 0
        = try hp quantity

calcEnoughMissiles :: Integral i => i -> Rational -> i

calcEnoughMissiles hp probability
    | hp > 0 && probability > 0 && probability < 1
        = calc hp

    where
        calc q = if try hp q >= probability then q else calc $ q + 1

try :: Integral i => i -> i -> Rational

try hp quantity
    | hp >= 0 && quantity >= 0
        = sum $ map (repeated accuracy quantity) [hp .. quantity]

accuracy = 1 / 7
