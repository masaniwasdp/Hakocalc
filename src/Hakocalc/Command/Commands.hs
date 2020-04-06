module Hakocalc.Command.Commands
  ( commands
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.Command.Helper (defineArg, defineCmd)
import Hakocalc.Domain.Model (calcProbability, calcQuantity)
import Options.Applicative (CommandFields, Mod, ParserInfo, info, progDesc, subparser)

import qualified Hakocalc.Command.Config as CC
import qualified Hakocalc.Domain.Config as DC


commands :: CC.Config -> DC.Config -> ParserInfo (IO ())

commands cc dc = info (subparser xs) $ progDesc (cc ^. CC.descA)
  where
    xs = commandP cc dc <> commandQ cc dc


commandP :: CC.Config -> DC.Config -> Mod CommandFields (IO ())

commandP cc dc = defineCmd (putStrLn <$> p) (cc ^. CC.nameP) (cc ^. CC.descP)
  where
    p = calcProbability dc
      <$> defineArg (cc ^. CC.helpH) (cc ^. CC.metaH)
      <*> defineArg (cc ^. CC.helpQ) (cc ^. CC.metaQ)


commandQ :: CC.Config -> DC.Config -> Mod CommandFields (IO ())

commandQ cc dc = defineCmd (putStrLn <$> q) (cc ^. CC.nameQ) (cc ^. CC.descQ)
  where
    q = calcQuantity dc
      <$> defineArg (cc ^. CC.helpH) (cc ^. CC.metaH)
      <*> defineArg (cc ^. CC.helpP) (cc ^. CC.metaP)