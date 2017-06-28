module ProbabilitySpec (spec) where

import Test.Hspec

import Probability

combinationSpec = describe "combination" $ do
    it "0 3" $
        combination 0 3 `shouldBe` 0

    it "7 0" $
        combination 7 0 `shouldBe` 1

    it "9 5" $
        combination 9 5 `shouldBe` 126

repeatedSpec = describe "repeated" $ do
    it "0 0 0" $
        repeated 0 0 0 `shouldBe` 1

    it "(1 / 7) 1 1" $
        repeated (1 / 7) 1 1 `shouldBe` 1 / 7

    it "(1 / 5) 1 0" $
        repeated (1 / 5) 1 0 `shouldBe` 4 / 5

spec = do
    combinationSpec
    repeatedSpec
