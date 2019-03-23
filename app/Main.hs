import Control.Monad (join)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Parser (parser)


main :: IO ()

main = join $ customExecParser (prefs showHelpOnEmpty) parser