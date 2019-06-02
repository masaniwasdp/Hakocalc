{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.CLI.Config where


import Control.Lens (makeFields)
import Data.Aeson.TH (defaultOptions, deriveJSON, fieldLabelModifier)
import Text.Casing (dropPrefix, fromAny, toKebab)

import qualified Hakocalc.App.Config as C


data Config = Config
  { _configDescA :: String
  , _configDescP :: String
  , _configDescQ :: String
  , _configNameP :: String
  , _configNameQ :: String
  , _configMetaH :: String
  , _configMetaP :: String
  , _configMetaQ :: String
  , _configHelpH :: String
  , _configHelpP :: String
  , _configHelpQ :: String
  , _configCmndC :: C.Config
  }

makeFields ''Config

$(do
  let option = defaultOptions { fieldLabelModifier = toKebab . dropPrefix . fromAny }

  deriveJSON option ''Config)