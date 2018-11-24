{-|
 - Description : Modulo de komuna probablo kalkulo.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Calc.Common
  ( Probability
  , combination
  , fromProbability
  , toProbability
  , toProbabilityJust
  , repeated
  )
  where


import Data.Maybe (fromJust)
import Numeric.Natural (Natural)
import Text.Read (readMaybe)


{-| Reprezentanta probablon. -}
newtype Probability = Probability' Rational deriving (Eq, Ord)

instance Read Probability
  where
    readsPrec _ s = maybe [] (\ x -> [(x, "")]) p
      where
        p = toProbability
          . (/ 100)
          . toRational =<< (readMaybe s :: Maybe Double)

instance Show Probability
  where
    show = (show :: Double -> String)
      . fromRational
      . (* 100)
      . fromProbability


{-| Konvertas probablon al racia nombro. -}
fromProbability :: Probability -> Rational

fromProbability (Probability' p) = p


{-| Konvertas racia nombro al probablo. -}
toProbability :: Rational -> Maybe Probability

toProbability p
  | p < 0 = Nothing
  | p > 1 = Nothing

  | otherwise = Just $ Probability' p


{-| Konvertas racia nombro al probablo. -}
toProbabilityJust :: Rational -> Probability

toProbabilityJust = fromJust . toProbability


{-| Kalkulas tutan nombron de kombinajo. -}
combination
  :: Natural -- ^ Nombro de tuta okazaĵoj.
  -> Natural -- ^ Nombro de okazaĵoj por elekti.
  -> Natural -- ^ Tuta nonbro de kombinajo.

combination n r
  | n < r = 0

  | otherwise = product [n - r + 1 .. n] `div` product [1 .. r]


{-| Kalkulas probablon ripetitaj provoj. -}
repeated
  :: Probability -- ^ Probablo de provo sukceso.
  -> Natural     -- ^ Nombro da fojoj por ripeti provon.
  -> Natural     -- ^ K kiu nombro da fojoj de provo sukceso.
  -> Probability -- ^ Probablo, ke provo sukcesos K fojojn.

repeated p n k = toProbabilityJust prob
  where
    prob
      | n < k = 0

      | otherwise = (* coef) . toRational $ combination n k

    coef = fromProbability p ^ k * (1 - fromProbability p) ^ (n - k)
