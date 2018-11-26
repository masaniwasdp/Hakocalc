import Hakocalc.Command (command)
import Hakocalc.Options (options, prefs)
import Options.Applicative (customExecParser)


main :: IO ()

main = putStrLn . command =<< customExecParser prefs options
