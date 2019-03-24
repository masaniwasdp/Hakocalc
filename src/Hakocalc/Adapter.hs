{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

-- |
-- Description : Modulo por adaptiĝi komandoj al IO.
-- Copyright   : 2019 masaniwa
-- License     : MIT
--
module Hakocalc.Adapter () where


import Hakocalc.Command (Output, notifyFailed, outputProbability, outputQuantity)
import Text.Printf (printf)


instance Output IO where
  outputQuantity q = printf quantityFormat q

  outputProbability p = printf probabilityFormat x
    where
      x = (read :: String -> Double) $ show p

  notifyFailed = putStrLn failedMessage


quantityFormat = "%d\n" -- ^

probabilityFormat = "%.3f%%\n" -- ^

failedMessage = "Couldn't calculate." -- ^