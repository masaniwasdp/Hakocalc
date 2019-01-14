{-|
 - Description :
 - Copyright   : 2019 masaniwa
 - License     : MIT
 -}
module Hakocalc.OptUtil
  ( descA
  , descP
  , descQ
  , parserH
  , parserP
  , parserQ
  ) where


import Data.Semigroup ((<>))
import Options.Applicative (InfoMod, Parser)
import Options.Applicative.Builder (argument, auto, help, metavar, progDesc)

import qualified Hakocalc.Asset.Text as Text


{-| -}
parserH :: Read a => Parser a

parserH = argument auto $ help Text.helpH <> metavar Text.metavarH


{-| -}
parserP :: Read a => Parser a

parserP = argument auto $ help Text.helpP <> metavar Text.metavarP


{-| -}
parserQ :: Read a => Parser a

parserQ = argument auto $ help Text.helpQ <> metavar Text.metavarQ


{-| -}
descA :: InfoMod a

descA = progDesc Text.descA


{-| -}
descP :: InfoMod a

descP = progDesc Text.descP


{-| -}
descQ :: InfoMod a

descQ = progDesc Text.descQ
