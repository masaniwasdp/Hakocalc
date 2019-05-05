{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module CLI.Text where


cmdnameP = "probability"
cmdnameQ = "quantity"

descA = "Calculates probability that a monster will die, in the Hakoniwa Islands."
descP = "Calculates probability that a monster will die."
descQ = "Calculates quantity of missiles to kill a monster."

metavarH = "HP"
metavarP = "PROBABILITY"
metavarQ = "MISSILES"

helpH = "The HP of the monster."
helpP = "The probability of killing the monster. (%)"
helpQ = "The quantity of missiles to launch."

fmtresQ = "%d\n"
fmtresP = "%.3f%%\n"

txtnotiF = "Could not calculate."