import Hakocalc.Command (calcProbability, calcQuantity)
import Hakocalc.Parser (Option (ProbabilityOption, QuantityOption), optionParser)
import Options.Applicative (customExecParser, prefs, showHelpOnError)


main :: IO ()

main = do
  opt' <- customExecParser (prefs showHelpOnError) optionParser

  case opt' of
    ProbabilityOption opt -> calcProbability opt

    QuantityOption opt -> calcQuantity opt
