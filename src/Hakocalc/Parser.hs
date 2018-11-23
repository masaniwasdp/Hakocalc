{-|
 - Description : Modulo por analizi komandolinion opcion.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Parser
  ( Option (..)
  , parser
  , prefs
  )
  where


import Data.Semigroup ((<>))
import Hakocalc.Command (PArgs (PArgs), QArgs (QArgs))
import Options.Applicative.Common (Parser, ParserInfo, ParserPrefs)
import Options.Applicative.Extra (helper)

import qualified Hakocalc.Asset.Text as Text
import qualified Options.Applicative.Builder as Opt


{-| Opcio por komandoj. -}
data Option = POpts PArgs | QOpts QArgs


{-| Analizas komandolinion opcion. -}
parser :: ParserInfo Option

parser = Opt.info pars $ Opt.progDesc Text.cmddesc_a
  where
    pars = Opt.subparser $ pParser <> qParser


{-| -}
prefs :: ParserPrefs

prefs = Opt.prefs Opt.showHelpOnEmpty


{-| Analizas opcion por probablo komando. -}
pParser :: Opt.Mod Opt.CommandFields Option

pParser = Opt.command Text.cmdname_p $ Opt.info pars $ Opt.progDesc Text.cmddesc_p
  where
    pars = helper <*> fmap POpts args

    args = PArgs <$> helpArg Text.help_h Text.metavar_h <*> helpArg Text.help_q Text.metavar_q


{-| Analizas opcion por kvanto komando. -}
qParser :: Opt.Mod Opt.CommandFields Option

qParser = Opt.command Text.cmdname_q $ Opt.info pars $ Opt.progDesc Text.cmddesc_q
  where
    pars = helper <*> fmap QOpts args

    args = QArgs <$> helpArg Text.help_h Text.metavar_h <*> helpArg Text.help_p Text.metavar_p


{-| Kreas argumenton analizilon kun helpo teksto. -}
helpArg :: Read a => String -> String -> Parser a

helpArg h m = Opt.argument Opt.auto $ Opt.help h <> Opt.metavar m
