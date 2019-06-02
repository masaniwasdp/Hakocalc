module Hakocalc.App.Command.Main
  ( commandP
  , commandQ
  ) where


import Control.Lens ((^.))
import Hakocalc.App.Entity.Defeat (HP, Probability, Quantity, missiles, probability)
import Text.Printf (printf)

import qualified Hakocalc.App.Command.Config as C


commandP :: C.Config -> HP -> Quantity -> IO ()

commandP cfg h q = printf f . (read :: String -> Double) . show $ probability h q
  where
    f = cfg ^. C.formatP


commandQ :: C.Config -> HP -> Probability -> IO ()

commandQ cfg h p = maybe (printf f) (printf n) $ missiles h p
  where
    f = cfg ^. C.formatQ
    n = cfg ^. C.noticeQ