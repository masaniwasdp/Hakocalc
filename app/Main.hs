import Control.Monad (join)
import Data.Yaml (decodeFileThrow)
import Hakocalc.CLI.Config (Config)
import Hakocalc.CLI.Main (parser)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)


main :: IO ()

main = do
  f <- getDataFileName "assets/cli/config.yaml"

  c <- (decodeFileThrow f :: IO Config)

  join $ customExecParser (prefs showHelpOnEmpty) (parser c)