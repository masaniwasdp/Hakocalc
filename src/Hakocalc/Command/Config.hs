{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.Command.Config where


import Control.Lens (makeFields)
import Data.Aeson.TH (defaultOptions, deriveJSON, fieldLabelModifier)
import Text.Casing (dropPrefix, fromAny, toKebab)


data Config = Config
  { _configFormatP :: String
  , _configFormatQ :: String
  , _configNoticeQ :: String
  }

makeFields ''Config

$(do
  let option = defaultOptions { fieldLabelModifier = toKebab . dropPrefix . fromAny }

  deriveJSON option ''Config)