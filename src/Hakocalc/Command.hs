{-|
 - Description : Modulo de komando.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Command
  ( commandP
  , commandQ
  )
  where


import Hakocalc.Parser (PArgs (..), QArgs (..))
import Hakocalc.Probability.Common (fromProbability)
import Hakocalc.Probability.Killing (enoughMissiles, killingProbability)
import Text.Printf (printf)


{-| Kalkulas probablon de sukcesi mortigi monstron. -}
commandP
  :: PArgs -- ^ Argumentoj de komando.
  -> IO ()

commandP (PArgs h q) = putStrLn
  . (printf "%.3f%%" :: Double -> String)
  . (* 100)
  . fromRational
  . fromProbability $ killingProbability h q


{-| Kalkulas postulitan kvanton da misiloj por mortigi monstron. -}
commandQ
  :: QArgs -- ^ Argumentoj de komando.
  -> IO ()

commandQ (QArgs h p) = putStrLn
  . maybe "Couldn't calculate." show $ enoughMissiles h p
