module HakoniwaKillingSpec (spec) where

import Test.Hspec

import HakoniwaKilling

spec = do
    describe "calcProbability" $ do
        it "1, 1" $
            calcProbability 1 1 `shouldBe` 1 / 7

        it "3, 2" $
            calcProbability 3 2 `shouldBe` 0

        it "5, 5" $
            calcProbability 5 5 `shouldBe` 1 / 16807

    describe "calcEnoughMissiles" $ do
        it "1, 1 / 7" $
            calcEnoughMissiles 1 (1 / 7) `shouldBe` 1

        it "1, 13 / 49" $
            calcEnoughMissiles 1 (13 / 49) `shouldBe` 2

        it "5, 1 / 16807" $
            calcEnoughMissiles 5 (1 / 16807) `shouldBe` 5

    describe "calcEnoughMissiles <=> calcProbability" $ do
        it "calcEnoughMissiles => calcProbability" $
            calcProbability 1 (calcEnoughMissiles 1 $ 1 / 7) `shouldBe` 1 / 7

        it "calcProbability => calcEnoughMissiles" $
            calcEnoughMissiles 5 (calcProbability 5 5) `shouldBe` 5
