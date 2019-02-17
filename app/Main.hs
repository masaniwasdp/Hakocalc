import Hakocalc.App.Command (command)
import Hakocalc.App.Options (options)
import Options.Applicative (customExecParser, prefs, showHelpOnEmpty)


main :: IO ()

main = do
  opt <- customExecParser (prefs showHelpOnEmpty) options

  putStrLn $ command opt