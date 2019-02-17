module Hakocalc.Asset.Util
  ( genText
  ) where


import qualified Language.Haskell.TH as TH


genText :: String -> String -> TH.Dec

genText n v = TH.FunD (TH.mkName n) [TH.Clause [] body []]
  where
    body = TH.NormalB . TH.LitE $ TH.StringL v