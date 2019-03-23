{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.OutputMock where


import Control.Monad.State (State, modify)
import Hakocalc.Command (Output, notifyFailed, outputProbability, outputQuantity)
import Hakocalc.Entity.Defeat (Quantity)
import Hakocalc.Entity.Probability (Probability)


data OutputMock = OutputMock [Quantity] [Probability] [()] deriving (Eq, Show)


instance Output (State OutputMock) where
  outputQuantity q = modify
    (\ (OutputMock qs ps fs) -> OutputMock (q : qs) ps fs)

  outputProbability p = modify
    (\ (OutputMock qs ps fs) -> OutputMock qs (p : ps) fs)

  notifyFailed = modify
    (\ (OutputMock qs ps fs) -> OutputMock qs ps (() : fs))


initMock :: OutputMock

initMock = OutputMock [] [] []