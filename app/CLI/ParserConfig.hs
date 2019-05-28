{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeSynonymInstances #-}

module CLI.ParserConfig where


import Control.Lens (makeFields)
import Data.Aeson.TH (defaultOptions, deriveJSON)
import Hakocalc.App.CommandConfig (CommandConfig)


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

$(deriveJSON defaultOptions ''ParserConfig)