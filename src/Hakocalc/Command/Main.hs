module Hakocalc.Command.Main
  ( command
  ) where


import Control.Lens ((^.))
import Hakocalc.Command.Config (Config, formatP, formatQ, noticeQ)
import Hakocalc.Command.Params (Params (ParamsP, ParamsQ))
import Hakocalc.Entity.Defeat (missiles, probability)
import Hakocalc.Entity.Probability (Probability, fromProbability)
import Text.Printf (printf)


command :: Config -> Params -> IO ()

command cfg (ParamsP h q) = printf f . toDouble $ probability h q
  where
    f = cfg ^. formatP

command cfg (ParamsQ h p) = maybe (printf f) (printf n) $ missiles h p
  where
    f = cfg ^. formatQ
    n = cfg ^. noticeQ


toDouble :: Probability -> Double

toDouble = fromRational . fromProbability