import Hakocalc.App.Command (command)
import Hakocalc.App.Options (options)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)


main :: IO ()

main = command =<< customExecParser (prefs showHelpOnEmpty) options