module Hakocalc.CLI.Parser
  ( parser
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.App.Command (commandP, commandQ)

import qualified Hakocalc.CLI.Config as C
import qualified Options.Applicative as A


parser :: C.Config -> A.ParserInfo (IO ())

parser c = A.info (A.subparser $ p <> q) $ A.progDesc (c ^. C.descA)
  where
    p = A.command (c ^. C.nameP) . A.info (parserP c) $ A.progDesc (c ^. C.descP)
    q = A.command (c ^. C.nameQ) . A.info (parserQ c) $ A.progDesc (c ^. C.descQ)


parserP :: C.Config -> A.Parser (IO ())

parserP c = A.helper <*> (p <$> h <*> q)
  where
    p = commandP (c ^. C.cmndC)
    h = argument (c ^. C.helpH) (c ^. C.metaH)
    q = argument (c ^. C.helpQ) (c ^. C.metaQ)


parserQ :: C.Config -> A.Parser (IO ())

parserQ c = A.helper <*> (q <$> h <*> p)
  where
    q = commandQ (c ^. C.cmndC)
    h = argument (c ^. C.helpH) (c ^. C.metaH)
    p = argument (c ^. C.helpP) (c ^. C.metaP)


argument :: Read a => String -> String -> A.Parser a

argument h m = A.argument A.auto $ A.help h <> A.metavar m