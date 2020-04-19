{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.Presenter.CLI
  ( CLI
  , runCLI
  ) where


import Control.Lens ((^.))
import Control.Monad.State (liftIO)
import Control.Monad.Trans.Reader (ReaderT, ask, runReaderT)
import Hakocalc.Presenter.CLIConfig
import Text.Printf (printf)

import qualified Hakocalc.Command as Command


type CLI = ReaderT CLIConfig IO


instance Command.Presenter CLI where
  printP rslt = do
    cfg <- ask

    let fval = (read $ show rslt) :: Double

    liftIO $ printf (cfg ^. rsltP) fval

  printQ rslt = do
    cfg <- ask

    case rslt of
      Just x -> liftIO $ printf (cfg ^. rsltQ) x

      _ -> liftIO $ printf (cfg ^. failQ)


runCLI :: CLIConfig -> CLI a -> IO a

runCLI = flip runReaderT