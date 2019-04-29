-- |
-- Description : Modulo por efektivigi komandoj.
-- Copyright   : 2019 masaniwa
-- License     : MIT
--
module Hakocalc.Command
  ( Output
  , commandP
  , commandQ
  , notifyFailed
  , outputProbability
  , outputQuantity
  ) where


import Hakocalc.Entity.Defeat (HP, Probability, Quantity, missiles, probability)


-- |
class Monad m => Output m where
  -- |
  outputQuantity :: Quantity -> m ()

  -- |
  outputProbability :: Probability -> m ()

  -- |
  notifyFailed :: m ()


-- |
commandP :: Output m => HP -> Quantity -> m ()

commandP h q = outputProbability $ probability h q


-- |
commandQ :: Output m => HP -> Probability -> m ()

commandQ h p = maybe notifyFailed outputQuantity $ missiles h p