{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.OutputMock where


import Control.Monad.State (State, modify)
import Hakocalc.Command (Output, notifyFailed, outputProbability, outputQuantity)
import Hakocalc.Entity.Defeat (Probability, Quantity)


newtype OutputMock = OutputMock ([Quantity], [Probability], [()])


instance Eq OutputMock where
  (OutputMock lhs) == (OutputMock rhs) = lhs == rhs


instance Show OutputMock where
  show (OutputMock mock) = show mock


instance Output (State OutputMock) where
  outputQuantity q = modify $
    \ (OutputMock (qs, ps, fs)) -> OutputMock ((q : qs), ps, fs)

  outputProbability p = modify $
    \ (OutputMock (qs, ps, fs)) -> OutputMock (qs, (p : ps), fs)

  notifyFailed = modify $
    \ (OutputMock (qs, ps, fs)) -> OutputMock (qs, ps, (() : fs))


initMock :: OutputMock

initMock = OutputMock ([], [], [])