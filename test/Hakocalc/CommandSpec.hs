{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.CommandSpec where


import Control.Monad.State (execState)
import Hakocalc.Command
import Hakocalc.Entity.Probability (toProbability)
import Hakocalc.OutputLog (LogData (DataF, DataP, DataQ))
import Test.Hspec


spec = do
  describe "commandP" $ do
    it "King Inora" $
      execState (commandP 5 5) [] `shouldBe` [DataP $ toProbability (recip 16807)]

    it "Pseudo" $
      execState (commandP 3 0) [] `shouldBe` [DataP $ toProbability 0]

  describe "commandQ" $ do
    it "King Inora" $
      execState (commandQ 5 $ toProbability (recip 16807)) [] `shouldBe` [DataQ 5]

    it "Pseudo" $
      execState (commandQ 0 $ toProbability 1) [] `shouldBe` [DataF]