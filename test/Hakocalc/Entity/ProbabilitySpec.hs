{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.Entity.ProbabilitySpec where


import Control.Exception (evaluate)
import Data.Maybe (fromJust)
import Hakocalc.Entity.Probability
import Test.Hspec


spec = do
  readProbabilitySpec
  showProbabilitySpec
  toProbabilitySpec
  toProbabilityJustSpec
  fromProbabilitySpec


readProbabilitySpec = describe "Read Probability" $
  describe "read" $ do
    it "50%" $
      read "50.0" `shouldBe` toProbabilityJust 0.5

    it "75.5%" $
      read "75.5" `shouldBe` toProbabilityJust 0.755


showProbabilitySpec = describe "Show Probability" $
  describe "show" $ do
    it "50%" $
      show (toProbabilityJust 0.5) `shouldBe` "50.0"

    it "75.5%" $
      show (toProbabilityJust 0.755) `shouldBe` "75.5"


toProbabilitySpec = describe "toProbability" $ do
  it "50%" $
    toProbability 0.5 `shouldBe` Just (toProbabilityJust 0.5)

  it "75.5%" $
    toProbability 0.755 `shouldBe` Just (toProbabilityJust 0.755)

  it "Over" $
    (toProbability 1.2) `shouldBe` Nothing

  it "Under" $
    (toProbability $ -0.2) `shouldBe` Nothing


toProbabilityJustSpec = describe "toProbabilityJust" $ do
  it "50%" $
    toProbabilityJust 0.5 `shouldBe` fromJust (toProbability 0.5)

  it "75.5%" $
    toProbabilityJust 0.755 `shouldBe` fromJust (toProbability 0.755)

  it "Over" $
    evaluate (toProbabilityJust 1.2) `shouldThrow` anyException

  it "Under" $
    evaluate (toProbabilityJust $ -0.2) `shouldThrow` anyException


fromProbabilitySpec = describe "fromProbability" $ do
  it "50%" $
    fromProbability (toProbabilityJust 0.5) `shouldBe` 0.5

  it "75.5%" $
    fromProbability (toProbabilityJust 0.755) `shouldBe` 0.755
