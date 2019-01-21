module Hakocalc.Asset.Util
  ( definePropFn
  , readPropText
  ) where


import Control.Arrow (second)

import Language.Haskell.TH as TH


type Property = (String, String)


readPropText :: String -> [Property]

readPropText = map proc . filter (/= "") . lines
  where
    proc = second (dropWhile (== ' ') . tail) . break (== ':')


definePropFn :: Property -> TH.Dec

definePropFn (n, s) = TH.FunD (TH.mkName n) [TH.Clause [] body []]
  where
    body = TH.NormalB . TH.LitE $ TH.StringL s