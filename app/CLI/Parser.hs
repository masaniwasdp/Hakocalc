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

parserP c = A.helper <*> (p <$> h <*> q)
  where
    p = commandP (c ^. P.cmndC)
    h = argument (c ^. P.helpH) (c ^. P.metaH)
    q = argument (c ^. P.helpQ) (c ^. P.metaQ)


parserQ :: P.ParserConfig -> A.Parser (IO ())

parserQ c = A.helper <*> (q <$> h <*> p)
  where
    q = commandQ (c ^. P.cmndC)
    h = argument (c ^. P.helpH) (c ^. P.metaH)
    p = argument (c ^. P.helpP) (c ^. P.metaP)


argument :: Read a => String -> String -> A.Parser a

argument h m = A.argument A.auto $ A.help h <> A.metavar m