module ProbabilitySpec (spec) where

import Test.Hspec

import Probability

toPercentageSpec :: Spec
toPercentageSpec = describe "toPercentage" $ do
    it "1" $ toPercentage 1
        `shouldBe` 100

    it "1 / 2" $ toPercentage (1 / 2)
        `shouldBe` 50

    it "371 / 1000" $ toPercentage (371 / 1000)
        `shouldBe` 37.1

fromPercentageSpec :: Spec
fromPercentageSpec = describe "fromPercentage" $ do
    it "100" $ fromPercentage 100
        `shouldBe` 1

    it "50" $ fromPercentage 50
        `shouldBe` 1 / 2

    it "37.5" $ fromPercentage 37.5
        `shouldBe` 3 / 8

combinationSpec :: Spec
combinationSpec = describe "combination" $ do
    it "0 3" $ combination 0 3
        `shouldBe` Just 0

    it "7 (-1)" $ combination 7 (-1)
        `shouldBe` Nothing

    it "9 5" $ combination 9 5
        `shouldBe` Just 126

repeatedSpec :: Spec
repeatedSpec = describe "repeated" $ do
    it "0 0 0" $ repeated 0 0 0
        `shouldBe` Just 1

    it "(-1 / 7) 1 1" $ repeated (-1 / 7) 1 1
        `shouldBe` Nothing

    it "(1 / 5) 1 0" $ repeated (1 / 5) 1 0
        `shouldBe` (Just $ 4 / 5)

spec :: Spec
spec = do
    toPercentageSpec
    fromPercentageSpec
    combinationSpec
    repeatedSpec
