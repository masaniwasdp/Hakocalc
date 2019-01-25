{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE TemplateHaskell #-}

module Hakocalc.Asset.Text where


import Hakocalc.Asset.Util
import Language.Haskell.TH


do
  xs <- runIO $ props <$> readFile "asset/text.prop"

  return $ map (uncurry funcs) xs
