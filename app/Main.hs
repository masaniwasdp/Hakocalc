import Data.Yaml (decodeFileThrow)
import Hakocalc.Command.Main (commandP, commandQ)
import Hakocalc.Parser.Main (parser)
import Hakocalc.Parser.Option (Option (OptionP, OptionQ))
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)
import Paths_hakocalc (getDataFileName)

import qualified Hakocalc.Parser.Config as P
import qualified Hakocalc.Command.Config as C


main :: IO ()

main = execute =<< parse


parse :: IO Option

parse = do
  f <- getDataFileName "assets/parser/config.yaml"

  c <- (decodeFileThrow f :: IO P.Config)

  customExecParser (prefs showHelpOnEmpty) (parser c)


execute :: Option -> IO ()

execute opt = do
  f <- getDataFileName "assets/command/config.yaml"

  c <- (decodeFileThrow f :: IO C.Config)

  case opt of
    OptionP h q -> commandP c h q
    OptionQ h p -> commandQ c h p