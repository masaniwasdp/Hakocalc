{-|
 - Description : Modulo por analizi komandolinion opcion.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Options
  ( options
  , prefs
  )
  where


import Data.Semigroup ((<>))
import Hakocalc.Command (Option (POpts, QOpts))
import Options.Applicative.Builder (CommandFields, Mod)
import Options.Applicative.Common (Parser, ParserInfo, ParserPrefs)
import Options.Applicative.Extra (helper)

import qualified Hakocalc.Asset.Text as Text
import qualified Options.Applicative.Builder as Builder


{-| Analizas komandolinion opcion. -}
options :: ParserInfo Option

options = Builder.info pars $ Builder.progDesc Text.descA
  where
    pars = Builder.subparser $ pParser <> qParser


{-| -}
prefs :: ParserPrefs

prefs = Builder.prefs Builder.showHelpOnEmpty


{-| Analizas opcion por probablo komando. -}
pParser :: Mod CommandFields Option

pParser = Builder.command Text.commandP $ Builder.info pars $ Builder.progDesc Text.descP
  where
    pars = helper <*> opts

    opts = POpts <$> helpArg Text.helpH Text.metavarH <*> helpArg Text.helpQ Text.metavarQ


{-| Analizas opcion por kvanto komando. -}
qParser :: Mod CommandFields Option

qParser = Builder.command Text.commandQ $ Builder.info pars $ Builder.progDesc Text.descQ
  where
    pars = helper <*> opts

    opts = QOpts <$> helpArg Text.helpH Text.metavarH <*> helpArg Text.helpP Text.metavarP


{-| Kreas argumenton analizilon kun helpo teksto. -}
helpArg :: Read a => String -> String -> Parser a

helpArg h m = Builder.argument Builder.auto $ Builder.help h <> Builder.metavar m
