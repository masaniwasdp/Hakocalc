module HakoniwaKillingSpec (spec) where

import Test.Hspec

import HakoniwaKilling

killingProbabilitySpec :: Spec
killingProbabilitySpec = describe "killingProbability" $ do
    it "1 1" $ killingProbability 1 1
        `shouldBe` Just (1 / 7)

    it "0 3" $ killingProbability 0 3
        `shouldBe` Nothing

    it "5 5" $ killingProbability 5 5
        `shouldBe` Just (1 / 16807)

enoughMissilesSpec :: Spec
enoughMissilesSpec = describe "enoughMissiles" $ do
    it "1 (1 / 7)" $ enoughMissiles 1 (1 / 7)
        `shouldBe` Just 1

    it "1 1" $ enoughMissiles 1 1
        `shouldBe` Nothing

    it "5 (1 / 16807)" $ enoughMissiles 5 (1 / 16807)
        `shouldBe` Just 5

probabilityTransitionSpec :: Spec
probabilityTransitionSpec = describe "probabilityTransition" $ do
    it "1 1 2" $ probabilityTransition 1 1 2
        `shouldBe` Just [1 / 7, 13 / 49]

    it "0 1 5" $ probabilityTransition 0 1 5
        `shouldBe` Nothing

    it "2 1 3" $ probabilityTransition 2 1 3
        `shouldBe` Just [0, 1 / 49, 19 / 343]

spec :: Spec
spec = do
    killingProbabilitySpec
    enoughMissilesSpec
    probabilityTransitionSpec
