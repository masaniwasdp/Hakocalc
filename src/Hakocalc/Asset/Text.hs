{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE TemplateHaskell #-}

module Hakocalc.Asset.Text where


import Hakocalc.Asset.Util (definePropFn, readPropText)
import Language.Haskell.TH (runIO)


do
  xs <- runIO $ readPropText <$> readFile "asset/text.prop"

  return $ map definePropFn xs
