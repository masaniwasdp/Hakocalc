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

main = run_ $ Group "The calculator of probability that the monster will die, in Hakoniwa Islands."
    [ subCmd "probability" calcProbability
    , subCmd "quantity" calcQuantity
    , subCmd "transition" calcTransition ]


-- Tipo de HP argumento.
type FlagHP = Flag "h" '["hp"] "Integer" "The HP of the monster." Integer

-- Tipo de kvanto argumento.
type FlagQuantity = Flag "q" '["quantity"] "Integer" "The quantity of missiles to launch." Integer

-- Tipo de probablo argumento.
type FlagProbability = Flag "p" '["probability"] "Double(%)" "The probability of killing the monster." Double

-- Tipo de minimuma kvanto argumento.
type FlagMin = Flag "n" '["min"] "Integer" "The minimum quantity of missiles to launch." Integer

-- Tipo de maksimuma kvanto argumento.
type FlagMax = Flag "m" '["max"] "Integer" "The maximum quantity of missiles to launch." Integer

-- Tipo de probablo komando.
type CmdProbability = Cmd "Calculates probability that the monster will die." ()

-- Tipo de kvanto komando.
type CmdQuantity = Cmd "Calculates enough quantity of missiles to kill the monster." ()

-- Tipo de transiro komando.
type CmdTransition = Cmd "Calculates probability transition that the monster dies when launching m missiles from n." ()


-- Kalkulas probablon de sukcesi mortigi monstron.
calcProbability :: FlagHP -> FlagQuantity -> CmdProbability

calcProbability hp quantity = putResult result "Failed to calculate the probability." where
    result      = showPercentage <$> probability
    probability = killingProbability <$> getNatural hp <*> getNatural quantity


-- Kalkulas postulitan kvanton da misiloj por mortigi monstron.
calcQuantity :: FlagHP -> FlagProbability -> CmdQuantity

calcQuantity hp probability = putResult result "Failed to calculate the quantity." where
    result = case quantity of
        (Just q) -> Just . show $ q
        _        -> Nothing

    quantity     = enoughMissiles <$> getNatural hp <*> probability'
    probability' = toProbability . (/ 100) . toRational . get $ probability


-- Kalkulas transiron de probablo de sukcesi mortigi monstron.
calcTransition :: FlagHP -> FlagMin -> FlagMax -> CmdTransition

calcTransition hp n m = putResult result "Failed to calculate the transition." where
    result     = intercalate "\n" . map showPercentage <$> transition
    transition = probabilityTransition <$> getNatural hp <*> quantities
    quantities = case (getNatural n, getNatural m) of
        (Just n', Just m') -> Just (n', m')
        _                  -> Nothing


-- Konvertas probablon al kordo.
showPercentage :: Probability -> String

showPercentage p = (++ "%") . printf "%.10f" $ percentage where
    percentage = (* 100) . fromRational . fromProbability $ p :: Double


-- Akiras naturan nombron de argumento.
getNatural :: Flag a b c d Integer -> Maybe Natural

getNatural x
    | get x < 0 = Nothing
    | otherwise = Just . fromInteger . get $ x


-- Montras kalkulon rezulton.
putResult :: Maybe String -> String -> Cmd a ()

putResult result instead = liftIO . putStrLn $ fromMaybe instead result
