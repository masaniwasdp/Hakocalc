{-|
 - Description : Modulo de komando.
 - Copyright   : 2017 masaniwa
 - License     : MIT
 -}

module Hakocalc.Command
  ( calcProbability
  , calcQuantity
  , calcTransition ) where

import Data.List (intercalate)
import Hakocalc.Option (ProbabilityOption (..), QuantityOption (..), TransitionOption (..))
import Hakocalc.Probability.Common (Probability)
import Hakocalc.Probability.Killing (enoughMissiles, killingProbability, probabilityTransition)
import Text.Printf (printf)


{-| Kalkulas probablon de sukcesi mortigi monstron. -}
calcProbability :: ProbabilityOption -- ^ Opcio por komando.
                -> IO ()

calcProbability option = putStrLn result
  where
    result = showPercentage $ killingProbability (pHP option) (pQuantity option)


{-| Kalkulas postulitan kvanton da misiloj por mortigi monstron. -}
calcQuantity :: QuantityOption -- ^ Opcio de komando.
             -> IO ()

calcQuantity option = putStrLn result
  where
    result = case enoughMissiles (qHP option) (qProbability option) of
               Just x  -> show x
               Nothing -> "Couldn't calculate."


{-| Kalkulas transiron de probablo de sukcesi mortigi monstron. -}
calcTransition :: TransitionOption -- ^ Opcio de komando.
               -> IO ()

calcTransition option = putStrLn result
  where
    result     = intercalate "\n" $ zipWith (printf "%s: %s") indices transition
    indices    = map show [tMin option .. tMax option]
    transition = map showPercentage $ probabilityTransition (tHP option) (tMin option) (tMax option)


{-| Konvertas probablon al procenta kordo. -}
showPercentage :: Probability -- ^ Probablo kiu estos konvertata.
               -> String      -- ^ Procenta kordo konvertita.

showPercentage = printf "%.3f%%" . (read :: String -> Double) . show
