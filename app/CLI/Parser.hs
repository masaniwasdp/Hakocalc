module CLI.Parser
  ( parserP
  , parserQ
  ) where


import Data.Semigroup ((<>))
import Hakocalc.App.Command (commandP, commandQ)
import Options.Applicative (Parser, argument, auto, help, helper, metavar)

import qualified CLI.Define as D


parserP :: Parser (IO ())

parserP = helper <*> (commandP <$> h <*> q)
  where
    h = argument auto $ help D.helpH <> metavar D.metavarH
    q = argument auto $ help D.helpQ <> metavar D.metavarQ


parserQ :: Parser (IO ())

parserQ = helper <*> (commandQ <$> h <*> p)
  where
    h = argument auto $ help D.helpH <> metavar D.metavarH
    p = argument auto $ help D.helpP <> metavar D.metavarP