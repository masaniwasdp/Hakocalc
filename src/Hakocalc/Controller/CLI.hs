module Hakocalc.Controller.CLI
  ( runCLI
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.Controller.CLIConfig
import Hakocalc.Controller.Helper (defineArg, defineCmd)
import Options.Applicative (CommandFields, Mod, ParserInfo, info, progDesc, subparser)

import qualified Hakocalc.Command as Command


runCLI :: Command.Presenter m => CLIConfig -> ParserInfo (m ())

runCLI cfg = info (subparser xs) $ progDesc (cfg ^. descA)
  where
    xs = requestP cfg <> requestQ cfg


requestP :: Command.Presenter m => CLIConfig -> Mod CommandFields (m ())

requestP cfg = defineCmd action (cfg ^. nameP) (cfg ^. descP)
  where
    action = Command.calculateP
      <$> defineArg (cfg ^. helpH) (cfg ^. metaH)
      <*> defineArg (cfg ^. helpQ) (cfg ^. metaQ)


requestQ :: Command.Presenter m => CLIConfig -> Mod CommandFields (m ())

requestQ cfg = defineCmd action (cfg ^. nameQ) (cfg ^. descQ)
  where
    action = Command.calculateQ
      <$> defineArg (cfg ^. helpH) (cfg ^. metaH)
      <*> defineArg (cfg ^. helpP) (cfg ^. metaP)