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
import Options.Applicative.Common (Parser, ParserInfo)
import Options.Applicative.Extra (helper)

import qualified Hakocalc.Asset.Text as Text
import qualified Options.Applicative.Builder as Opt


{-| Opcio por komandoj. -}
data Option = POption PArgs | QOption QArgs


{-| Analizas komandolinion opcion. -}
optionParser :: ParserInfo Option

optionParser = Opt.info pars $ Opt.progDesc Text.cmddesc_a
  where
    pars = Opt.subparser $ pOptionParser <> qOptionParser


{-| Analizas opcion por probablo komando. -}
pOptionParser :: Opt.Mod Opt.CommandFields Option

pOptionParser = Opt.command Text.cmdname_p $ Opt.info pars $ Opt.progDesc Text.cmddesc_p
  where
    pars = helper <*> fmap POption args

    args = PArgs <$> helpArg Text.help_h Text.metavar_h <*> helpArg Text.help_q Text.metavar_q


{-| Analizas opcion por kvanto komando. -}
qOptionParser :: Opt.Mod Opt.CommandFields Option

qOptionParser = Opt.command Text.cmdname_q $ Opt.info pars $ Opt.progDesc Text.cmddesc_q
  where
    pars = helper <*> fmap QOption args

    args = QArgs <$> helpArg Text.help_h Text.metavar_h <*> helpArg Text.help_p Text.metavar_p


{-| Kreas argumenton analizilon kun helpo teksto. -}
helpArg :: Read a => String -> String -> Parser a

helpArg h m = Opt.argument Opt.auto $ Opt.help h <> Opt.metavar m
