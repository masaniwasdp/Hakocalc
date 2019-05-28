module CLI.Parser
  ( parser
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.App.Command (commandP, commandQ)

import qualified CLI.ParserConfig as P
import qualified Options.Applicative as A


parser :: P.ParserConfig -> A.ParserInfo (IO ())

parser c = A.info (A.subparser $ p <> q) $ A.progDesc (c ^. P.descA)
  where
    p = A.command (c ^. P.nameP) . A.info (parserP c) $ A.progDesc (c ^. P.descP)
    q = A.command (c ^. P.nameQ) . A.info (parserQ c) $ A.progDesc (c ^. P.descQ)


parserP :: P.ParserConfig -> A.Parser (IO ())

parserP cfg = A.helper <*> (c <$> h <*> q)
  where
    c = commandP (cfg ^. P.cmndC)
    h = A.argument A.auto $ A.help (cfg ^. P.helpH) <> A.metavar (cfg ^. P.metaH)
    q = A.argument A.auto $ A.help (cfg ^. P.helpQ) <> A.metavar (cfg ^. P.metaQ)


parserQ :: P.ParserConfig -> A.Parser (IO ())

parserQ cfg = A.helper <*> (c <$> h <*> p)
  where
    c = commandQ (cfg ^. P.cmndC)
    h = A.argument A.auto $ A.help (cfg ^. P.helpH) <> A.metavar (cfg ^. P.metaH)
    p = A.argument A.auto $ A.help (cfg ^. P.helpP) <> A.metavar (cfg ^. P.metaP)