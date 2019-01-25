{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE TemplateHaskell #-}

module Hakocalc.Asset.Text where


import Hakocalc.Asset.Util
import Language.Haskell.TH


do
  xs <- runIO $ parse <$> readFile "asset/text.prop"

  return $ map (uncurry define) xs
