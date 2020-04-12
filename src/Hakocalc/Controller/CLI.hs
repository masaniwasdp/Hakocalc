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

import qualified Hakocalc.Command as Command


data CLI a = CLI CLIConfig (Command.Model a)


cli :: Command.IPresenter a => CLIConfig -> Command.Model a -> CLI a

cli = CLI


execute :: Command.IPresenter a => CLI a -> ParserInfo (IO ())

execute c@(CLI cfg _) = info (subparser xs) $ progDesc (cfg ^. descA)
  where
    xs = requestP c <> requestQ c


requestP :: Command.IPresenter a => CLI a -> Mod CommandFields (IO ())

requestP (CLI cfg cmd) = defineCmd action (cfg ^. nameP) (cfg ^. descP)
  where
    action = Command.calculateP cmd
      <$> defineArg (cfg ^. helpH) (cfg ^. metaH)
      <*> defineArg (cfg ^. helpQ) (cfg ^. metaQ)


requestQ :: Command.IPresenter a => CLI a -> Mod CommandFields (IO ())

requestQ (CLI cfg cmd) = defineCmd action (cfg ^. nameQ) (cfg ^. descQ)
  where
    action = Command.calculateQ cmd
      <$> defineArg (cfg ^. helpH) (cfg ^. metaH)
      <*> defineArg (cfg ^. helpP) (cfg ^. metaP)