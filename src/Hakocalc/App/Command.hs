{-|
 - Description : Modulo por ekzekuti komandoj.
 - Copyright   : 2019 masaniwa
 - License     : MIT
 -}
module Hakocalc.App.Command
  ( Option (..)
  , command
  ) where


import Hakocalc.Entity.Defeat (HP, Quantity, defeatProbability, enoughMissiles)
import Hakocalc.Entity.Probability (Probability, fromProbability)
import Text.Printf (printf)

import qualified Hakocalc.Asset.Text as Text


{-| -}
data Option = OptionP HP Quantity | OptionQ HP Probability


{-| -}
command :: Option -> IO ()

command = putStrLn . calculate


{-| -}
calculate :: Option -> String

calculate (OptionP h q) = toPercent $ defeatProbability h q

calculate (OptionQ h p) = maybe Text.failed show $ enoughMissiles h p


{-| Konvertas probablon al procento kordo. -}
toPercent :: Probability -> String

toPercent = (printf Text.format :: Double -> String)
  . (* 100)
  . fromRational
  . fromProbability
