module Hakocalc.App.Command
  ( commandP
  , commandQ
  ) where


import Hakocalc.Entity.Defeat (HP, Probability, Quantity, missiles, probability)
import Text.Printf (printf)

import qualified Hakocalc.App.Define as D


commandP :: HP -> Quantity -> IO ()

commandP h q = responseProbability $ probability h q


commandQ :: HP -> Probability -> IO ()

commandQ h p = maybe notifyFailed responseQuantity $ missiles h p


responseQuantity :: Quantity -> IO ()

responseQuantity = printf D.responseFormatQ


responseProbability :: Probability -> IO ()

responseProbability = printf D.responseFormatP . (read :: String -> Double) . show


notifyFailed :: IO ()

notifyFailed = putStrLn D.notifyTextF