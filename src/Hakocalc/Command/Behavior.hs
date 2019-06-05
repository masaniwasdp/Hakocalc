module Hakocalc.Command.Behavior
  ( commandP
  , commandQ
  ) where


import Control.Lens ((^.))
import Hakocalc.Command.Config (Config, failQ, rsltP, rsltQ)
import Hakocalc.Entity.Defeat (HP, Probability, Quantity, missiles, probability)
import Hakocalc.Entity.Probability (fromProbability)
import Text.Printf (printf)


commandP :: Config -> HP -> Quantity -> IO ()

commandP cfg h q = printf r . toDouble $ probability h q
  where
    r = cfg ^. rsltP


commandQ :: Config -> HP -> Probability -> IO ()

commandQ cfg h p = maybe (printf r) (printf f) $ missiles h p
  where
    r = cfg ^. rsltQ
    f = cfg ^. failQ


toDouble :: Probability -> Double

toDouble = fromRational . fromProbability