import Data.Yaml (decodeFileThrow)
import Hakocalc.App.Command.Main (commandP, commandQ)
import Hakocalc.CLI.Main (parser)
import Hakocalc.CLI.Option (Option (OptionP, OptionQ))
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.App.Command.Config as A
import qualified Hakocalc.CLI.Config as C


main :: IO ()

main = execute =<< parse


parse :: IO Option

parse = do
  f <- getDataFileName "assets/cli/config.yaml"

  c <- (decodeFileThrow f :: IO C.Config)

  customExecParser (prefs showHelpOnEmpty) (parser c)


execute :: Option -> IO ()

execute opt = do
  f <- getDataFileName "assets/app/command/config.yaml"

  c <- (decodeFileThrow f :: IO A.Config)

  case opt of
    OptionP h q -> commandP c h q
    OptionQ h p -> commandQ c h p