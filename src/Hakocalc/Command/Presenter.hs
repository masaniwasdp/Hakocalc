module Hakocalc.Command.Presenter
  ( Presenter
  , printP
  , printQ
  ) where


import Hakocalc.Command.DefeatProbability (Probability, Quantity)


class Monad m => Presenter m where
  printP :: Probability -> m ()

  printQ :: Maybe Quantity -> m ()