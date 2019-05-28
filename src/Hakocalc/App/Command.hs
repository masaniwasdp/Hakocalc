module Hakocalc.App.Command
  ( commandP
  , commandQ
  ) where


import Control.Lens ((^.))
import Hakocalc.Entity.Defeat (HP, Probability, Quantity, missiles, probability)
import Text.Printf (printf)

import qualified Hakocalc.App.CommandConfig as C


commandP :: C.CommandConfig -> HP -> Quantity -> IO ()

commandP c h q = printf fmt . (read :: String -> Double) . show $ probability h q
  where
    fmt = c ^. C.fmtP


commandQ :: C.CommandConfig -> HP -> Probability -> IO ()

commandQ c h p = maybe (printf fmt) (printf txt) $ missiles h p
  where
    fmt = c ^. C.fmtQ
    txt = c ^. C.txtF