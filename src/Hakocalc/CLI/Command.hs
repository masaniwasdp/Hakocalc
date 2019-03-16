{-|
 - Description : Modulo por ekzekuti komandoj.
 - Copyright   : 2019 masaniwa
 - License     : MIT
 -}
module Hakocalc.CLI.Command
  ( command
  ) where


import Hakocalc.CLI.Context (CLI, Option (OptionP, OptionQ), printLine)
import Hakocalc.Entity.Defeat (Quantity, defeatProbability, enoughMissiles)
import Hakocalc.Entity.Probability (Probability)
import Text.Printf (printf)

import qualified Hakocalc.Asset.Text as Text


{-| -}
command :: CLI m => Option -> m ()

command opt = printLine $ case opt of
  (OptionP h q) -> fromProbability $ defeatProbability h q

  (OptionQ h p) -> fromMaybeQuantity $ enoughMissiles h p


{-| -}
fromProbability :: Probability -> String

fromProbability = (printf Text.format :: Double -> String) . read . show


{-| -}
fromMaybeQuantity :: Maybe Quantity -> String

fromMaybeQuantity = maybe Text.failed show