module CLI.Command
  ( execute
  ) where


import CLI.Params (Params (ParamsP, ParamsQ))
import Hakocalc.Entity.Defeat (Probability, Quantity, missiles, probability)
import Text.Printf (printf)

import qualified CLI.Text as T


execute :: Params -> IO ()

execute (ParamsP h q) = responseProbability $ probability h q

execute (ParamsQ h p) = maybe notifyFailed responseQuantity $ missiles h p


responseQuantity :: Quantity -> IO ()

responseQuantity = printf T.fmtresQ


responseProbability :: Probability -> IO ()

responseProbability = printf T.fmtresP . (read :: String -> Double) . show


notifyFailed :: IO ()

notifyFailed = putStrLn T.txtnotiF