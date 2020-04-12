{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.Controller.CLIConfig where


import Control.Lens (makeLenses)
import Data.Aeson.TH (defaultOptions, deriveJSON, fieldLabelModifier)
import Text.Casing (fromAny, toKebab)


data CLIConfig = CLIConfig
  { _descA :: String
  , _descP :: String
  , _descQ :: String
  , _nameP :: String
  , _nameQ :: String
  , _metaH :: String
  , _metaP :: String
  , _metaQ :: String
  , _helpH :: String
  , _helpP :: String
  , _helpQ :: String
  }

makeLenses ''CLIConfig

$(do
  let option = defaultOptions { fieldLabelModifier = toKebab . fromAny }

  deriveJSON option ''CLIConfig)