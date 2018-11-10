{-|
 - Description : -
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Asset
  ( CmdKey (..)
  , DescKey (..)
  , OptKey (..)
  , command
  , desc
  , failed
  , help
  , metavar
  , percent
  )
  where


{-| -}
data DescKey = DescProg | DescCmdP | DescCmdQ


{-| -}
data CmdKey = CmdP | CmdQ


{-| -}
data OptKey = OptH | OptP | OptQ


{-| -}
percent :: String

percent = "%.3f%%"


{-| -}
failed :: String

failed = "Couldn't calculate."


{-| -}
desc :: DescKey -> String

desc DescProg = "Calculates probability that a monster will die, in the Hakoniwa Islands."
desc DescCmdP = "Calculates probability that a monster will die."
desc DescCmdQ = "Calculates quantity of missiles to kill a monster."


{-| -}
command :: CmdKey -> String

command CmdP = "probability"
command CmdQ = "quantity"


{-| -}
metavar :: OptKey -> String

metavar OptH = "HP"
metavar OptP = "PROBABILITY"
metavar OptQ = "MISSILES"


{-| -}
help :: OptKey -> String

help OptH = "The HP of the monster."
help OptP = "The probability of killing the monster. (%)"
help OptQ = "The quantity of missiles to launch."
