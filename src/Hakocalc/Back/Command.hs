module Hakocalc.Back.Command
  ( probability
  , quantity
  ) where


import Control.Lens ((^.))
import Hakocalc.Back.Config (Config, failQ, rsltP, rsltQ)
import Hakocalc.Math.Probability (fromProbability)
import Text.Printf (printf)

import qualified Hakocalc.Back.DefeatProbability as DP


probability :: Config -> DP.HP -> DP.Quantity -> String

probability cfg h q = output . double $ DP.probability h q
  where
    output = printf (cfg ^. rsltP)

    double = (fromRational :: Rational -> Double) . fromProbability


quantity :: Config -> DP.HP -> DP.Probability -> String

quantity cfg h p = maybe output notify $ DP.missiles h p
  where
    output = printf (cfg ^. rsltQ)

    notify = printf (cfg ^. failQ)