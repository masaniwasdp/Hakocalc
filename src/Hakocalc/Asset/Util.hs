{-|
 - Description : -
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Asset.Util
  ( parseText
  , textFunD
  )
  where


import Control.Arrow (second)

import qualified Language.Haskell.TH as TH


{-| -}
type TextPair = (String, String)


{-| -}
parseText :: String -> [TextPair]

parseText = map parseLine . filter (/= "") . lines


{-| -}
parseLine :: String -> TextPair

parseLine = second (dropWhile (== ' ') . tail) . break (== ':')


{-| -}
textFunD :: String -> String -> TH.Dec

textFunD n s = TH.FunD name [TH.Clause [] body []]
  where
    name = TH.mkName n

    body = TH.NormalB . TH.LitE $ TH.StringL s
