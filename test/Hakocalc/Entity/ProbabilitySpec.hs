{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.Entity.ProbabilitySpec where


import Control.Exception (evaluate)
import Data.Maybe (fromJust)
import Hakocalc.Entity.Probability
import Test.Hspec


spec = do
  describe "Eq Probability" $
    describe "==" $ do
      it "True" $
        (toProbability 0.5 == toProbability 0.5) `shouldBe` True

      it "False" $
        (toProbability 0.5 == toProbability 0.1) `shouldBe` False


  describe "Ord Probability" $
    describe "<=" $ do
      it "True 01" $
        (toProbability 0.5 <= toProbability 0.9) `shouldBe` True

      it "True 02" $
        (toProbability 0.5 <= toProbability 0.5) `shouldBe` True

      it "False" $
        (toProbability 0.5 <= toProbability 0.1) `shouldBe` False


  describe "Read Probability" $
    describe "read" $ do
      it "50%" $
        read "50.0" `shouldBe` toProbability 0.5

      it "75.5%" $
        read "75.5" `shouldBe` toProbability 0.755

      it "Invalid 01" $
        evaluate (read "Alice" :: Probability) `shouldThrow` anyException

      it "Invalid 02" $
        evaluate (read "50.0%" :: Probability) `shouldThrow` anyException


  describe "Show Probability" $
    describe "show" $ do
      it "50%" $
        show (toProbability 0.5) `shouldBe` "50.0"

      it "75.5%" $
        show (toProbability 0.755) `shouldBe` "75.5"


  describe "toProbabilityMaybe" $ do
    it "0%" $
      toProbabilityMaybe 0 `shouldBe` Just (toProbability 0)

    it "75.5%" $
      toProbabilityMaybe 0.755 `shouldBe` Just (toProbability 0.755)

    it "100%" $
      toProbabilityMaybe 1 `shouldBe` Just (toProbability 1)

    it "Over" $
      toProbabilityMaybe 1.25 `shouldBe` Nothing

    it "Under" $
      toProbabilityMaybe (-1) `shouldBe` Nothing


  describe "toProbability" $ do
    it "0%" $
      toProbability 0 `shouldBe` fromJust (toProbabilityMaybe 0)

    it "75.5%" $
      toProbability 0.755 `shouldBe` fromJust (toProbabilityMaybe 0.755)

    it "100%" $
      toProbability 1 `shouldBe` fromJust (toProbabilityMaybe 1)


  describe "fromProbability" $ do
    it "0%" $
      fromProbability (toProbability 0) `shouldBe` 0

    it "75.5%" $
      fromProbability (toProbability 0.755) `shouldBe` 0.755

    it "100%" $
      fromProbability (toProbability 1) `shouldBe` 1
