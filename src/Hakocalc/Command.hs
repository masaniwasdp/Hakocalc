{-|
 - Description : Modulo de komando.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Command
  ( calcProbability
  , calcQuantity
  )
  where


import Hakocalc.Parser (ProbabilityOption' (..), QuantityOption' (..))
import Hakocalc.Probability.Common (fromProbability)
import Hakocalc.Probability.Killing (enoughMissiles, killingProbability)
import Text.Printf (printf)


{-| Kalkulas probablon de sukcesi mortigi monstron. -}
calcProbability
  :: ProbabilityOption' -- ^ Opcio por komando.
  -> IO ()

calcProbability (ProbabilityOption' h q) = printf "%.3f%%" (per :: Double)
  where
    per = (* 100) . fromRational $ fromProbability res

    res = killingProbability h q


{-| Kalkulas postulitan kvanton da misiloj por mortigi monstron. -}
calcQuantity
  :: QuantityOption' -- ^ Opcio de komando.
  -> IO ()

calcQuantity (QuantityOption' h p) = case enoughMissiles h p of
  Just q -> print q

  Nothing -> putStrLn "Couldn't calculate."
