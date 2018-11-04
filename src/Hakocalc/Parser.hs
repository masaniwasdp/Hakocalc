{-|
 - Description : Modulo por analizi komandolinion opcion.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Parser
  ( Option (..)
  , optionParser
  )
  where


import Data.Semigroup ((<>))
import Hakocalc.Command (PArgs (PArgs), QArgs (QArgs))
import Options.Applicative.Builder (argument, auto, command, help, info, metavar, progDesc, subparser)
import Options.Applicative.Builder.Internal (CommandFields, Mod)
import Options.Applicative.Common (Parser, ParserInfo)
import Options.Applicative.Extra (helper)


{-| Opcio por komandoj. -}
data Option = POption PArgs | QOption QArgs


{-| Analizas komandolinion opcion. -}
optionParser :: ParserInfo Option

optionParser = info pars desc
  where
    pars = subparser $ pOptionParser <> qOptionParser

    desc = progDesc "Calculates probability that a monster will die, in the Hakoniwa Islands."


{-| Analizas opcion por probablo komando. -}
pOptionParser :: Mod CommandFields Option

pOptionParser = command "probability" $ info pars desc
  where
    pars = helper <*> fmap POption args

    args = PArgs <$>
      helpArg "The HP of the monster." "HP" <*>
      helpArg "The quantity of missiles to launch." "MISSILES"

    desc = progDesc "Calculates probability that a monster will die."


{-| Analizas opcion por kvanto komando. -}
qOptionParser :: Mod CommandFields Option

qOptionParser = command "quantity" $ info pars desc
  where
    pars = helper <*> fmap QOption args

    args = QArgs <$>
      helpArg "The HP of the monster." "HP" <*>
      helpArg "The probability of killing the monster. (%)" "PROBABILITY"

    desc = progDesc "Calculates quantity of missiles to kill a monster."


{-| Kreas argumenton analizilon kun helpo teksto. -}
helpArg :: Read a
  => String   -- ^ Helpo teksto.
  -> String   -- ^ Meta variablo.
  -> Parser a -- ^ Argumento analizilo.

helpArg h m = argument auto $ help h <> metavar m
