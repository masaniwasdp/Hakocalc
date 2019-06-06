module Hakocalc.Command.Main
  ( command
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.Command.Helper (defineArg, defineCmd)
import Options.Applicative (CommandFields, Mod, ParserInfo, info, progDesc, subparser)

import qualified Hakocalc.Command.Behavior as B
import qualified Hakocalc.Command.Config as C


command :: C.Config -> ParserInfo (IO ())

command cfg = info p $ progDesc (cfg ^. C.descA)
  where
    p = subparser $ commandP cfg <> commandQ cfg


commandP :: C.Config -> Mod CommandFields (IO ())

commandP cfg = defineCmd p (cfg ^. C.nameP) (cfg ^. C.descP)
  where
    p = B.commandP cfg
      <$> defineArg (cfg ^. C.helpH) (cfg ^. C.metaH)
      <*> defineArg (cfg ^. C.helpQ) (cfg ^. C.metaQ)


commandQ :: C.Config -> Mod CommandFields (IO ())

commandQ cfg = defineCmd p (cfg ^. C.nameQ) (cfg ^. C.descQ)
  where
    p = B.commandQ cfg
      <$> defineArg (cfg ^. C.helpH) (cfg ^. C.metaH)
      <*> defineArg (cfg ^. C.helpP) (cfg ^. C.metaP)