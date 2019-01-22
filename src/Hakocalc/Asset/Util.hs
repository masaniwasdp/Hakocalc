module Hakocalc.Asset.Util where


import Control.Arrow
import Language.Haskell.TH


type Property = (String, String)


readPropText :: String -> [Property]

readPropText = map proc . filter (/= "") . lines
  where
    proc = second (dropWhile (== ' ') . tail) . break (== ':')


definePropFn :: Property -> Dec

definePropFn (k, v) = FunD (mkName k) [Clause [] body []]
  where
    body = NormalB . LitE $ StringL v