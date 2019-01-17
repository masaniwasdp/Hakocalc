{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.Entity.DefeatSpec where


import Hakocalc.Entity.Defeat
import Hakocalc.Entity.Probability (toProbabilityJust)
import Test.Hspec


spec = do
  defeatProbabilitySpec
  enoughMissilesSpec


defeatProbabilitySpec = describe "defeatProbability" $ do
  it "Inora Ghost" $
    defeatProbability 1 1 `shouldBe` (toProbabilityJust $ recip 7)

  it "King Inora" $
    defeatProbability 5 5 `shouldBe` (toProbabilityJust $ recip 16807)

  it "Pseudo 01" $
    defeatProbability 3 0 `shouldBe` toProbabilityJust 0

  it "Pseudo 02" $
    defeatProbability 0 3 `shouldBe` toProbabilityJust 1


enoughMissilesSpec = describe "enoughMissiles" $ do
  it "Inora Ghost" $
    enoughMissiles 1 (toProbabilityJust $ recip 7) `shouldBe` Just 1

  it "King Inora" $
    enoughMissiles 5 (toProbabilityJust $ recip 16807) `shouldBe` Just 5

  it "Pseudo 01" $
    enoughMissiles 1 (toProbabilityJust 0) `shouldBe` Nothing

  it "Pseudo 02" $
    enoughMissiles 0 (toProbabilityJust 1) `shouldBe` Nothing