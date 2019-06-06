module Hakocalc.Command.Function
  ( functionP
  , functionQ
  ) where


import Control.Lens ((^.))
import Hakocalc.Entity.Defeat (HP, Probability, Quantity, missiles, probability)
import Hakocalc.Entity.Probability (fromProbability)
import Text.Printf (printf)

import qualified Hakocalc.Command.Config as C


functionP :: C.Config -> HP -> Quantity -> IO ()

functionP cfg h q = output . double $ probability h q
  where
    output = printf (cfg ^. C.rsltP)

    double = (fromRational :: Rational -> Double) . fromProbability


functionQ :: C.Config -> HP -> Probability -> IO ()

functionQ cfg h p = maybe output notify $ missiles h p
  where
    output = printf (cfg ^. C.rsltQ)

    notify = printf (cfg ^. C.failQ)