module Hakocalc.Controller.CLI
  ( CLI
  , cli
  , execute
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.Controller.CLIConfig
import Hakocalc.Controller.Helper (defineArg, defineCmd)
import Options.Applicative (CommandFields, Mod, ParserInfo, info, progDesc, subparser)

import qualified Hakocalc.Calculator as Calculator


data CLI a = CLI CLIConfig (Calculator.Model a)


cli :: Calculator.IPresenter a => CLIConfig -> Calculator.Model a -> CLI a

cli = CLI


execute :: Calculator.IPresenter a => CLI a -> ParserInfo (IO ())

execute c@(CLI cfg _) = info (subparser xs) $ progDesc (cfg ^. descA)
  where
    xs = requestP c <> requestQ c


requestP :: Calculator.IPresenter a => CLI a -> Mod CommandFields (IO ())

requestP (CLI cfg calculator) = defineCmd action (cfg ^. nameP) (cfg ^. descP)
  where
    action = Calculator.calculateP calculator
      <$> defineArg (cfg ^. helpH) (cfg ^. metaH)
      <*> defineArg (cfg ^. helpQ) (cfg ^. metaQ)


requestQ :: Calculator.IPresenter a => CLI a -> Mod CommandFields (IO ())

requestQ (CLI cfg calculator) = defineCmd action (cfg ^. nameQ) (cfg ^. descQ)
  where
    action = Calculator.calculateQ calculator
      <$> defineArg (cfg ^. helpH) (cfg ^. metaH)
      <*> defineArg (cfg ^. helpP) (cfg ^. metaP)