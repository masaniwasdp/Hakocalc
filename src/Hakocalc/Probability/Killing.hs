{-|
 - Description : Modulo por kalkuli probablon de mortigi monstron.
 - Copyright   : 2017 masaniwa
 - License     : MIT
 -}

module Hakocalc.Probability.Killing
  ( enoughMissiles
  , killingProbability
  , probabilityTransition ) where

import Data.Maybe (fromJust)
import Hakocalc.Probability.Common (Probability, repeated, toProbability, fromProbability)
import Numeric.Natural (Natural)


{-| Kalkulas probablon de sukcesi mortigi monstron. -}
killingProbability :: Natural     -- ^ HP de monstro.
                   -> Natural     -- ^ Kvanto da misiloj kiuj estos lanĉita.
                   -> Probability -- ^ Probablo de sukcesi mortigi monstoron.

killingProbability hp quantity = fromJust . sum' $ map repeated' list
  where
    sum'      = toProbability . sum
    repeated' = fromProbability . repeated accuracy quantity
    list      = [hp .. quantity]


{-| Kalkulas postulitan kvanton da misiloj por mortigi monstron. -}
enoughMissiles :: Natural       -- ^ HP de monstro.
               -> Probability   -- ^ Probablo de sukcesi mortigi monstron.
               -> Maybe Natural -- ^ Postulita kvanto da misiloj.

enoughMissiles hp probability = test hp
  where
    test q
      | not isHappenable = Nothing
      | isSufficient q   = Just q
      | otherwise        = test $ q + 1

    isHappenable   = fromProbability probability > 0 && fromProbability probability < 1
    isSufficient r = killingProbability hp r >= probability


{-| Kalkulas transiron de probablo de sukcesi mortigi monstron. -}
probabilityTransition :: Natural       -- ^ HP de monstro.
                      -> Natural       -- ^ Minimuma kvanto da misiloj kiuj estos lanĉita.
                      -> Natural       -- ^ Maksimuma kvanto da misiloj kiuj estos lanĉita.
                      -> [Probability] -- ^ Transiro de probablo.

probabilityTransition hp n m = map (killingProbability hp) [n .. m]


{-| La precizeco de misilo-sukcesoj. -}
accuracy :: Probability

accuracy = fromJust . toProbability $ 1 / 7
