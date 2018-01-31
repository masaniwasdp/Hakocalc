module Hakocalc.Probability.KillingSpec where


import Hakocalc.Probability.Common (toProbabilityJust)
import Hakocalc.Probability.Killing
import Test.Hspec


spec = return () :: Spec
{-spec = do
  describe "killingProbability" $ do
    it "Ghost" $
      killingProbability 1 1 `shouldBe` probabilityA

    it "Pseudo" $
      killingProbability 0 3 `shouldBe` probabilityB

    it "King" $
      killingProbability 5 5 `shouldBe` probabilityC

  describe "enoughMissiles" $ do
    it "Ghost" $
      enoughMissiles 1 probabilityA `shouldBe` Just 1

    it "Pseudo" $
      enoughMissiles 1 probabilityB `shouldBe` Nothing

    it "King" $
      enoughMissiles 5 probabilityC `shouldBe` Just 5

  where
    probabilityA = toProbabilityJust $ 1 / 7

    probabilityB = toProbabilityJust 1

    probabilityC = toProbabilityJust $ 1 / 16807-}
