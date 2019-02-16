import Hakocalc.Command (command)
import Hakocalc.Options (options)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)


main :: IO ()

main = do
  opt <- customExecParser (prefs showHelpOnEmpty) options

  putStrLn $ command opt