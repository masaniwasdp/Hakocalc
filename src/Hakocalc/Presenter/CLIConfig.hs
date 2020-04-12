{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.Presenter.CLIConfig where


import Control.Lens (makeLenses)
import Data.Aeson.TH (defaultOptions, deriveJSON, fieldLabelModifier)
import Text.Casing (fromAny, toKebab)


data CLIConfig = CLIConfig
  { _rsltP :: String
  , _rsltQ :: String
  , _failQ :: String
  }

makeLenses ''CLIConfig

$(do
  let option = defaultOptions { fieldLabelModifier = toKebab . fromAny }

  deriveJSON option ''CLIConfig)