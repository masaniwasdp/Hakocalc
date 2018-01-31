module Hakocalc.Probability.CommonSpec where

import Data.Maybe (fromJust)
import Hakocalc.Probability.Common
import Test.Hspec


spec :: Spec

spec = return ()
{-spec = do
  describe "toProbability" $ do
    it "50%" $ toProbability 0.5 `shouldNotBe` Nothing
    it "75.5%" $ toProbability 0.755 `shouldNotBe` Nothing
    it "120%" $ toProbability 1.2 `shouldBe` Nothing

  describe "fromProbability" $ do
    it "50%" $ (fromProbability . probability) 0.5 `shouldBe` 0.5
    it "75.5%" $ (fromProbability . probability) 0.755 `shouldBe` 0.755

  describe "Probability read" $ do
    it "50%" $ read "50" `shouldBe` probability 0.5
    it "75.5%" $ read "75.5" `shouldBe` probability 0.755

  describe "Probability show" $ do
    it "50%" $ (show . probability) 0.5 `shouldBe` "50.0"
    it "75.5%" $ (show . probability) 0.755 `shouldBe` "75.5"

  describe "combination" $ do
    it "0" $ combination 0 3 `shouldBe` 0
    it "126" $ combination 9 5 `shouldBe` 126

  describe "repeated" $ do
    it "1" $ repeated (probability 0) 0 0 `shouldBe` probability 1
    it "0" $ repeated (probability 0.5) 2 3 `shouldBe` probability 0
    it "0.8" $ repeated (probability 0.2) 1 0 `shouldBe` probability 0.8

  where
    probability = fromJust . toProbability-}
