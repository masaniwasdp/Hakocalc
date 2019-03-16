{-|
 - Description : Modulo por kunteksto de CLI.
 - Copyright   : 2019 masaniwa
 - License     : MIT
 -}
module Hakocalc.CLI.Context
  ( CLI
  , Option (..)
  , printLine
  ) where


import Hakocalc.Entity.Defeat (HP, Quantity)
import Hakocalc.Entity.Probability (Probability)


{-| -}
data Option = OptionP HP Quantity | OptionQ HP Probability


{-| -}
class Monad m => CLI m where
  {-| -}
  printLine :: String -> m ()


instance CLI IO where
  printLine = putStrLn