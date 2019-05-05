import CLI.Command (execute)
import CLI.Parser (parse)


main :: IO ()

main = execute =<< parse