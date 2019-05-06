module CLI.Parser
  ( receive
  ) where


import Hakocalc.App.Command (Params (ParamsP, ParamsQ))
import Data.Semigroup ((<>))
import Options.Applicative (command, customExecParser, helper, info, progDesc, subparser)
import Options.Applicative.Builder (argument, auto, help, metavar, prefs, showHelpOnEmpty)
import Options.Applicative.Types (Parser, ParserInfo)

import qualified CLI.Text as T


receive :: IO Params

receive = customExecParser (prefs showHelpOnEmpty) parser


parser :: ParserInfo Params

parser = info (subparser $ p <> q) (progDesc T.descA)
  where
    p = command T.cmdnameP . info parserP $ progDesc T.descP
    q = command T.cmdnameQ . info parserQ $ progDesc T.descQ


parserP :: Parser Params

parserP = helper <*> (ParamsP <$> h <*> q)
  where
    h = argument auto $ help T.helpH <> metavar T.metavarH
    q = argument auto $ help T.helpQ <> metavar T.metavarQ


parserQ :: Parser Params

parserQ = helper <*> (ParamsQ <$> h <*> p)
  where
    h = argument auto $ help T.helpH <> metavar T.metavarH
    p = argument auto $ help T.helpP <> metavar T.metavarP