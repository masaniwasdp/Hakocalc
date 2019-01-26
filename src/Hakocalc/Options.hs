{-|
 - Description : Modulo por analizi komandolinion opcion.
 - Copyright   : 2019 masaniwa
 - License     : MIT
 -}
module Hakocalc.Options
  ( options
  ) where


import Data.Semigroup ((<>))
import Hakocalc.Command (Option (OptionP, OptionQ))
import Options.Applicative (command, helper, info, progDesc, subparser)
import Options.Applicative.Builder (argument, auto, help, metavar)
import Options.Applicative.Types (Parser, ParserInfo)

import qualified Hakocalc.Asset.Text as Text


{-| Analizas komandolinion opcion. -}
options :: ParserInfo Option

options = info (subparser $ p <> q) (progDesc Text.descA)
  where
    p = command Text.commandP . info optionP $ progDesc Text.descP
    q = command Text.commandQ . info optionQ $ progDesc Text.descQ


{-| -}
optionP :: Parser Option

optionP = helper <*> (OptionP <$> h <*> q)
  where
    h = argument auto $ help Text.helpH <> metavar Text.metavarH
    q = argument auto $ help Text.helpQ <> metavar Text.metavarQ


{-| -}
optionQ :: Parser Option

optionQ = helper <*> (OptionQ <$> h <*> p)
  where
    h = argument auto $ help Text.helpH <> metavar Text.metavarH
    p = argument auto $ help Text.helpP <> metavar Text.metavarP