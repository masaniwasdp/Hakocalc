module Hakocalc.App.Command.Main
  ( commandP
  , commandQ
  ) where


import Control.Lens ((^.))
import Hakocalc.App.Entity.Defeat (HP, Probability, Quantity, missiles, probability)
import Text.Printf (printf)

import qualified Hakocalc.App.Command.Config as C


commandP :: C.Config -> HP -> Quantity -> IO ()

commandP cfg h q = printf fmt . (read :: String -> Double) . show $ probability h q
  where
    fmt = cfg ^. C.formatP


commandQ :: C.Config -> HP -> Probability -> IO ()

commandQ cfg h p = maybe (printf fmt) (printf ntc) $ missiles h p
  where
    fmt = cfg ^. C.formatQ
    ntc = cfg ^. C.noticeQ