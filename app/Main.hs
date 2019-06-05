import Control.Monad (join)
import Data.Yaml (decodeFileThrow)
import Hakocalc.Command.Config (Config)
import Hakocalc.Command.Main (command)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)


main :: IO ()

main = do
  f <- getDataFileName "assets/command/config.yaml"

  c <- (decodeFileThrow f :: IO Config)

  join $ customExecParser (prefs showHelpOnEmpty) (command c)