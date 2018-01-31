{-|
 - Description : Modulo de komuna probablo kalkulo.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Probability.Common
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


{-| Reprezentanta probablon. -}
newtype Probability = Probability' Rational deriving (Eq, Ord)

instance Read Probability
  where
    readsPrec _ s = case res of
      Just x -> [(x, "")]

      Nothing -> []

      where
        res = case reads s of
          [(x, "")] -> toProbability . (/ 100) . toRational $ (x :: Double)

          _ -> Nothing

instance Show Probability
  where
    show x = show (fromRational . (* 100) . fromProbability $ x :: Double)


{-| Konvertas probablon al racia nombro. -}
fromProbability
  :: Probability -- ^ Probablo kiu estos konvertata.
  -> Rational    -- ^ Racia nombro konvertita de probablo.

fromProbability (Probability' p) = p


{-| Konvertas racia nombro al probablo. -}
toProbability
  :: Rational          -- ^ Racian nombro kiu estos konvertata.
  -> Maybe Probability -- ^ Probablo kovertita de racia nombro.

toProbability p
  | p < 0 || p > 1 = Nothing

  | otherwise = Just . Probability' $ p


{-| Konvertas racia nombro al probablo. -}
toProbabilityJust
  :: Rational    -- ^ Racian nombro kiu estos konvertata.
  -> Probability -- ^ Probablo kovertita de racia nombro.

toProbabilityJust = fromJust . toProbability


{-| Kalkulas tutan nombron de kombinajo. -}
combination
  :: Natural -- ^ Nombro de tuta okazaĵoj.
  -> Natural -- ^ Nombro de okazaĵoj por elekti.
  -> Natural -- ^ Tuta nonbro de kombinajo.

combination n r
  | n >= r = product [(n - r + 1) .. n] `div` product [1 .. r]

  | otherwise = 0


{-| Kalkulas probablon ripetitaj provoj. -}
repeated
  :: Probability -- ^ Probablo de provo sukceso.
  -> Natural     -- ^ Nombro da fojoj por ripeti provon.
  -> Natural     -- ^ K kiu nombro da fojoj de provo sukceso.
  -> Probability -- ^ Probablo, ke provo sukcesos K fojojn.

repeated p n k = toProbabilityJust prob
  where
    prob
      | n >= k = (* c) . toRational $ combination n k

      | otherwise = 0

    c = fromProbability p ^ k * (1 - fromProbability p) ^ (n - k)
