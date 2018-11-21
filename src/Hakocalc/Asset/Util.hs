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


import Control.Arrow (first, second)

import qualified Language.Haskell.TH as TH


{-| -}
type TextPair = (String, String)


{-| -}
parseText :: String -> [TextPair]

parseText = map parseLine . filter (/= "") . lines


{-| -}
parseLine :: String -> TextPair

parseLine = second (dropWhile (== ' '))
  . first (init . map toUnder)
  . break (== ' ')


{-| -}
toUnder :: Char -> Char

toUnder c = if c == '-' then '_' else c


{-| -}
textFunD :: String -> String -> TH.Dec

textFunD n s = TH.FunD name [TH.Clause [] body []]
  where
    name = TH.mkName n

    body = TH.NormalB . TH.LitE $ TH.StringL s
