module HakoniwaKilling (killingProbability, enoughMissiles) where

import Probability (repeated)

killingProbability :: Integral i => i -> i -> Rational

killingProbability hp quantity
    | hp > 0 && quantity > 0
        = sum $ map (repeated accuracy quantity) [hp .. quantity]

enoughMissiles :: Integral i => i -> Rational -> i

enoughMissiles hp probability
    | hp > 0 && probability > 0 && probability < 1
        = calc hp

    where
        calc q = if killingProbability hp q >= probability then q else calc $ q + 1

accuracy = 1 / 7
