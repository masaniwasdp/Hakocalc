{-|
 - Description : Modulo por kalkuli probablon de mortigi monstron.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Calc.Monster
  ( HP
  , Probability
  , Quantity
  , defeatProbability
  , enoughMissiles
  )
  where


import Data.List (find)
import Hakocalc.Calc.Common (repeated, toProbabilityJust, fromProbability)
import Numeric.Natural (Natural)

import qualified Hakocalc.Calc.Common as Common


{-| -}
type HP = Natural


{-| -}
type Probability = Common.Probability


{-| -}
type Quantity = Natural


{-| Kalkulas probablon de sukcesi mortigi monstron. -}
defeatProbability
  :: HP          -- ^ HP de monstro.
  -> Quantity    -- ^ Kvanto da misiloj kiuj estos lanĉita.
  -> Probability -- ^ Probablo de sukcesi mortigi monstoron.

defeatProbability h q = toProbabilityJust $ sum xs
  where
    xs = map (fromProbability . repeated accuracy q) [h .. q]


{-| Kalkulas postulitan kvanton da misiloj por mortigi monstron. -}
enoughMissiles
  :: HP             -- ^ HP de monstro.
  -> Probability    -- ^ Probablo de sukcesi mortigi monstron.
  -> Maybe Quantity -- ^ Postulita kvanto da misiloj.

enoughMissiles h p
  | fromProbability p == 0 = Nothing
  | fromProbability p == 1 = Nothing

  | otherwise = find (\ q -> defeatProbability h q >= p) [h ..]


{-| La precizeco de misilo-sukcesoj. -}
accuracy :: Probability

accuracy = toProbabilityJust $ recip 7
