import Data.Yaml (FromJSON, decodeFileThrow)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.Controller as Controller
import qualified Hakocalc.Presenter as Presenter


main :: IO ()

main = do
  pCfg <- getConfig "assets/presenter/cli-config.yaml"
  cCfg <- getConfig "assets/controller/cli-config.yaml"

  Presenter.runCLI pCfg =<< customExecParser (prefs showHelpOnEmpty) (Controller.runCLI cCfg)


getConfig :: FromJSON a => String -> IO a

getConfig file = decodeFileThrow =<< getDataFileName file