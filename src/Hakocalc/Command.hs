{-|
 - Description : Modulo de komando.
 - Copyright   : 2019 masaniwa
 - License     : MIT
 -}
module Hakocalc.Command
  ( Option (..)
  , Result
  , command
  ) where


import Hakocalc.Entity.Defeat (HP, Quantity, defeatProbability, enoughMissiles)
import Hakocalc.Entity.Probability (Probability, fromProbability)
import Text.Printf (printf)

import qualified Hakocalc.Asset.Text as Text


{-| Rezolto de komandoj. -}
type Result = String


{-| -}
data Option = OptionP HP Quantity | OptionQ HP Probability


{-| -}
command :: Option -> Result

command (OptionP h q) = toPercent $ defeatProbability h q

command (OptionQ h p) = maybe Text.failed show $ enoughMissiles h p


{-| Konvertas probablon al procento kordo. -}
toPercent :: Probability -> String

toPercent = (printf Text.format :: Double -> String)
  . (* 100)
  . fromRational
  . fromProbability
