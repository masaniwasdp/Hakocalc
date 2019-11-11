import Control.Monad (join)
import Data.Yaml (decodeFileThrow)
import Hakocalc.Command.Commands (commands)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.Command.Config as C
import qualified Hakocalc.Model.Config as M


main :: IO ()

main = do
  cf <- getDataFileName "assets/command/config.yaml"
  mf <- getDataFileName "assets/model/config.yaml"

  cc <- decodeFileThrow cf :: IO C.Config
  mc <- decodeFileThrow mf :: IO M.Config

  join $ customExecParser (prefs showHelpOnEmpty) (commands cc mc)