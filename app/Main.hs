import Data.Yaml (decodeFileThrow)
import Hakocalc.Command.Main (command)
import Hakocalc.Command.Params (Params)
import Hakocalc.Parser.Main (parser)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.Parser.Config as P
import qualified Hakocalc.Command.Config as C


main :: IO ()

main = execute =<< parse


parse :: IO Params

parse = do
  f <- getDataFileName "assets/parser/config.yaml"

  c <- (decodeFileThrow f :: IO P.Config)

  customExecParser (prefs showHelpOnEmpty) (parser c)


execute :: Params -> IO ()

execute p = do
  f <- getDataFileName "assets/command/config.yaml"

  c <- (decodeFileThrow f :: IO C.Config)

  command c p