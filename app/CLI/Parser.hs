module CLI.Parser
  ( receive
  ) where


import Control.Monad (join)
import Data.Semigroup ((<>))
import Hakocalc.App.Command (commandP, commandQ)
import Options.Applicative (command, customExecParser, helper, info, progDesc, subparser)
import Options.Applicative.Builder (argument, auto, help, metavar, prefs, showHelpOnEmpty)
import Options.Applicative.Types (Parser, ParserInfo)

import qualified CLI.Text as T


receive :: IO ()

receive = join $ customExecParser (prefs showHelpOnEmpty) parser


parser :: ParserInfo (IO ())

parser = info (subparser $ p <> q) (progDesc T.descA)
  where
    p = command T.cmdnameP . info parserP $ progDesc T.descP
    q = command T.cmdnameQ . info parserQ $ progDesc T.descQ


parserP :: Parser (IO ())

parserP = helper <*> (commandP <$> h <*> q)
  where
    h = argument auto $ help T.helpH <> metavar T.metavarH
    q = argument auto $ help T.helpQ <> metavar T.metavarQ


parserQ :: Parser (IO ())

parserQ = helper <*> (commandQ <$> h <*> p)
  where
    h = argument auto $ help T.helpH <> metavar T.metavarH
    p = argument auto $ help T.helpP <> metavar T.metavarP