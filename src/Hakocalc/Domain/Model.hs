module Hakocalc.Domain.Model
  ( calcProbability
  , calcQuantity
  ) where


import Control.Lens ((^.))
import Hakocalc.Domain.Config (Config, failQ, rsltP, rsltQ)
import Hakocalc.Domain.DefeatProbability (HP, Probability, Quantity, missiles, probability)
import Hakocalc.Math.Probability (fromProbability)
import Text.Printf (printf)


calcProbability :: Config -> HP -> Quantity -> String

calcProbability c h q = output . double $ probability h q
  where
    output = printf (c ^. rsltP)

    double = (fromRational :: Rational -> Double) . fromProbability


calcQuantity :: Config -> HP -> Probability -> String

calcQuantity c h p = maybe output notify $ missiles h p
  where
    output = printf (c ^. rsltQ)

    notify = printf (c ^. failQ)