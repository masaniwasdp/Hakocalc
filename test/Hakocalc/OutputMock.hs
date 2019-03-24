{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.OutputMock where


import Control.Monad.State (State, execState, modify)
import Hakocalc.Command (Output, notifyFailed, outputProbability, outputQuantity)
import Hakocalc.Entity.Defeat (Probability, Quantity)


newtype OutputMock = OutputMock [OutputLog] deriving (Eq, Show)


instance Output (State OutputMock) where
  outputQuantity x = modify $ add (QLog x)

  outputProbability x = modify $ add (PLog x)

  notifyFailed = modify $ add FLog


data OutputLog = QLog Quantity | PLog Probability | FLog deriving (Eq, Show)


run :: State OutputMock () -> OutputMock

run a = execState a $ OutputMock []


add :: OutputLog -> OutputMock -> OutputMock

add x (OutputMock xs) = OutputMock $ xs ++ [x]