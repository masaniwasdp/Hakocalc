import Data.Yaml (decodeFileThrow)
import Hakocalc.CLI.Main (parser)
import Hakocalc.CLI.Option (Option (OptionP, OptionQ))
import Hakocalc.Command.Main (commandP, commandQ)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.CLI.Config as CL
import qualified Hakocalc.Command.Config as CM


main :: IO ()

main = execute =<< parse


parse :: IO Option

parse = do
  f <- getDataFileName "assets/cli/config.yaml"

  c <- (decodeFileThrow f :: IO CL.Config)

  customExecParser (prefs showHelpOnEmpty) (parser c)


execute :: Option -> IO ()

execute opt = do
  f <- getDataFileName "assets/command/config.yaml"

  c <- (decodeFileThrow f :: IO CM.Config)

  case opt of
    OptionP h q -> commandP c h q
    OptionQ h p -> commandQ c h p