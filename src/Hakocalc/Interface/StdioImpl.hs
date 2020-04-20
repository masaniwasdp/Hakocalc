{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.Interface.StdioImpl
  ( StdioImpl
  ) where


import Hakocalc.Interface.Stdio (Stdio, putStrLn')


type StdioImpl = IO


instance Stdio StdioImpl where
  putStrLn' = putStrLn