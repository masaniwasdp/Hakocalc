module Hakocalc.Asset.Util where


import Control.Arrow (second)

import qualified Language.Haskell.TH as TH


type Property = (String, String)


readPropText :: String -> [Property]

readPropText = map proc . filter (/= "") . lines
  where
    proc = second (dropWhile (== ' ') . tail) . break (== ':')


definePropFn :: Property -> TH.Dec

definePropFn (k, v) = TH.FunD (TH.mkName k) [TH.Clause [] body []]
  where
    body = TH.NormalB . TH.LitE $ TH.StringL v