import qualified CLI.Command as Command
import qualified CLI.Parser as Parser


main :: IO ()

main = Command.execute =<< Parser.execute