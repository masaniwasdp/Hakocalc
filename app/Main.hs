import Control.Monad (join)
import Data.Yaml (FromJSON, decodeFileThrow)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.Calculator.Model as Calculator
import qualified Hakocalc.Controller.Request as Request
import qualified Hakocalc.Presenter.Response as Response

main :: IO ()

main = do
  ccfg <- getConfig "assets/controller/config.yaml"
  pcfg <- getConfig "assets/presenter/config.yaml"

  let env = Request.environment ccfg . Calculator.model $ Response.environment pcfg

  join $ customExecParser (prefs showHelpOnEmpty) (Request.execute env)


getConfig :: FromJSON a => String -> IO a

getConfig file = decodeFileThrow =<< getDataFileName file