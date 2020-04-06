module Hakocalc.Front.Command
  ( parser
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.Front.Helper (defineArg, defineCmd)
import Options.Applicative (CommandFields, Mod, ParserInfo, info, progDesc, subparser)

import qualified Hakocalc.Back.Command as BCmd
import qualified Hakocalc.Back.Config as BCfg
import qualified Hakocalc.Front.Config as FCfg


parser :: FCfg.Config -> BCfg.Config -> ParserInfo (IO ())

parser fcfg bcfg = info (subparser xs) $ progDesc (fcfg ^. FCfg.descA)
  where
    xs = probability fcfg bcfg <> quantity fcfg bcfg


probability :: FCfg.Config -> BCfg.Config -> Mod CommandFields (IO ())

probability fcfg bcfg = defineCmd (putStrLn <$> cmd) (fcfg ^. FCfg.nameP) (fcfg ^. FCfg.descP)
  where
    cmd = BCmd.probability bcfg
      <$> defineArg (fcfg ^. FCfg.helpH) (fcfg ^. FCfg.metaH)
      <*> defineArg (fcfg ^. FCfg.helpQ) (fcfg ^. FCfg.metaQ)


quantity :: FCfg.Config -> BCfg.Config -> Mod CommandFields (IO ())

quantity fcfg bcfg = defineCmd (putStrLn <$> cmd) (fcfg ^. FCfg.nameQ) (fcfg ^. FCfg.descQ)
  where
    cmd = BCmd.quantity bcfg
      <$> defineArg (fcfg ^. FCfg.helpH) (fcfg ^. FCfg.metaH)
      <*> defineArg (fcfg ^. FCfg.helpP) (fcfg ^. FCfg.metaP)