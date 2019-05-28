module CLI.Parser
  ( parser
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.App.Command (commandP, commandQ)

import qualified CLI.ParserConfig as P
import qualified Options.Applicative as O


parser :: P.ParserConfig -> O.ParserInfo (IO ())

parser c = O.info (O.subparser $ p <> q) $ O.progDesc (c ^. P.descA)
  where
    p = O.command (c ^. P.nameP) . O.info (parserP c) $ O.progDesc (c ^. P.descP)
    q = O.command (c ^. P.nameQ) . O.info (parserQ c) $ O.progDesc (c ^. P.descQ)


parserP :: P.ParserConfig -> O.Parser (IO ())

parserP cfg = O.helper <*> (c <$> h <*> q)
  where
    c = commandP (cfg ^. P.cmndC)
    h = O.argument O.auto $ O.help (cfg ^. P.helpH) <> O.metavar (cfg ^. P.metaH)
    q = O.argument O.auto $ O.help (cfg ^. P.helpQ) <> O.metavar (cfg ^. P.metaQ)


parserQ :: P.ParserConfig -> O.Parser (IO ())

parserQ cfg = O.helper <*> (c <$> h <*> p)
  where
    c = commandQ (cfg ^. P.cmndC)
    h = O.argument O.auto $ O.help (cfg ^. P.helpH) <> O.metavar (cfg ^. P.metaH)
    p = O.argument O.auto $ O.help (cfg ^. P.helpP) <> O.metavar (cfg ^. P.metaP)