module Hakocalc.Calculator.Model
  ( calculateP
  , calculateQ
  ) where


import Control.Lens ((^.))
import Hakocalc.Calculator.Config
import Hakocalc.Calculator.DefeatProbability (HP, Probability, Quantity, missiles, probability)
import Hakocalc.Math.Probability (fromProbability)
import Text.Printf (printf)


calculateP :: Config -> HP -> Quantity -> String

calculateP cfg h q = output . double $ probability h q
  where
    output = printf (cfg ^. rsltP)

    double = (fromRational :: Rational -> Double) . fromProbability


calculateQ :: Config -> HP -> Probability -> String

calculateQ cfg h p = maybe output notify $ missiles h p
  where
    output = printf (cfg ^. rsltQ)

    notify = printf (cfg ^. failQ)