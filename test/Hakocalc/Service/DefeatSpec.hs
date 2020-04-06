{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.Service.DefeatSpec where


import Hakocalc.Math.Probability (toProbability)
import Hakocalc.Service.Defeat
import Test.Hspec


spec = do
  describe "probability" $ do
    it "Inora Ghost" $
      probability 1 1 `shouldBe` (toProbability $ recip 7)

    it "King Inora" $
      probability 5 5 `shouldBe` (toProbability $ recip 16807)

    it "Pseudo 01" $
      probability 3 0 `shouldBe` toProbability 0

    it "Pseudo 02" $
      probability 0 3 `shouldBe` toProbability 1


  describe "missiles" $ do
    it "Inora Ghost" $
      missiles 1 (toProbability $ recip 7) `shouldBe` Just 1

    it "King Inora" $
      missiles 5 (toProbability $ recip 16807) `shouldBe` Just 5

    it "Pseudo 01" $
      missiles 1 (toProbability 0) `shouldBe` Nothing

    it "Pseudo 02" $
      missiles 0 (toProbability 1) `shouldBe` Nothing