module Hakocalc.Command.IPresenter
  ( IPresenter
  , printP
  , printQ
  ) where


import Hakocalc.Command.DefeatProbability (Probability, Quantity)


class IPresenter a where
  printP :: a -> Probability -> IO ()

  printQ :: a -> Maybe Quantity -> IO ()