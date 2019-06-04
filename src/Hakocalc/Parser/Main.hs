module Hakocalc.Parser.Main
  ( parser
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.Command.Params (Params (ParamsP, ParamsQ))

import qualified Hakocalc.Parser.Config as C
import qualified Options.Applicative as A


parser :: C.Config -> A.ParserInfo Params

parser cfg = A.info (A.subparser $ p <> q) $ A.progDesc (cfg ^. C.descA)
  where
    p = A.command (cfg ^. C.nameP) . A.info (parserP cfg) $ A.progDesc (cfg ^. C.descP)
    q = A.command (cfg ^. C.nameQ) . A.info (parserQ cfg) $ A.progDesc (cfg ^. C.descQ)


parserP :: C.Config -> A.Parser Params

parserP cfg = A.helper <*> (ParamsP <$> h <*> q)
  where
    h = defineArg (cfg ^. C.helpH) (cfg ^. C.metaH)
    q = defineArg (cfg ^. C.helpQ) (cfg ^. C.metaQ)


parserQ :: C.Config -> A.Parser Params

parserQ cfg = A.helper <*> (ParamsQ <$> h <*> p)
  where
    h = defineArg (cfg ^. C.helpH) (cfg ^. C.metaH)
    p = defineArg (cfg ^. C.helpP) (cfg ^. C.metaP)


defineArg :: Read a => String -> String -> A.Parser a

defineArg h m = A.argument A.auto $ A.help h <> A.metavar m