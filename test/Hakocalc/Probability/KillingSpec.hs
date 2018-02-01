module Hakocalc.Probability.KillingSpec where


import Hakocalc.Probability.Common (toProbabilityJust)
import Hakocalc.Probability.Killing
import Test.Hspec


spec :: Spec

spec = do
  describe "killingProbability" $ do
    it "Ghost" $
      killingProbability 1 1
        `shouldBe` toProbabilityJust (recip 7)

    it "Pseudo" $
      killingProbability 0 3
        `shouldBe` toProbabilityJust 1

    it "King" $
      killingProbability 5 5
        `shouldBe` toProbabilityJust (recip 16807)

  describe "enoughMissiles" $ do
    it "Ghost" $
      enoughMissiles 1 (toProbabilityJust . recip $ 7)
        `shouldBe` Just 1

    it "Pseudo" $
      enoughMissiles 1 (toProbabilityJust 1)
        `shouldBe` Nothing

    it "King" $
      enoughMissiles 5 (toProbabilityJust . recip $ 16807)
        `shouldBe` Just 5
