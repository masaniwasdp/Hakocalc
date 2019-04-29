{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

-- |
-- Description : Modulo por kalkuli probablon de mortigi monstron.
-- Copyright   : 2019 masaniwa
-- License     : MIT
--
module Hakocalc.Entity.Defeat
  ( HP
  , Probability
  , Quantity
  , missiles
  , probability
  ) where


import Data.List (find)
import Hakocalc.Entity.Common (repeated)
import Hakocalc.Entity.Probability (fromProbability, toProbability)
import Numeric.Natural (Natural)

import qualified Hakocalc.Entity.Probability as P


-- | Reprezentanta HP.
type HP = Natural


-- | Reprezentanta probablo.
type Probability = P.Probability


-- | Reprezentanta kvanto.
type Quantity = Natural


-- | Kalkulas probablon de sukcesi mortigi monstron.
probability :: HP -> Quantity -> Probability

probability h q = toProbability $ sum xs
  where
    xs = map (fromProbability . repeated accuracy q) [h .. q]


-- | Kalkulas postulitan kvanton da misiloj por mortigi monstron.
missiles :: HP -> Probability -> Maybe Quantity

missiles h p
  | fromProbability p == 0 = Nothing
  | fromProbability p == 1 = Nothing

  | otherwise = find cond [h ..]

  where
    cond = \ x -> fromProbability (probability h x) >= fromProbability p


accuracy = toProbability $ recip 7 -- ^ La precizeco de misilo-sukcesoj.