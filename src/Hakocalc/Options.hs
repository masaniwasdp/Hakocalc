{-|
 - Description : Modulo por analizi komandolinion opcion.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Options
  ( options
  , pref
  ) where


import Data.Semigroup ((<>))
import Hakocalc.Command (Option (POpts, QOpts))
import Hakocalc.OptUtil (descA, descP, descQ, parserH, parserP, parserQ)
import Options.Applicative.Builder (command, info, prefs, showHelpOnEmpty, subparser)
import Options.Applicative.Common (ParserInfo, ParserPrefs)
import Options.Applicative.Extra (helper)

import qualified Hakocalc.Asset.Text as Text


{-| Analizas komandolinion opcion. -}
options :: ParserInfo Option

options = info (subparser $ cmdP <> cmdQ) descA
  where
    cmdP = command Text.commandP $ info optsP descP
    cmdQ = command Text.commandQ $ info optsQ descQ

    optsP = helper <*> (POpts <$> parserH <*> parserQ)
    optsQ = helper <*> (QOpts <$> parserH <*> parserP)


{-| -}
pref :: ParserPrefs

pref = prefs showHelpOnEmpty
