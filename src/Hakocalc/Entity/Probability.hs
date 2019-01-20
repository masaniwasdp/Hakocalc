{-|
 - Description : Modulo de probablo.
 - Copyright   : 2019 masaniwa
 - License     : MIT
 -}
module Hakocalc.Entity.Probability
  ( Probability
  , fromProbability
  , toProbability
  , toProbabilityJust
  ) where


import Data.Maybe (fromJust, isJust)
import Text.Read (readMaybe)


{-| Reprezentanta probablon. -}
newtype Probability = Prob Rational deriving (Eq, Ord)


instance Read Probability where
  readsPrec _ s = [(fromJust x, "") | isJust x]
    where
      x = toProbability
        . (/ 100)
        . toRational =<< (readMaybe s :: Maybe Double)


instance Show Probability where
  show = (show :: Double -> String)
    . fromRational
    . (* 100)
    . fromProbability


{-| Konvertas probablon al racia nombro. -}
fromProbability :: Probability -> Rational

fromProbability (Prob p) = p


{-| Konvertas racia nombro al probablo. -}
toProbability :: Rational -> Maybe Probability

toProbability p
  | p < 0 = Nothing
  | p > 1 = Nothing

  | otherwise = Just $ Prob p


{-| Konvertas racia nombro al probablo. -}
toProbabilityJust :: Rational -> Probability

toProbabilityJust = fromJust . toProbability
