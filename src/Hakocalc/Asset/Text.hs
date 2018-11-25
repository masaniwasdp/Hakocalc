{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE TemplateHaskell #-}

module Hakocalc.Asset.Text where


import Hakocalc.Asset.Util (parseText, textFunD)
import Language.Haskell.TH (runIO)


do
  xs <- runIO $ parseText <$> readFile "asset/text.prop"

  return $ map (uncurry textFunD) xs
