{-|
 - Description : Modulo de komando.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Command
  ( PArgs (..)
  , QArgs (..)
  , commandP
  , commandQ
  )
  where


import Hakocalc.Calc.Common (fromProbability)
import Hakocalc.Calc.Monster (HP, Probability, Quantity)
import Text.Printf (printf)

import qualified Hakocalc.Asset.Text as Text
import qualified Hakocalc.Calc.Monster as Monster


{-| Rezolto de komandoj. -}
type Result = String


{-| Argumentoj por probablo komando. -}
data PArgs = PArgs HP Quantity


{-| Argumentoj por kvanto komando. -}
data QArgs = QArgs HP Probability


{-| Kalkulas probablon de sukcesi mortigi monstron. -}
commandP :: PArgs -> Result

commandP (PArgs h q) = toPercent result
  where
    result = Monster.defeatProbability h q


{-| Kalkulas postulitan kvanton da misiloj por mortigi monstron. -}
commandQ :: QArgs -> Result

commandQ (QArgs h p) = maybe Text.failMessage show result
  where
    result = Monster.enoughMissiles h p


{-| Konvertas probablon al procento kordo. -}
toPercent :: Probability -> String

toPercent = (printf Text.formPercent :: Double -> String)
  . (* 100)
  . fromRational
  . fromProbability
