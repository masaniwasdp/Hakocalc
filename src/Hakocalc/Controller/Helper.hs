module Hakocalc.Controller.Helper
  ( defineArg
  , defineCmd
  ) where


import Data.Semigroup ((<>))
import Options.Applicative (CommandFields, Mod, Parser, command, helper, info, progDesc)
import Options.Applicative.Builder (argument, auto, help, metavar)


defineCmd :: Parser a -> String -> String -> Mod CommandFields a

defineCmd p n d = command n . info (helper <*> p) $ progDesc d


defineArg :: Read a => String -> String -> Parser a

defineArg h m = argument auto $ help h <> metavar m