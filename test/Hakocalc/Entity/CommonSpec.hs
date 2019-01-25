{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.Entity.CommonSpec where


import Hakocalc.Entity.Common
import Hakocalc.Entity.Probability (toProbabilityJust)
import Test.Hspec


spec = do
  describe "combination" $ do
    it "0" $
      combination 0 3 `shouldBe` 0

    it "1" $
      combination 4 4 `shouldBe` 1

    it "126" $
      combination 9 5 `shouldBe` 126


  describe "repeated" $ do
    it "1" $
      repeated (toProbabilityJust 0) 0 0 `shouldBe` toProbabilityJust 1

    it "0" $
      repeated (toProbabilityJust 1) 2 3 `shouldBe` toProbabilityJust 0

    it "0.8" $
      repeated (toProbabilityJust 0.2) 1 0 `shouldBe` toProbabilityJust 0.8
