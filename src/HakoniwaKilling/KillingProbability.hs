{-|
 - Description : La modulo por kalkuli probablon de mortigi monstron.
 - Copyright   : 2017 masaniwa
 -}

module HakoniwaKilling.KillingProbability
    ( enoughMissiles
    , killingProbability
    , probabilityTransition ) where

import Control.Parallel.Strategies (parMap, rpar)
import Data.Maybe (fromJust)
import Numeric.Natural (Natural)

import HakoniwaKilling.Probability (Probability, repeated, toProbability, fromProbability)


{-| Kalkulas probablon de sukcesi mortigi monstron. -}
killingProbability :: Natural     -- ^ HP de monstro.
                   -> Natural     -- ^ Kvanto da misiloj kiu estos lanĉita.
                   -> Probability -- ^ Probablo de sukcesi mortigi monstoron.

killingProbability hp quantity = fromJust . sum' $ map repeated' list where
    sum'      = toProbability . sum
    repeated' = fromProbability . repeated accuracy quantity
    list      = [hp .. quantity]


{-| Kalkulas postulitan kvanton da misiloj por mortigi monstron. -}
enoughMissiles :: Natural     -- ^ HP de monstro.
               -> Probability -- ^ Probablo de sukcesi mortigi monstron.
               -> Natural     -- ^ Postulita kvanto da misiloj.

enoughMissiles hp probability
    | fromProbability probability == 0 = 0
    | otherwise                        = try hp
    where
        try quantity
            | killingProbability hp quantity >= probability = quantity
            | otherwise                                     = try $ quantity + 1


{-| Kalkulas transiron de probablo de sukcesi mortigi monstron. -}
probabilityTransition :: Natural            -- ^ HP de monstro.
                      -> (Natural, Natural) -- ^ Minimuma kaj maksimuma kvanto da misiloj kiu estos lanĉita.
                      -> [Probability]      -- ^ Transiro de probablo.

probabilityTransition hp (n, m) = parMap rpar (killingProbability hp) list where
    list | n < m     = [n .. m]
         | otherwise = [m .. n]


{-| La precizeco de misilo-sukcesoj. -}
accuracy :: Probability

accuracy = fromJust . toProbability $ 1 / 7
