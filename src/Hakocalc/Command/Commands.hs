module Hakocalc.Command.Commands
  ( commands
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.Command.Function (functionP, functionQ)
import Hakocalc.Command.Helper (defineArg, defineCmd)
import Options.Applicative (CommandFields, Mod, ParserInfo, info, progDesc, subparser)

import qualified Hakocalc.Command.Config as C


commands :: C.Config -> ParserInfo (IO ())

commands cfg = info (subparser xs) $ progDesc (cfg ^. C.descA)
  where
    xs = commandP cfg <> commandQ cfg


commandP :: C.Config -> Mod CommandFields (IO ())

commandP cfg = defineCmd p (cfg ^. C.nameP) (cfg ^. C.descP)
  where
    p = functionP cfg
      <$> defineArg (cfg ^. C.helpH) (cfg ^. C.metaH)
      <*> defineArg (cfg ^. C.helpQ) (cfg ^. C.metaQ)


commandQ :: C.Config -> Mod CommandFields (IO ())

commandQ cfg = defineCmd p (cfg ^. C.nameQ) (cfg ^. C.descQ)
  where
    p = functionQ cfg
      <$> defineArg (cfg ^. C.helpH) (cfg ^. C.metaH)
      <*> defineArg (cfg ^. C.helpP) (cfg ^. C.metaP)