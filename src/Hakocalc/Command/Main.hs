module Hakocalc.Command.Main
  ( command
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))

import qualified Hakocalc.Command.Behavior as B
import qualified Hakocalc.Command.Config as C
import qualified Options.Applicative as A


command :: C.Config -> A.ParserInfo (IO ())

command cfg = A.info (A.subparser $ p <> q) $ A.progDesc (cfg ^. C.descA)
  where
    p = A.command (cfg ^. C.nameP) . A.info (commandP cfg) $ A.progDesc (cfg ^. C.descP)
    q = A.command (cfg ^. C.nameQ) . A.info (commandQ cfg) $ A.progDesc (cfg ^. C.descQ)


commandP :: C.Config -> A.Parser (IO ())

commandP cfg = A.helper <*> (c <$> h <*> q)
  where
    c = B.commandP cfg
    h = defineArg (cfg ^. C.helpH) (cfg ^. C.metaH)
    q = defineArg (cfg ^. C.helpQ) (cfg ^. C.metaQ)


commandQ :: C.Config -> A.Parser (IO ())

commandQ cfg = A.helper <*> (c <$> h <*> p)
  where
    c = B.commandQ cfg
    h = defineArg (cfg ^. C.helpH) (cfg ^. C.metaH)
    p = defineArg (cfg ^. C.helpP) (cfg ^. C.metaP)


defineArg :: Read a => String -> String -> A.Parser a

defineArg h m = A.argument A.auto $ A.help h <> A.metavar m