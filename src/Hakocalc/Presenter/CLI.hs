module Hakocalc.Presenter.CLI
  ( CLI
  , cli
  ) where


import Control.Lens ((^.))
import Hakocalc.Presenter.CLIConfig
import Text.Printf (printf)

import qualified Hakocalc.Command as Command


data CLI = CLI CLIConfig


instance Command.IPresenter CLI where
  printP (CLI cfg) rslt = printf (cfg ^. rsltP) fval
    where
      fval = (read $ show rslt) :: Double

  printQ (CLI cfg) rslt = case rslt of
    Just x -> printf (cfg ^. rsltQ) x

    _ -> printf (cfg ^. failQ)


cli :: CLIConfig -> CLI

cli = CLI