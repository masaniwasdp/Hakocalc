{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.App.CommandConfig where


import Control.Lens (makeFields)
import Data.Aeson.TH (defaultOptions, deriveJSON)


data CommandConfig = CommandConfig
  { _commandConfigFmtP :: String
  , _commandConfigFmtQ :: String
  , _commandConfigTxtF :: String
  }

makeFields ''CommandConfig

$(deriveJSON defaultOptions ''CommandConfig)