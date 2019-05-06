import Hakocalc.App.Command (execute)
import CLI.Parser (receive)


main :: IO ()

main = execute =<< receive