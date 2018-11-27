import Hakocalc.Command (command)
import Hakocalc.Options (options, pref)
import Options.Applicative (customExecParser)


main :: IO ()

main = putStrLn . command =<< customExecParser pref options
