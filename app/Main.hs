import Control.Monad (join)
import Data.Yaml (FromJSON, decodeFileThrow)
import Hakocalc.Controller.Command (command)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

main :: IO ()

main = do
  controllerConfig <- getConfig "assets/controller/config.yaml"
  calculatorConfig <- getConfig "assets/calculator/config.yaml"

  join $ customExecParser (prefs showHelpOnEmpty) (command controllerConfig calculatorConfig)


getConfig :: FromJSON a => String -> IO a

getConfig file = decodeFileThrow =<< getDataFileName file