module Hakocalc.App.Command
  ( commandP
  , commandQ
  ) where


import Hakocalc.Entity.Defeat (HP, Probability, Quantity, missiles, probability)
import Text.Printf (printf)

commandP :: HP -> Quantity -> IO ()

commandP h q = responseProbability $ probability h q


commandQ :: HP -> Probability -> IO ()

commandQ h p = maybe notifyFailed responseQuantity $ missiles h p


responseQuantity :: Quantity -> IO ()

responseQuantity = printf "%d\n"


responseProbability :: Probability -> IO ()

responseProbability = printf "%.3f%%\n" . (read :: String -> Double) . show


notifyFailed :: IO ()

notifyFailed = putStrLn "Could not calculate."