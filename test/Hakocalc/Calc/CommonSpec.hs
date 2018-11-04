module Hakocalc.Calc.CommonSpec where


import Control.Exception (evaluate)
import Data.Maybe (fromJust)
import Hakocalc.Calc.Common
import Test.Hspec


spec :: Spec

spec = do
  toProbabilitySpec
  toProbabilityJustSpec
  fromProbabilitySpec
  readProbabilitySpec
  showProbabilitySpec
  combinationSpec
  repeatedSpec


toProbabilitySpec :: Spec

toProbabilitySpec = describe "toProbability" $ do
  it "50.0%" $
    toProbability 0.500 `shouldBe` Just (toProbabilityJust 0.500)

  it "75.5%" $
    toProbability 0.755 `shouldBe` Just (toProbabilityJust 0.755)

  it "Over 100%" $
    toProbability 1.200 `shouldBe` Nothing


toProbabilityJustSpec :: Spec

toProbabilityJustSpec = describe "toProbabilityJust" $ do
  it "50.0%" $
    toProbabilityJust 0.500 `shouldBe` fromJust (toProbability 0.500)

  it "75.5%" $
    toProbabilityJust 0.755 `shouldBe` fromJust (toProbability 0.755)

  it "Over 100%" $
    evaluate (toProbabilityJust 1.200) `shouldThrow` anyException


fromProbabilitySpec :: Spec

fromProbabilitySpec = describe "fromProbability" $ do
  it "50.0%" $
    fromProbability (toProbabilityJust 0.500) `shouldBe` 0.500

  it "75.5%" $
    fromProbability (toProbabilityJust 0.755) `shouldBe` 0.755


readProbabilitySpec :: Spec

readProbabilitySpec = describe "read Probability" $ do
  it "50.0%" $
    read "50.0" `shouldBe` toProbabilityJust 0.500

  it "75.5%" $
    read "75.5" `shouldBe` toProbabilityJust 0.755


showProbabilitySpec :: Spec

showProbabilitySpec = describe "show Probability" $ do
  it "50.0%" $
    show (toProbabilityJust 0.500) `shouldBe` "50.0"

  it "75.5%" $
    show (toProbabilityJust 0.755) `shouldBe` "75.5"


combinationSpec :: Spec

combinationSpec = describe "combination" $ do
  it "0" $
    combination 0 3 `shouldBe` 0

  it "126" $
    combination 9 5 `shouldBe` 126


repeatedSpec :: Spec

repeatedSpec = describe "repeated" $ do
  it "1.0" $
    repeated (toProbabilityJust 0.0) 0 0 `shouldBe` toProbabilityJust 1.0

  it "0.0" $
    repeated (toProbabilityJust 0.5) 2 3 `shouldBe` toProbabilityJust 0.0

  it "0.8" $
    repeated (toProbabilityJust 0.2) 1 0 `shouldBe` toProbabilityJust 0.8
