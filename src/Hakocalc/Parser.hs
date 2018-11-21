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

import qualified Hakocalc.Asset.Text as Text


{-| Opcio por komandoj. -}
data Option = POption PArgs | QOption QArgs


{-| Analizas komandolinion opcion. -}
optionParser :: ParserInfo Option

optionParser = info pars $ progDesc Text.appdesc
  where
    pars = subparser $ pOptionParser <> qOptionParser


{-| Analizas opcion por probablo komando. -}
pOptionParser :: Mod CommandFields Option

pOptionParser = command Text.cmdname_p $ info pars $ progDesc Text.cmddesc_p
  where
    pars = helper <*> fmap POption args

    args = PArgs <$> helpArg Text.help_h Text.metavar_h <*> helpArg Text.help_q Text.metavar_q


{-| Analizas opcion por kvanto komando. -}
qOptionParser :: Mod CommandFields Option

qOptionParser = command Text.cmdname_q $ info pars $ progDesc Text.cmddesc_q
  where
    pars = helper <*> fmap QOption args

    args = QArgs <$> helpArg Text.help_h Text.metavar_h <*> helpArg Text.help_p Text.metavar_p


{-| Kreas argumenton analizilon kun helpo teksto. -}
helpArg :: Read a => String -> String -> Parser a

helpArg h m = argument auto $ help h <> metavar m
