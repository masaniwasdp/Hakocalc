import Control.Monad (join)
import Data.Yaml (decodeFileThrow)
import Hakocalc.Command.Commands (commands)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.Command.Config as CC
import qualified Hakocalc.Domain.Config as DC


main :: IO ()

main = do
  cf <- getDataFileName "assets/command/config.yaml"
  df <- getDataFileName "assets/domain/config.yaml"

  cc <- decodeFileThrow cf :: IO CC.Config
  dc <- decodeFileThrow df :: IO DC.Config

  join $ customExecParser (prefs showHelpOnEmpty) (commands cc dc)