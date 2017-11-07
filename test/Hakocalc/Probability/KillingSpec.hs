module Hakocalc.Probability.KillingSpec where

import Data.Maybe (fromJust)
import Hakocalc.Probability.Common (toProbability)
import Hakocalc.Probability.Killing
import Test.Hspec


spec :: Spec

spec = do
  describe "killingProbability" $ do
    it "Ghost" $ killingProbability 1 1 `shouldBe` probability (1 / 7)
    it "Pseudo" $ killingProbability 0 3 `shouldBe` probability 1
    it "King" $ killingProbability 5 5 `shouldBe` probability (1 / 16807)

  describe "enoughMissiles" $ do
    it "Ghost" $ enoughMissiles 1 (probability $ 1 / 7) `shouldBe` Just 1
    it "Pseudo" $ enoughMissiles 1 (probability 1) `shouldBe` Nothing
    it "King" $ enoughMissiles 5 (probability $ 1 / 16807) `shouldBe` Just 5

  describe "probabilityTransition" $ do
    it "Ghost" $ probabilityTransition 1 1 2 `shouldBe` [probability $ 1 / 7, probability $ 13 / 49]
    it "Pseudo (1)" $ probabilityTransition 0 1 5 `shouldBe` replicate 5 (probability 1)
    it "Pseudo (2)" $ probabilityTransition 0 5 1 `shouldBe` []
    it "Dark" $ probabilityTransition 2 1 3 `shouldBe` [probability 0, probability $ 1 / 49, probability $ 19 / 343]

  where
    probability = fromJust . toProbability
