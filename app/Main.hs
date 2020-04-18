import Control.Monad (join)
import Data.Yaml (FromJSON, decodeFileThrow)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.Command as Command
import qualified Hakocalc.Controller as Controller
import qualified Hakocalc.Presenter as Presenter


main :: IO ()

main = do
  presenter <- Presenter.cli <$> getConfig "assets/presenter/cli-config.yaml"

  command <- return $ Command.model presenter

  controller <- (flip Controller.cli) command <$> getConfig "assets/controller/cli-config.yaml"

  join $ customExecParser (prefs showHelpOnEmpty) (Controller.execute controller)


getConfig :: FromJSON a => String -> IO a

getConfig file = decodeFileThrow =<< getDataFileName file