module Hakocalc.Command.Commands
  ( commands
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.Command.Helper (defineArg, defineCmd)
import Hakocalc.Model.Calculator (calcProbability, calcQuantity)
import Options.Applicative (CommandFields, Mod, ParserInfo, info, progDesc, subparser)

import qualified Hakocalc.Command.Config as C
import qualified Hakocalc.Model.Config as M


commands :: C.Config -> M.Config -> ParserInfo (IO ())

commands cc mc = info (subparser xs) $ progDesc (cc ^. C.descA)
  where
    xs = commandP cc mc <> commandQ cc mc


commandP :: C.Config -> M.Config -> Mod CommandFields (IO ())

commandP cc mc = defineCmd (putStrLn <$> p) (cc ^. C.nameP) (cc ^. C.descP)
  where
    p = calcProbability mc
      <$> defineArg (cc ^. C.helpH) (cc ^. C.metaH)
      <*> defineArg (cc ^. C.helpQ) (cc ^. C.metaQ)


commandQ :: C.Config -> M.Config -> Mod CommandFields (IO ())

commandQ cc mc = defineCmd (putStrLn <$> q) (cc ^. C.nameQ) (cc ^. C.descQ)
  where
    q = calcQuantity mc
      <$> defineArg (cc ^. C.helpH) (cc ^. C.metaH)
      <*> defineArg (cc ^. C.helpP) (cc ^. C.metaP)