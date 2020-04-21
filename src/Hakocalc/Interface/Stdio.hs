{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.Interface.Stdio
  ( Stdio
  , StdioImpl
  , putStrLn'
  ) where


class Monad m => Stdio m where
  putStrLn' :: String -> m ()


type StdioImpl = IO


instance Stdio StdioImpl where
  putStrLn' = putStrLn