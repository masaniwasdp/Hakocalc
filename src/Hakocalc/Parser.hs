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
import Options.Applicative.Builder (CommandFields, Mod)
import Options.Applicative.Common (Parser, ParserInfo, ParserPrefs)
import Options.Applicative.Extra (helper)

import qualified Hakocalc.Asset.Text as Text
import qualified Options.Applicative.Builder as Builder


{-| Opcio por komandoj. -}
data Option = POpts PArgs | QOpts QArgs


{-| Analizas komandolinion opcion. -}
parser :: ParserInfo Option

parser = Builder.info pars $ Builder.progDesc Text.cmddescA
  where
    pars = Builder.subparser $ pParser <> qParser


{-| -}
prefs :: ParserPrefs

prefs = Builder.prefs Builder.showHelpOnEmpty


{-| Analizas opcion por probablo komando. -}
pParser :: Mod CommandFields Option

pParser = Builder.command Text.cmdnameP $ Builder.info pars $ Builder.progDesc Text.cmddescP
  where
    pars = helper <*> fmap POpts args

    args = PArgs <$> helpArg Text.helpH Text.metavarH <*> helpArg Text.helpQ Text.metavarQ


{-| Analizas opcion por kvanto komando. -}
qParser :: Mod CommandFields Option

qParser = Builder.command Text.cmdnameQ $ Builder.info pars $ Builder.progDesc Text.cmddescQ
  where
    pars = helper <*> fmap QOpts args

    args = QArgs <$> helpArg Text.helpH Text.metavarH <*> helpArg Text.helpP Text.metavarP


{-| Kreas argumenton analizilon kun helpo teksto. -}
helpArg :: Read a => String -> String -> Parser a

helpArg h m = Builder.argument Builder.auto $ Builder.help h <> Builder.metavar m
