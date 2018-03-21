import Hakocalc.Command (commandP, commandQ)
import Hakocalc.Parser (Option (POption, QOption), optionParser)
import Options.Applicative (customExecParser, prefs, showHelpOnError)


main :: IO ()

main = do
  option <- customExecParser (prefs showHelpOnError) optionParser

  case option of
    POption args -> commandP args

    QOption args -> commandQ args
