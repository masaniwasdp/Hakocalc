{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.Presenter.Config where


import Control.Lens (makeFields)
import Data.Aeson.TH (defaultOptions, deriveJSON, fieldLabelModifier)
import Text.Casing (dropPrefix, fromAny, toKebab)


data Config = Config
  { _configRsltP :: String
  , _configRsltQ :: String
  , _configFailQ :: String
  }

makeFields ''Config

$(do
  let option = defaultOptions { fieldLabelModifier = toKebab . dropPrefix . fromAny }

  deriveJSON option ''Config)