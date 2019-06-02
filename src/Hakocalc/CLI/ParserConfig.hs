{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.CLI.ParserConfig where


import Control.Lens (makeFields)
import Data.Aeson.TH (defaultOptions, deriveJSON, fieldLabelModifier)
import Hakocalc.App.CommandConfig (CommandConfig)
import Text.Casing (dropPrefix, fromAny, toKebab)


data ParserConfig = ParserConfig
  { _parserConfigDescA :: String
  , _parserConfigDescP :: String
  , _parserConfigDescQ :: String
  , _parserConfigNameP :: String
  , _parserConfigNameQ :: String
  , _parserConfigMetaH :: String
  , _parserConfigMetaP :: String
  , _parserConfigMetaQ :: String
  , _parserConfigHelpH :: String
  , _parserConfigHelpP :: String
  , _parserConfigHelpQ :: String
  , _parserConfigCmndC :: CommandConfig
  }

makeFields ''ParserConfig

$(do
  let option = defaultOptions { fieldLabelModifier = toKebab . dropPrefix . dropPrefix . fromAny }

  deriveJSON option ''ParserConfig)