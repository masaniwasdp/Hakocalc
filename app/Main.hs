import Hakocalc.CLI.Command (command)
import Hakocalc.CLI.Options (options)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)


main :: IO ()

main = command =<< customExecParser (prefs showHelpOnEmpty) options