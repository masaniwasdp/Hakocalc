import Hakocalc.Command (commandP, commandQ)
import Hakocalc.Parser (Option (POpts, QOpts), parser, prefs)
import Options.Applicative (customExecParser)


main :: IO ()

main = do
  option <- customExecParser prefs parser

  putStrLn $ case option of
    POpts args -> commandP args
    QOpts args -> commandQ args
