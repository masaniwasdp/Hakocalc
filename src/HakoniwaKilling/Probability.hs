{-|
 - Description : La modulo de probablo kalkulo.
 - Copyright   : 2017 masaniwa
 -}

module HakoniwaKilling.Probability
    ( Probability
    , combination
    , fromProbability
    , toProbability
    , repeated ) where

import Data.Maybe (fromJust)
import Numeric.Natural (Natural)

{-| Tipo reprezentanta probablon. -}
newtype Probability = Probability' Rational deriving (Eq, Ord, Show)


{-| Konvertas probablon al racia nombro. -}
fromProbability :: Probability -- ^ Probablo kiu estos konvertata.
                -> Rational    -- ^ Racia nombro konvertita de probablo.

fromProbability (Probability' p) = p


{-| Konvertas racia nombro al probablo. -}
toProbability :: Rational          -- ^ Racian nombro kiu estos konvertata.
              -> Maybe Probability -- ^ Probablo kovertita de racia nombro.

toProbability p
    | p < 0 || p > 1 = Nothing
    | otherwise      = Just . Probability' $ p


{-| Kalkulas tutan nombron de kombinajo. -}
combination :: Natural -- ^ Nombro de tuta okazaĵoj.
            -> Natural -- ^ Nombro de okazaĵoj por elekti.
            -> Natural -- ^ Tuta nonbro de kombinajo.

combination n r = product [(n - r + 1) .. n] `div` product [1 .. r]


{-| Kalkulas probablon ripetitaj provoj. -}
repeated :: Probability -- ^ Probablo de provo sukceso.
         -> Natural     -- ^ Nombro da fojoj por ripeti provon.
         -> Natural     -- ^ K kiu nombro da fojoj de provo sukceso.
         -> Probability -- ^ Probablo, ke provo sukcesos K fojojn.

repeated p n k = fromJust . toProbability . (* x) . toRational $ c where
    x = q ^ k * (1 - q) ^ (n - k)
    c = combination n k
    q = fromProbability p
