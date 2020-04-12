import Control.Monad (join)
import Data.Yaml (FromJSON, decodeFileThrow)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.Command as Command
import qualified Hakocalc.Controller as Controller
import qualified Hakocalc.Presenter as Presenter


main :: IO ()

main = do
  presenterConfig <- getConfig "assets/presenter/cli-config.yaml"

  controllerConfig <- getConfig "assets/controller/cli-config.yaml"

  let presenter = Presenter.cli presenterConfig

  let command = Command.model presenter

  let controller = Controller.cli controllerConfig command

  join $ customExecParser (prefs showHelpOnEmpty) (Controller.execute controller)


getConfig :: FromJSON a => String -> IO a

getConfig file = decodeFileThrow =<< getDataFileName file