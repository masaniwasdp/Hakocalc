{-|
 - Description : Modulo por analizi komandolinion opcion.
 - Copyright   : 2019 masaniwa
 - License     : MIT
 -}
module Hakocalc.Options
  ( options
  ) where


import Data.Semigroup ((<>))
import Hakocalc.Command (Option (POpts, QOpts))
import Hakocalc.OptUtil (optionP, optionQ)
import Options.Applicative.Builder (command, info, subparser, progDesc)
import Options.Applicative.Common (ParserInfo)

import qualified Hakocalc.Asset.Text as Text


{-| Analizas komandolinion opcion. -}
options :: ParserInfo Option

options = info (subparser $ p <> q) (progDesc Text.descA)
  where
    p = command Text.commandP . info optionP $ progDesc Text.descP
    q = command Text.commandQ . info optionQ $ progDesc Text.descQ
