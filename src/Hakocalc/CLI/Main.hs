module Hakocalc.CLI.Main
  ( parser
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.App.Command.Main (commandP, commandQ)

import qualified Hakocalc.CLI.Config as C
import qualified Options.Applicative as A


parser :: C.Config -> A.ParserInfo (IO ())

parser cfg = A.info (A.subparser $ p <> q) $ A.progDesc (cfg ^. C.descA)
  where
    p = A.command (cfg ^. C.nameP) . A.info (parserP cfg) $ A.progDesc (cfg ^. C.descP)
    q = A.command (cfg ^. C.nameQ) . A.info (parserQ cfg) $ A.progDesc (cfg ^. C.descQ)


parserP :: C.Config -> A.Parser (IO ())

parserP cfg = A.helper <*> (c <$> h <*> q)
  where
    c = commandP (cfg ^. C.cmndC)
    h = argument (cfg ^. C.helpH) (cfg ^. C.metaH)
    q = argument (cfg ^. C.helpQ) (cfg ^. C.metaQ)


parserQ :: C.Config -> A.Parser (IO ())

parserQ cfg = A.helper <*> (c <$> h <*> p)
  where
    c = commandQ (cfg ^. C.cmndC)
    h = argument (cfg ^. C.helpH) (cfg ^. C.metaH)
    p = argument (cfg ^. C.helpP) (cfg ^. C.metaP)


argument :: Read a => String -> String -> A.Parser a

argument h m = A.argument A.auto $ A.help h <> A.metavar m