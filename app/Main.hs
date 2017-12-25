import Hakocalc.Command (calcProbability, calcQuantity, calcTransition)
import Hakocalc.Option (Option (..))
import Hakocalc.Parser (optionParser)
import Options.Applicative (customExecParser, prefs, showHelpOnError)


main :: IO ()

main = run =<< customExecParser (prefs showHelpOnError) optionParser
  where
    run (POption option) = calcProbability option
    run (QOption option) = calcQuantity option
    run (TOption option) = calcTransition option
