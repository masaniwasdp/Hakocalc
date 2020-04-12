module Hakocalc.Command.IPresenter
  ( IPresenter
  , resultP
  , resultQ
  ) where


import Hakocalc.Command.DefeatProbability (Probability, Quantity)


class IPresenter a where
  resultP :: a -> Probability -> IO ()

  resultQ :: a -> Maybe Quantity -> IO ()