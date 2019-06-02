{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.App.CommandConfig where


import Control.Lens (makeFields)
import Data.Aeson.TH (defaultOptions, deriveJSON, fieldLabelModifier)
import Text.Casing (dropPrefix, fromAny, toKebab)


data CommandConfig = CommandConfig
  { _commandConfigFormatP :: String
  , _commandConfigFormatQ :: String
  , _commandConfigNoticeQ :: String
  }

makeFields ''CommandConfig

$(do
  let option = defaultOptions { fieldLabelModifier = toKebab . dropPrefix . dropPrefix . fromAny }

  deriveJSON option ''CommandConfig)