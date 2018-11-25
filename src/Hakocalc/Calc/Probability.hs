{-|
 - Description : Modulo de probablo.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Calc.Probability
  ( Probability
  , fromProbability
  , toProbability
  , toProbabilityJust
  )
  where


import Data.Maybe (fromJust)
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
