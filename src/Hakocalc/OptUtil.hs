{-|
 - Description :
 - Copyright   : 2019 masaniwa
 - License     : MIT
 -}
module Hakocalc.OptUtil
  ( optionP
  , optionQ
  ) where


import Data.Semigroup ((<>))
import Hakocalc.Command (Option (POpts, QOpts))
import Options.Applicative (InfoMod, Parser, helper)
import Options.Applicative.Builder (argument, auto, help, metavar)

import qualified Hakocalc.Asset.Text as Text


{-| -}
optionP :: Parser Option

optionP = helper <*> (POpts <$> parserH <*> parserQ)
  where
    parserH = argument auto $ help Text.helpH <> metavar Text.metavarH
    parserQ = argument auto $ help Text.helpQ <> metavar Text.metavarQ


{-| -}
optionQ :: Parser Option

optionQ = helper <*> (QOpts <$> parserH <*> parserP)
  where
    parserH = argument auto $ help Text.helpH <> metavar Text.metavarH
    parserP = argument auto $ help Text.helpP <> metavar Text.metavarP
