{-|
 - Description : Modulo por kalkuli probablon de mortigi monstron.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Probability.Killing
  ( enoughMissiles
  , killingProbability
  )
  where


import Data.List (find)
import Hakocalc.Probability.Common (Probability, repeated, toProbabilityJust, fromProbability)
import Numeric.Natural (Natural)


{-| Kalkulas probablon de sukcesi mortigi monstron. -}
killingProbability
  :: Natural     -- ^ HP de monstro.
  -> Natural     -- ^ Kvanto da misiloj kiuj estos lanĉita.
  -> Probability -- ^ Probablo de sukcesi mortigi monstoron.

killingProbability h q = toProbabilityJust
  . sum
  . map (fromProbability . repeated accuracy q) $ [h .. q]


{-| Kalkulas postulitan kvanton da misiloj por mortigi monstron. -}
enoughMissiles
  :: Natural       -- ^ HP de monstro.
  -> Probability   -- ^ Probablo de sukcesi mortigi monstron.
  -> Maybe Natural -- ^ Postulita kvanto da misiloj.

enoughMissiles h p
  | fromProbability p == 0 = Nothing

  | fromProbability p == 1 = Nothing

  | otherwise = find (\ q -> killingProbability h q >= p) [h ..]


{-| La precizeco de misilo-sukcesoj. -}
accuracy :: Probability

accuracy = toProbabilityJust $ recip 7
