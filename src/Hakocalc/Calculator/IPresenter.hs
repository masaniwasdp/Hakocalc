module Hakocalc.Calculator.IPresenter
  ( IPresenter
  , resultP
  , resultQ
  ) where


import Hakocalc.Calculator.DefeatProbability (Probability, Quantity)


class IPresenter a where
  resultP :: a -> Probability -> IO ()

  resultQ :: a -> Maybe Quantity -> IO ()