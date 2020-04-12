module Hakocalc.Presenter.Response
  ( Environment
  , environment
  ) where


import Control.Lens ((^.))
import Hakocalc.Calculator.IPresenter (IPresenter, resultP, resultQ)
import Hakocalc.Math.Probability (fromProbability)
import Hakocalc.Presenter.Config
import Text.Printf (printf)


data Environment = Environment Config


instance IPresenter Environment where
  resultP (Environment cfg) rslt = printf (cfg ^. rsltP) $ val * 100
    where
      val = (fromRational :: Rational -> Double) $ fromProbability rslt

  resultQ (Environment cfg) rslt = case rslt of
    Just x -> printf (cfg ^. rsltQ) x

    _ -> printf (cfg ^. failQ)


environment :: Config -> Environment

environment = Environment