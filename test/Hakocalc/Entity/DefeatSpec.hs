{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.Entity.DefeatSpec where


import Hakocalc.Entity.Defeat
import Hakocalc.Entity.Probability (toProbability)
import Test.Hspec


spec = do
  describe "defeatProbability" $ do
    it "Inora Ghost" $
      defeatProbability 1 1 `shouldBe` (toProbability $ recip 7)

    it "King Inora" $
      defeatProbability 5 5 `shouldBe` (toProbability $ recip 16807)

    it "Pseudo 01" $
      defeatProbability 3 0 `shouldBe` toProbability 0

    it "Pseudo 02" $
      defeatProbability 0 3 `shouldBe` toProbability 1


  describe "enoughMissiles" $ do
    it "Inora Ghost" $
      enoughMissiles 1 (toProbability $ recip 7) `shouldBe` Just 1

    it "King Inora" $
      enoughMissiles 5 (toProbability $ recip 16807) `shouldBe` Just 5

    it "Pseudo 01" $
      enoughMissiles 1 (toProbability 0) `shouldBe` Nothing

    it "Pseudo 02" $
      enoughMissiles 0 (toProbability 1) `shouldBe` Nothing