module Hakocalc.Controller.Command
  ( command
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.Calculator.Model (calculateP, calculateQ)
import Hakocalc.Controller.Config
import Hakocalc.Controller.Helper (defineArg, defineCmd)
import Options.Applicative (CommandFields, Mod, ParserInfo, info, progDesc, subparser)

import qualified Hakocalc.Calculator.Config as CalculatorConfig


command :: Config -> CalculatorConfig.Config -> ParserInfo (IO ())

command mcfg ccfg = info (subparser xs) $ progDesc (mcfg ^. descA)
  where
    xs = commandP mcfg ccfg <> commandQ mcfg ccfg


commandP :: Config -> CalculatorConfig.Config -> Mod CommandFields (IO ())

commandP mcfg ccfg = defineCmd (putStrLn <$> cmd) (mcfg ^. nameP) (mcfg ^. descP)
  where
    cmd = calculateP ccfg
      <$> defineArg (mcfg ^. helpH) (mcfg ^. metaH)
      <*> defineArg (mcfg ^. helpQ) (mcfg ^. metaQ)


commandQ :: Config -> CalculatorConfig.Config -> Mod CommandFields (IO ())

commandQ mcfg ccfg = defineCmd (putStrLn <$> cmd) (mcfg ^. nameQ) (mcfg ^. descQ)
  where
    cmd = calculateQ ccfg
      <$> defineArg (mcfg ^. helpH) (mcfg ^. metaH)
      <*> defineArg (mcfg ^. helpP) (mcfg ^. metaP)