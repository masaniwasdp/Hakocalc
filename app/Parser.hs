{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Parser where


import Data.Semigroup ((<>))
import Hakocalc.Adapter ()
import Hakocalc.Command (commandP, commandQ)
import Options.Applicative (command, helper, info, progDesc, subparser)
import Options.Applicative.Builder (argument, auto, help, metavar)
import Options.Applicative.Types (Parser, ParserInfo)


parser :: ParserInfo (IO ())

parser = info (subparser $ p <> q) (progDesc descA)
  where
    p = command cmdnameP . info parserP $ progDesc descP
    q = command cmdnameQ . info parserQ $ progDesc descQ


parserP :: Parser (IO ())

parserP = helper <*> (commandP <$> h <*> q)
  where
    h = argument auto $ help helpH <> metavar metavarH
    q = argument auto $ help helpQ <> metavar metavarQ


parserQ :: Parser (IO ())

parserQ = helper <*> (commandQ <$> h <*> p)
  where
    h = argument auto $ help helpH <> metavar metavarH
    p = argument auto $ help helpP <> metavar metavarP


cmdnameP = "probability"
cmdnameQ = "quantity"

descA = "Calculates probability that a monster will die, in the Hakoniwa Islands."
descP = "Calculates probability that a monster will die."
descQ = "Calculates quantity of missiles to kill a monster."

metavarH = "HP"
metavarP = "PROBABILITY"
metavarQ = "MISSILES"

helpH = "The HP of the monster."
helpP = "The probability of killing the monster. (%)"
helpQ = "The quantity of missiles to launch."