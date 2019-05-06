module Hakocalc.App.Command
  ( Params (ParamsP, ParamsQ)
  , execute
  ) where


import Hakocalc.Entity.Defeat (HP, Probability, Quantity, missiles, probability)
import Text.Printf (printf)

import qualified Hakocalc.App.Define as D


data Params = ParamsP HP Quantity | ParamsQ HP Probability


execute :: Params -> IO ()

execute (ParamsP h q) = responseProbability $ probability h q

execute (ParamsQ h p) = maybe notifyFailed responseQuantity $ missiles h p


responseQuantity :: Quantity -> IO ()

responseQuantity = printf D.responseFormatQ


responseProbability :: Probability -> IO ()

responseProbability = printf D.responseFormatP . (read :: String -> Double) . show


notifyFailed :: IO ()

notifyFailed = putStrLn D.notifyTextF