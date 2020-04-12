module Hakocalc.Presenter.CLI
  ( CLI
  , cli
  ) where


import Control.Lens ((^.))
import Hakocalc.Math.Probability (fromProbability)
import Hakocalc.Presenter.CLIConfig
import Text.Printf (printf)

import qualified Hakocalc.Command as Command


data CLI = CLI CLIConfig


instance Command.IPresenter CLI where
  resultP (CLI cfg) rslt = printf (cfg ^. rsltP) $ val * 100
    where
      val = (fromRational :: Rational -> Double) $ fromProbability rslt

  resultQ (CLI cfg) rslt = case rslt of
    Just x -> printf (cfg ^. rsltQ) x

    _ -> printf (cfg ^. failQ)


cli :: CLIConfig -> CLI

cli = CLI