module HakoniwaKillingSpec (spec) where

import Test.Hspec

import HakoniwaKilling

killingProbabilitySpec = describe "killingProbability" $ do
    it "1 1" $
        killingProbability 1 1 `shouldBe` 1 / 7

    it "3 2" $
        killingProbability 3 2 `shouldBe` 0

    it "5 5" $
        killingProbability 5 5 `shouldBe` 1 / 16807

enoughMissilesSpec = describe "enoughMissiles" $ do
    it "1 (1 / 7)" $
        enoughMissiles 1 (1 / 7) `shouldBe` 1

    it "1 (13 / 49)" $
        enoughMissiles 1 (13 / 49) `shouldBe` 2

    it "5 (1 / 16807)" $
        enoughMissiles 5 (1 / 16807) `shouldBe` 5

spec = do
    killingProbabilitySpec
    enoughMissilesSpec
