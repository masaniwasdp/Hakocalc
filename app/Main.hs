import Hakocalc.Command (command)
import Hakocalc.Parser (parser, prefs)
import Options.Applicative (customExecParser)


main :: IO ()

main = putStrLn . command =<< customExecParser prefs parser
