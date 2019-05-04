module Command where


import Hakocalc.Entity.Defeat (Probability, Quantity, missiles, probability)
import Params (Params (ParamsP, ParamsQ))
import Text.Printf (printf)


command :: Params -> IO ()

command (ParamsP h q) = responseProbability $ probability h q

command (ParamsQ h p) = maybe notifyFailed responseQuantity $ missiles h p


responseQuantity :: Quantity -> IO ()

responseQuantity = printf "%d\n"


responseProbability :: Probability -> IO ()

responseProbability = (printf "%.3f%%\n") . (read :: String -> Double) . show


notifyFailed :: IO ()

notifyFailed = putStrLn "Could not calculate."