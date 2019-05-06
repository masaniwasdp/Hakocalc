module CLI.Runner
  ( run
  ) where


import CLI.Parser (parserP, parserQ)
import Control.Monad (join)
import Data.Semigroup ((<>))
import Options.Applicative (ParserInfo, command, customExecParser, info, progDesc, subparser)
import Options.Applicative.Builder (prefs, showHelpOnEmpty)

import qualified CLI.Define as D


run :: IO ()

run = join $ customExecParser (prefs showHelpOnEmpty) parser


parser :: ParserInfo (IO ())

parser = info (subparser $ p <> q) (progDesc D.descA)
  where
    p = command D.cmdnameP . info parserP $ progDesc D.descP
    q = command D.cmdnameQ . info parserQ $ progDesc D.descQ