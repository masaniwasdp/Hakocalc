module Hakocalc.Probability.CommonSpec where

import Data.Maybe
import Hakocalc.Probability.Common
import Test.Hspec


spec :: Spec

spec = do
    describe "fromProbability & toProbability" $ do
        it "50%" $ (fromProbability . fromJust . toProbability) 0.5 `shouldBe` 0.5
        it "75.5%" $ (fromProbability . fromJust . toProbability) 0.755 `shouldBe` 0.755

    describe "Probability read" $ do
        it "50%" $ read "50" `shouldBe` justProbability 0.5
        it "75.5%" $ read "75.5" `shouldBe` justProbability 0.755

    describe "Probability show" $ do
        it "50%" $ (show . justProbability) 0.5 `shouldBe` "50.0"
        it "75.5%" $ (show . justProbability) 0.755 `shouldBe` "75.5"

    describe "combination" $ do
        it "0" $ combination 0 3 `shouldBe` 0
        it "126" $ combination 9 5 `shouldBe` 126

    describe "repeated" $ do
        it "1" $ repeated (justProbability 0) 0 0 `shouldBe` justProbability 1
        it "0" $ repeated (justProbability 0.5) 2 3 `shouldBe` justProbability 0
        it "0.8" $ repeated (justProbability 0.2) 1 0 `shouldBe` justProbability 0.8

    where
        justProbability = fromJust . toProbability
