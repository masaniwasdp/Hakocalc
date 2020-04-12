import Control.Monad (join)
import Data.Yaml (FromJSON, decodeFileThrow)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.Calculator as Calculator
import qualified Hakocalc.Controller as Controller
import qualified Hakocalc.Presenter as Presenter


main :: IO ()

main = do
  cli <- controller =<< calculator =<< presenter

  join $ customExecParser (prefs showHelpOnEmpty) (Controller.execute cli)


calculator :: Calculator.IPresenter a => a -> IO (Calculator.Model a)

calculator p = do
  return $ Calculator.model p


controller :: Calculator.IPresenter a => Calculator.Model a -> IO (Controller.CLI a)

controller c = do
  cfg <- getConfig "assets/controller/cli-config.yaml"

  return $ Controller.cli cfg c


presenter :: IO Presenter.CLI

presenter = do
  cfg <- getConfig "assets/presenter/cli-config.yaml"

  return $ Presenter.cli cfg


getConfig :: FromJSON a => String -> IO a

getConfig file = decodeFileThrow =<< getDataFileName file