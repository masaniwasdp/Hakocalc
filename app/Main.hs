import Command (command)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Parser (parser)


main :: IO ()

main = command =<< customExecParser (prefs showHelpOnEmpty) parser