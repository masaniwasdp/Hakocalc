import Control.Monad (join)
import Data.Yaml (decodeFileThrow)
import Hakocalc.Front.Command (parser)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.Back.Config as BCfg
import qualified Hakocalc.Front.Config as FCfg


main :: IO ()

main = do
  fname <- getDataFileName "assets/front/config.yaml"
  bname <- getDataFileName "assets/back/config.yaml"

  fcfg <- decodeFileThrow fname :: IO FCfg.Config
  bcfg <- decodeFileThrow bname :: IO BCfg.Config

  join $ customExecParser (prefs showHelpOnEmpty) (parser fcfg bcfg)