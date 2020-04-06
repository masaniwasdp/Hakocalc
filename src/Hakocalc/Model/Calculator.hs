module Hakocalc.Model.Calculator
  ( calcProbability
  , calcQuantity
  ) where


import Control.Lens ((^.))
import Hakocalc.Math.Probability (fromProbability)
import Hakocalc.Model.Config (Config, failQ, rsltP, rsltQ)
import Hakocalc.Service.Defeat (HP, Probability, Quantity, missiles, probability)
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