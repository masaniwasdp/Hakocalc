{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module CLI.Define where


descA = "Calculates probability that a monster will die, in the Hakoniwa Islands."
descP = "Calculates probability that a monster will die."
descQ = "Calculates quantity of missiles to kill a monster."

cmdnameP = "probability"
cmdnameQ = "quantity"

metavarH = "HP"
metavarP = "PROBABILITY"
metavarQ = "MISSILES"

helpH = "The HP of the monster."
helpP = "The probability of killing the monster. (%)"
helpQ = "The quantity of missiles to launch."