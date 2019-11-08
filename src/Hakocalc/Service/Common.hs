-- |
-- Description : Modulo de komuna probablo kalkulo.
-- Copyright   : 2019 masaniwa
-- License     : MIT
--
module Hakocalc.Service.Common
  ( combination
  , repeated
  ) where


import Hakocalc.Entity.Probability (Probability, fromProbability, toProbability)
import Numeric.Natural (Natural)


-- | Kalkulas tutan nombron de kombinajo.
combination
  :: Natural -- ^ Nombro de tuta okazaĵoj.
  -> Natural -- ^ Nombro de okazaĵoj por elekti.
  -> Natural -- ^ Tuta nonbro de kombinajo.

combination n r
  | n < r = 0

  | otherwise = product [n - r + 1 .. n] `div` product [1 .. r]


-- | Kalkulas probablon ripetitaj provoj.
repeated
  :: Probability -- ^ Probablo de provo sukceso.
  -> Natural     -- ^ Nombro da fojoj por ripeti provon.
  -> Natural     -- ^ K kiu nombro da fojoj de provo sukceso.
  -> Probability -- ^ Probablo, ke provo sukcesos K fojojn.

repeated p n k = toProbability prob
  where
    prob
      | n < k = 0

      | otherwise = (* coef) . toRational $ combination n k

    coef = fromProbability p ^ k * (1 - fromProbability p) ^ (n - k)
