module HakoniwaKillingSpec (spec) where

import Test.Hspec

import HakoniwaKilling

killingProbabilitySpec :: Spec
killingProbabilitySpec = describe "killingProbability" $ do
    it "Ghost" $ killingProbability 1 1
        `shouldBe` Just (1 / 7)

    it "Impossible" $ killingProbability 0 3
        `shouldBe` Nothing

    it "King" $ killingProbability 5 5
        `shouldBe` Just (1 / 16807)

enoughMissilesSpec :: Spec
enoughMissilesSpec = describe "enoughMissiles" $ do
    it "Ghost" $ enoughMissiles 1 (1 / 7)
        `shouldBe` Just 1

    it "Impossible" $ enoughMissiles 1 1
        `shouldBe` Nothing

    it "King" $ enoughMissiles 5 (1 / 16807)
        `shouldBe` Just 5

probabilityTransitionSpec :: Spec
probabilityTransitionSpec = describe "probabilityTransition" $ do
    it "Ghost" $ probabilityTransition 1 1 2
        `shouldBe` Just [1 / 7, 13 / 49]

    it "Impossible" $ probabilityTransition 0 1 5
        `shouldBe` Nothing

    it "Dark" $ probabilityTransition 2 1 3
        `shouldBe` Just [0, 1 / 49, 19 / 343]

spec :: Spec
spec = do
    killingProbabilitySpec
    enoughMissilesSpec
    probabilityTransitionSpec
