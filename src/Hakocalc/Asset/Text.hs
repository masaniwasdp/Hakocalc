{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE TemplateHaskell #-}

module Hakocalc.Asset.Text where


import Hakocalc.Asset.Util (genText)


do
  return
    [ genText "commandP" "probability"
    , genText "commandQ" "quantity"
    , genText "metavarH" "HP"
    , genText "metavarP" "PROBABILITY"
    , genText "metavarQ" "MISSILES"
    , genText "helpH" "The HP of the monster."
    , genText "helpP" "The probability of killing the monster. (%)"
    , genText "helpQ" "The quantity of missiles to launch."
    , genText "descA" "Calculates probability that a monster will die, in the Hakoniwa Islands."
    , genText "descP" "Calculates probability that a monster will die."
    , genText "descQ" "Calculates quantity of missiles to kill a monster."
    , genText "format" "%.3f%%"
    , genText "failed" "Couldn't calculate."
    ]