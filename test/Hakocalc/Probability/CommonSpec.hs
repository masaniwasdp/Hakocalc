module Hakocalc.Probability.CommonSpec where


import Control.Exception (evaluate)
import Data.Maybe (fromJust)
import Hakocalc.Probability.Common
import Test.Hspec


spec :: Spec

spec = do
  describe "toProbability" $ do
    it "50%" $
      toProbability 0.5 `shouldNotBe` Nothing

    it "75.5%" $
      toProbability 0.755 `shouldNotBe` Nothing

    it "120%" $
      toProbability 1.2 `shouldBe` Nothing

  describe "toProbabilityJust" $ do
    it "50%" $
      toProbabilityJust 0.5 `shouldBe` fromJust (toProbability 0.5)

    it "75.5%" $
      toProbabilityJust 0.755 `shouldBe` fromJust (toProbability 0.755)

    it "120%" $
      evaluate (toProbabilityJust 1.2) `shouldThrow` anyException

  describe "fromProbability" $ do
    it "50%" $
      fromProbability (toProbabilityJust 0.5) `shouldBe` 0.5

    it "75.5%" $
      fromProbability (toProbabilityJust 0.755) `shouldBe` 0.755

  describe "Read Probability" $
    describe "read" $ do
      it "50%" $
        read "50" `shouldBe` toProbabilityJust 0.5

      it "75.5%" $
        read "75.5" `shouldBe` toProbabilityJust 0.755

  describe "Show Probability" $
    describe "show" $ do
      it "50%" $
        show (toProbabilityJust 0.5) `shouldBe` "50.0"

      it "75.5%" $
        show (toProbabilityJust 0.755) `shouldBe` "75.5"

  describe "combination" $ do
    it "0" $
      combination 0 3 `shouldBe` 0

    it "126" $
      combination 9 5 `shouldBe` 126

  describe "repeated" $ do
    it "1" $
      repeated (toProbabilityJust 0) 0 0 `shouldBe` toProbabilityJust 1

    it "0" $
      repeated (toProbabilityJust 0.5) 2 3 `shouldBe` toProbabilityJust 0

    it "0.8" $
      repeated (toProbabilityJust 0.2) 1 0 `shouldBe` toProbabilityJust 0.8
