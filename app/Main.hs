import CLI.Parser (parser)
import CLI.ParserConfig (ParserConfig)
import Control.Monad (join)
import Data.Yaml (decodeFileThrow)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)


main :: IO ()

main = do
  f <- getDataFileName "assets/parserconfig.yaml"

  c <- (decodeFileThrow f :: IO ParserConfig)

  join $ customExecParser (prefs showHelpOnEmpty) (parser c)