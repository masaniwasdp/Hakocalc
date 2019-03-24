{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.OutputLog where


import Control.Monad.State (State, modify)
import Hakocalc.Command (Output, notifyFailed, outputProbability, outputQuantity)
import Hakocalc.Entity.Defeat (Probability, Quantity)


type OutputLog = [LogData]


instance Output (State OutputLog) where
  outputQuantity q = modify (DataQ q :)

  outputProbability p = modify (DataP p :)

  notifyFailed = modify (DataF :)


data LogData = DataQ Quantity | DataP Probability | DataF deriving (Eq, Show)