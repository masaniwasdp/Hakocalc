module Hakocalc.Interface.Stdio
  ( Stdio
  , putStrLn'
  ) where


class Monad m => Stdio m where
  putStrLn' :: String -> m ()