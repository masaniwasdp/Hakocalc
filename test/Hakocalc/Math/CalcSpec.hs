{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.Math.CalcSpec where


import Hakocalc.Math.Calc
import Hakocalc.Math.Probability (toProbability)
import Test.Hspec


spec = do
  describe "combination" $ do
    it "Case 01" $
      combination 0 3 `shouldBe` 0

    it "Case 02" $
      combination 4 4 `shouldBe` 1

    it "Case 03" $
      combination 9 5 `shouldBe` 126


  describe "repeated" $ do
    it "Case 01" $
      repeated (toProbability 0) 0 0 `shouldBe` toProbability 1

    it "Case 02" $
      repeated (toProbability 1) 2 3 `shouldBe` toProbability 0

    it "Case 03" $
      repeated (toProbability 0.2) 1 0 `shouldBe` toProbability 0.8
