{-# LANGUAGE DataKinds #-}

import Control.Monad.IO.Class (liftIO)
import Data.List (intercalate)
import Data.Maybe (fromMaybe)
import Numeric.Natural (Natural)
import Options.Declarative (Cmd, Flag, Group(Group), get, run_, subCmd)
import Text.Printf (printf)

import HakoniwaKilling.KillingProbability (enoughMissiles, killingProbability, probabilityTransition)
import HakoniwaKilling.Probability (Probability, fromProbability, toProbability)


main :: IO ()

main = run_ $ Group
    "The calculator of probability that the monster will die, in Hakoniwa Islands."
    [subCmd "probability" calcProbability , subCmd "quantity" calcQuantity , subCmd "transition" calcTransition]


-- Kalkulas probablon de sukcesi mortigi monstron.
calcProbability :: Flag "h" '["hp"] "Num" "The HP of the monster." Integer
                -> Flag "q" '["quantity"] "Num" "The quantity of missiles to launch." Integer
                -> Cmd "Calculates probability that the monster will die." ()

calcProbability hp quantity = putResult result "Failed to calculate the probability." where
    result      = showPercentage <$> probability
    probability = killingProbability <$> getNatural hp <*> getNatural quantity


-- Kalkulas postulitan kvanton da misiloj por mortigi monstron.
calcQuantity :: Flag "h" '["hp"] "Num" "The HP of the monster." Integer
             -> Flag "p" '["probability"] "Num(%)" "The probability of killing the monster." Double
             -> Cmd "Calculates enough quantity of missiles to kill the monster." ()

calcQuantity hp probability = putResult result "Failed to calculate the quantity." where
    result = case quantity of
        (Just q) -> Just . show $ q
        _        -> Nothing

    quantity     = enoughMissiles <$> getNatural hp <*> probability'
    probability' = toProbability . (/ 100) . toRational . get $ probability


-- Kalkulas transiron de probablo de sukcesi mortigi monstron.
calcTransition :: Flag "h" '["hp"] "Num" "The HP of the monster." Integer
               -> Flag "n" '["min"] "Num" "The minimum quantity of missiles to launch." Integer
               -> Flag "m" '["max"] "Num" "The maximum quantity of missiles to launch." Integer
               -> Cmd "Calculates probability transition that the monster dies when launching m missiles from n." ()

calcTransition hp n m = putResult result "Failed to calculate the transition." where
    result     = intercalate "\n" . map showPercentage <$> transition
    transition = probabilityTransition <$> getNatural hp <*> quantities
    quantities = case (getNatural n, getNatural m) of
        (Just n', Just m') -> Just (n', m')
        _                  -> Nothing


-- Konvertas probablon al kordo.
showPercentage :: Probability
               -> String

showPercentage p = (++ "%") . printf "%.3f" $ percentage where
    percentage = (* 100) . fromRational . fromProbability $ p :: Double


-- Akiras naturan nombron de argumento.
getNatural :: Flag a b c d Integer
           -> Maybe Natural

getNatural x
    | get x < 0 = Nothing
    | otherwise = Just . fromInteger . get $ x


-- Montras kalkulon rezulton.
putResult :: Maybe String
          -> String
          -> Cmd a ()

putResult result instead = liftIO . putStrLn $ fromMaybe instead result
