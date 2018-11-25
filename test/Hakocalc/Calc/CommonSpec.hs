{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.Calc.CommonSpec where


import Hakocalc.Calc.Common
import Hakocalc.Calc.Probability (toProbabilityJust)
import Test.Hspec


spec = sequence_ specList


specList =
  [ combinationSpec
  , repeatedSpec
  ]


combinationSpec = describe "combination" $ do
  it "0" $
    combination 0 3 `shouldBe` 0

  it "126" $
    combination 9 5 `shouldBe` 126


repeatedSpec = describe "repeated" $ do
  it "1.0" $
    repeated (toProbabilityJust 0.0) 0 0 `shouldBe` toProbabilityJust 1.0

  it "0.0" $
    repeated (toProbabilityJust 0.5) 2 3 `shouldBe` toProbabilityJust 0.0

  it "0.8" $
    repeated (toProbabilityJust 0.2) 1 0 `shouldBe` toProbabilityJust 0.8
