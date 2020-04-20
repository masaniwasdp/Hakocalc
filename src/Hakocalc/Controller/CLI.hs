module Hakocalc.Controller.CLI
  ( runCLI
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.Controller.CLIConfig
import Hakocalc.Controller.Helper (defineArg, defineCmd)
import Options.Applicative (CommandFields, Mod, ParserInfo, info, progDesc, subparser)

import qualified Hakocalc.Command as Command


runCLI :: (Command.Presenter m, Command.Model a) => CLIConfig -> a -> ParserInfo (m ())

runCLI cfg mdl = info (subparser xs) $ progDesc (cfg ^. descA)
  where
    xs = requestP cfg mdl <> requestQ cfg mdl


requestP :: (Command.Presenter m, Command.Model a) => CLIConfig -> a -> Mod CommandFields (m ())

requestP cfg mdl = defineCmd action (cfg ^. nameP) (cfg ^. descP)
  where
    action = Command.calculateP mdl
      <$> defineArg (cfg ^. helpH) (cfg ^. metaH)
      <*> defineArg (cfg ^. helpQ) (cfg ^. metaQ)


requestQ :: (Command.Presenter m, Command.Model a) => CLIConfig -> a -> Mod CommandFields (m ())

requestQ cfg mdl = defineCmd action (cfg ^. nameQ) (cfg ^. descQ)
  where
    action = Command.calculateQ mdl
      <$> defineArg (cfg ^. helpH) (cfg ^. metaH)
      <*> defineArg (cfg ^. helpP) (cfg ^. metaP)