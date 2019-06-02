module Hakocalc.App.Command
  ( commandP
  , commandQ
  ) where


import Control.Lens ((^.))
import Hakocalc.Entity.Defeat (HP, Probability, Quantity, missiles, probability)
import Text.Printf (printf)

import qualified Hakocalc.App.Config as C


commandP :: C.Config -> HP -> Quantity -> IO ()

commandP cfg h q = printf fmt . (read :: String -> Double) . show $ probability h q
  where
    fmt = cfg ^. C.formatP


commandQ :: C.Config -> HP -> Probability -> IO ()

commandQ cfg h p = maybe (printf fmt) (printf ntc) $ missiles h p
  where
    fmt = cfg ^. C.formatQ
    ntc = cfg ^. C.noticeQ