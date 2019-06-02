-- |
-- Description : Modulo de trakti probablo.
-- Copyright   : 2019 masaniwa
-- License     : MIT
--
module Hakocalc.App.Entity.Probability
  ( Probability
  , fromProbability
  , toProbability
  , toProbabilityMaybe
  ) where


import Data.Maybe (fromJust, isJust)
import Text.Read (readMaybe)


-- | Reprezentanta probablon.
newtype Probability = Probability Rational deriving Eq


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

fromProbability (Probability p) = p


-- | Konvertas racia nombro al probablo.
toProbabilityMaybe :: Rational -> Maybe Probability

toProbabilityMaybe p
  | p < 0 = Nothing
  | p > 1 = Nothing

  | otherwise = Just $ Probability p


-- | Konvertas racia nombro al probablo.
toProbability :: Rational -> Probability

toProbability = fromJust . toProbabilityMaybe
