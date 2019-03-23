-- |
-- Description : Modulo de trakti probablo.
-- Copyright   : 2019 masaniwa
-- License     : MIT
--

module Hakocalc.Entity.Probability
  ( Probability
  , fromProbability
  , toProbability
  , toProbabilityMaybe
  ) where


import Data.Maybe (fromJust, isJust)
import Text.Read (readMaybe)


-- | Reprezentanta probablon.
newtype Probability = Prob Rational deriving Eq


instance Read Probability where
  readsPrec _ s = [(fromJust x, "") | isJust x]
    where
      x = toProbabilityMaybe
        . (/ 100)
        . toRational =<< (readMaybe s :: Maybe Double)


instance Show Probability where
  show = (show :: Double -> String)
    . fromRational
    . (* 100)
    . fromProbability


-- | Konvertas probablon al racia nombro.
fromProbability :: Probability -> Rational

fromProbability (Prob p) = p


-- | Konvertas racia nombro al probablo.
toProbabilityMaybe :: Rational -> Maybe Probability

toProbabilityMaybe p
  | p < 0 = Nothing
  | p > 1 = Nothing

  | otherwise = Just $ Prob p


-- | Konvertas racia nombro al probablo.
toProbability :: Rational -> Probability

toProbability = fromJust . toProbabilityMaybe
