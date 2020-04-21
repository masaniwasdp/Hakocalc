{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.Presenter.CLI
  ( CLI
  , runCLI
  ) where


import Control.Lens ((^.))
import Control.Monad.State (lift)
import Control.Monad.Trans.Reader (ReaderT, ask, runReaderT)
import Hakocalc.Interface.Stdio (Stdio (putStrLn'))
import Hakocalc.Presenter.CLIConfig
import Text.Printf (printf)

import qualified Hakocalc.Command as Command


type CLI m = ReaderT CLIConfig m


instance Stdio m => Command.Presenter (CLI m) where
  printP rslt = do
    cfg <- ask

    let fval = (read $ show rslt) :: Double

    lift . putStrLn' $ printf (cfg ^. rsltP) fval

  printQ rslt = do
    cfg <- ask

    case rslt of
      Just x -> lift . putStrLn' $ printf (cfg ^. rsltQ) x

      _ -> lift . putStrLn' $ printf (cfg ^. failQ)


runCLI :: Stdio m => CLIConfig -> (CLI m) a -> m a

runCLI = flip runReaderT