module Hakocalc.Controller.Request
  ( Environment
  , environment
  , execute
  ) where


import Control.Lens ((^.))
import Data.Semigroup ((<>))
import Hakocalc.Calculator.IPresenter (IPresenter)
import Hakocalc.Calculator.Model (Model, calculateP, calculateQ)
import Hakocalc.Controller.Config
import Hakocalc.Controller.Helper (defineArg, defineCmd)
import Options.Applicative (CommandFields, Mod, ParserInfo, info, progDesc, subparser)


data Environment a = Environment Config (Model a)


environment :: IPresenter a => Config -> Model a -> Environment a

environment = Environment


execute :: IPresenter a => Environment a -> ParserInfo (IO ())

execute env@(Environment cfg _) = info (subparser xs) $ progDesc (cfg ^. descA)
  where
    xs = requestP env <> requestQ env


requestP :: IPresenter a => Environment a -> Mod CommandFields (IO ())

requestP (Environment cfg calculator) = defineCmd action (cfg ^. nameP) (cfg ^. descP)
  where
    action = calculateP calculator
      <$> defineArg (cfg ^. helpH) (cfg ^. metaH)
      <*> defineArg (cfg ^. helpQ) (cfg ^. metaQ)


requestQ :: IPresenter a => Environment a -> Mod CommandFields (IO ())

requestQ (Environment cfg calculator) = defineCmd action (cfg ^. nameQ) (cfg ^. descQ)
  where
    action = calculateQ calculator
      <$> defineArg (cfg ^. helpH) (cfg ^. metaH)
      <*> defineArg (cfg ^. helpP) (cfg ^. metaP)