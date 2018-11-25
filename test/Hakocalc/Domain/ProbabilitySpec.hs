{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.Domain.ProbabilitySpec where


import Control.Exception (evaluate)
import Data.Maybe (fromJust)
import Hakocalc.Domain.Probability
import Test.Hspec


spec = sequence_ specList


specList =
  [ readProbabilitySpec
  , showProbabilitySpec
  , toProbabilitySpec
  , toProbabilityJustSpec
  , fromProbabilitySpec
  ]


readProbabilitySpec = describe "Read Probability" $
  describe "read" $ do
    it "50.0%" $
      read "50.0" `shouldBe` toProbabilityJust 0.500

    it "75.5%" $
      read "75.5" `shouldBe` toProbabilityJust 0.755


showProbabilitySpec = describe "Show Probability" $
  describe "show" $ do
    it "50.0%" $
      show (toProbabilityJust 0.500) `shouldBe` "50.0"

    it "75.5%" $
      show (toProbabilityJust 0.755) `shouldBe` "75.5"


toProbabilitySpec = describe "toProbability" $ do
  it "50.0%" $
    toProbability 0.500 `shouldBe` Just (toProbabilityJust 0.500)

  it "75.5%" $
    toProbability 0.755 `shouldBe` Just (toProbabilityJust 0.755)

  it "Over 100%" $
    toProbability 1.200 `shouldBe` Nothing


toProbabilityJustSpec = describe "toProbabilityJust" $ do
  it "50.0%" $
    toProbabilityJust 0.500 `shouldBe` fromJust (toProbability 0.500)

  it "75.5%" $
    toProbabilityJust 0.755 `shouldBe` fromJust (toProbability 0.755)

  it "Over 100%" $
    evaluate (toProbabilityJust 1.200) `shouldThrow` anyException


fromProbabilitySpec = describe "fromProbability" $ do
  it "50.0%" $
    fromProbability (toProbabilityJust 0.500) `shouldBe` 0.500

  it "75.5%" $
    fromProbability (toProbabilityJust 0.755) `shouldBe` 0.755
