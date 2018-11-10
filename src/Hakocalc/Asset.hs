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

desc x = case x of
  DescProg -> "Calculates probability that a monster will die, in the Hakoniwa Islands."
  DescCmdP -> "Calculates probability that a monster will die."
  DescCmdQ -> "Calculates quantity of missiles to kill a monster."


{-| -}
command :: CmdKey -> String

command x = case x of
  CmdP -> "probability"
  CmdQ -> "quantity"


{-| -}
metavar :: OptKey -> String

metavar x = case x of
  OptH -> "HP"
  OptP -> "PROBABILITY"
  OptQ -> "MISSILES"


{-| -}
help :: OptKey -> String

help x = case x of
  OptH -> "The HP of the monster."
  OptP -> "The probability of killing the monster. (%)"
  OptQ -> "The quantity of missiles to launch."
