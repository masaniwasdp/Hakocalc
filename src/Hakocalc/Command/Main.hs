module Hakocalc.Command.Main
  ( command
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))

import qualified Hakocalc.Command.Behavior as B
import qualified Hakocalc.Command.Config as C
import qualified Options.Applicative as A


command :: C.Config -> A.ParserInfo (IO ())

command cfg = A.info p $ A.progDesc (cfg ^. C.descA)
  where
    p = A.subparser $ (commandP cfg) <> (commandQ cfg)


commandP :: C.Config -> A.Mod A.CommandFields (IO ())

commandP cfg = defineCmd p (cfg ^. C.nameP) (cfg ^. C.descP)
  where
    p = (B.commandP cfg)
      <$> (defineArg (cfg ^. C.helpH) (cfg ^. C.metaH))
      <*> (defineArg (cfg ^. C.helpQ) (cfg ^. C.metaQ))


commandQ :: C.Config -> A.Mod A.CommandFields (IO ())

commandQ cfg = defineCmd p (cfg ^. C.nameQ) (cfg ^. C.descQ)
  where
    p = (B.commandQ cfg)
      <$> (defineArg (cfg ^. C.helpH) (cfg ^. C.metaH))
      <*> (defineArg (cfg ^. C.helpP) (cfg ^. C.metaP))


defineCmd :: A.Parser a -> String -> String -> A.Mod A.CommandFields a

defineCmd p n d = A.command n . A.info (A.helper <*> p) $ A.progDesc d


defineArg :: Read a => String -> String -> A.Parser a

defineArg h m = A.argument A.auto $ A.help h <> A.metavar m