import Control.Monad (join)
import Data.Yaml (decodeFileThrow)
import Hakocalc.CLI.Parser (parser)
import Hakocalc.CLI.ParserConfig (ParserConfig)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)


main :: IO ()

main = do
  f <- getDataFileName "assets/parserconfig.yaml"

  c <- (decodeFileThrow f :: IO ParserConfig)

  join $ customExecParser (prefs showHelpOnEmpty) (parser c)