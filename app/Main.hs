import Hakocalc.Command (command)
import Hakocalc.Options (options)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)


main :: IO ()

main = putStrLn . command =<< customExecParser (prefs showHelpOnEmpty) options
