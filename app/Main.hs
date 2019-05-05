import CLI.Command (command)
import CLI.Parser (parser)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)


main :: IO ()

main = command =<< customExecParser (prefs showHelpOnEmpty) parser