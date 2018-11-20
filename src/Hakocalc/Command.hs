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


import Hakocalc.Calc.Common (Probability, fromProbability)
import Hakocalc.Calc.Monster (defeatProbability, enoughMissiles)
import Numeric.Natural (Natural)
import Text.Printf (printf)

import qualified Hakocalc.Asset.Text as Text


{-| Rezolto de komandoj. -}
type Result = String


{-| Argumentoj por probablo komando. -}
data PArgs = PArgs
  Natural -- ^ HP de monstro.
  Natural -- ^ Kvanto da misiloj kiuj estos lanĉita.


{-| Argumentoj por kvanto komando. -}
data QArgs = QArgs
  Natural     -- ^ HP de monstro.
  Probability -- ^ Probablo de sukcesi mortigi monstron.


{-| Kalkulas probablon de sukcesi mortigi monstron. -}
commandP
  :: PArgs  -- ^ Argumentoj de komando.
  -> Result -- ^ Rezolto de komando.

commandP (PArgs h q) = toPercent $ defeatProbability h q


{-| Kalkulas postulitan kvanton da misiloj por mortigi monstron. -}
commandQ
  :: QArgs  -- ^ Argumentoj de komando.
  -> Result -- ^ Rezolto de komando.

commandQ (QArgs h p) = maybe Text.fail_message show $ enoughMissiles h p


{-| Konvertas probablon al procento kordo. -}
toPercent
  :: Probability -- ^ Probablo kiu estos konvertata.
  -> String      -- ^ Procento kordo konvertita de probablo.

toPercent = (printf Text.form_percent :: Double -> String)
  . (* 100)
  . fromRational
  . fromProbability
