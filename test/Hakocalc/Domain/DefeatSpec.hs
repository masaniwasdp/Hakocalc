{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.Domain.DefeatSpec where


import Hakocalc.Domain.Defeat
import Hakocalc.Domain.Probability (Probability, toProbabilityJust)
import Test.Hspec


spec = sequence_ specList


specList =
  [ defeatProbabilitySpec
  , enoughMissilesSpec
  ]


defeatProbabilitySpec = describe "defeatProbability" $ do
  it "Inora-Ghost" $
    defeatProbability 1 1 `shouldBe` toRecipProbability 7

  it "Pseudo" $
    defeatProbability 0 3 `shouldBe` toRecipProbability 1

  it "King-Inora" $
    defeatProbability 5 5 `shouldBe` toRecipProbability 16807


enoughMissilesSpec = describe "enoughMissiles" $ do
  it "Inora-Ghost" $
    enoughMissiles 1 (toRecipProbability 7) `shouldBe` Just 1

  it "Pseudo" $
    enoughMissiles 1 (toRecipProbability 1) `shouldBe` Nothing

  it "King-Inora" $
    enoughMissiles 5 (toRecipProbability 16807) `shouldBe` Just 5


toRecipProbability :: Rational -> Probability

toRecipProbability = toProbabilityJust . recip
