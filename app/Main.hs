import Data.Yaml (FromJSON, decodeFileThrow)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.Command as Command
import qualified Hakocalc.Controller as Controller
import qualified Hakocalc.Presenter as Presenter


main :: IO ()

main = do
  runPresenter <- do
    cfg <- getConfig "assets/presenter/cli-config.yaml"

    return $ Presenter.runCLI cfg

  runController <- do
    cfg <- getConfig "assets/controller/cli-config.yaml"

    return $ Controller.runCLI cfg

  runPresenter =<< customExecParser (prefs showHelpOnEmpty) (runController Command.modelImpl)


getConfig :: FromJSON a => String -> IO a

getConfig file = decodeFileThrow =<< getDataFileName file