{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.Asset.Util where


import Control.Arrow
import Language.Haskell.TH


props = map proc . filter (/= "") . lines
  where
    proc = second (dropWhile (== ' ') . tail) . break (== ':')


funcs k v = FunD (mkName k) [Clause [] body []]
  where
    body = NormalB . LitE $ StringL v