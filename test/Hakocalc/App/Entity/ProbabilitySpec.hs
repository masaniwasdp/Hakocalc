{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.App.Entity.ProbabilitySpec where


import Control.Exception (evaluate)
import Data.Maybe (fromJust)
import Hakocalc.App.Entity.Probability
import Test.Hspec


spec = do
  describe "Eq Probability" $ do
    describe "==" $ do
      it "==" $
        (toProbability 0.5 == toProbability 0.5) `shouldBe` True

      it "!=" $
        (toProbability 0.5 == toProbability 0.1) `shouldBe` False

    describe "/=" $ do
      it "==" $
        (toProbability 0.5 /= toProbability 0.5) `shouldBe` False

      it "!=" $
        (toProbability 0.5 /= toProbability 0.1) `shouldBe` True


  describe "Read Probability" $
    describe "read" $ do
      it "Valid 01" $
        read "50.0" `shouldBe` toProbability 0.5

      it "Valid 02" $
        read "75.5" `shouldBe` toProbability 0.755

      it "Invalid 01" $
        evaluate (read "Alice" :: Probability) `shouldThrow` anyException

      it "Invalid 02" $
        evaluate (read "50.0%" :: Probability) `shouldThrow` anyException


  describe "Show Probability" $
    describe "show" $ do
      it "Case 01" $
        show (toProbability 0.5) `shouldBe` "50.0"

      it "Case 02" $
        show (toProbability 0.755) `shouldBe` "75.5"


  describe "toProbabilityMaybe" $ do
    it "Valid 01" $
      toProbabilityMaybe 0 `shouldBe` Just (toProbability 0)

    it "Valid 02" $
      toProbabilityMaybe 0.755 `shouldBe` Just (toProbability 0.755)

    it "Valid 03" $
      toProbabilityMaybe 1 `shouldBe` Just (toProbability 1)

    it "Invalid 01" $
      toProbabilityMaybe 1.25 `shouldBe` Nothing

    it "Invalid 02" $
      toProbabilityMaybe (-1) `shouldBe` Nothing


  describe "toProbability" $ do
    it "Case 01" $
      toProbability 0 `shouldBe` fromJust (toProbabilityMaybe 0)

    it "Case 02" $
      toProbability 0.755 `shouldBe` fromJust (toProbabilityMaybe 0.755)

    it "Case 03" $
      toProbability 1 `shouldBe` fromJust (toProbabilityMaybe 1)


  describe "fromProbability" $ do
    it "Case 01" $
      fromProbability (toProbability 0) `shouldBe` 0

    it "Case 02" $
      fromProbability (toProbability 0.755) `shouldBe` 0.755

    it "Case 03" $
      fromProbability (toProbability 1) `shouldBe` 1
