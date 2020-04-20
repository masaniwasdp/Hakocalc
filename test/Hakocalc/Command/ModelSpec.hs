{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Hakocalc.Command.ModelSpec where


import Control.Monad.State (State, execState, modify)
import Hakocalc.Command.DefeatProbability (Probability, Quantity)
import Hakocalc.Command.Model
import Hakocalc.Command.Presenter (Presenter, printP, printQ)
import Hakocalc.Math.Probability (toProbability)
import Test.Hspec


type PresenterMock = State ([Probability], [Maybe Quantity])


instance Presenter PresenterMock where
  printP rslt = modify $ \ (p, q) -> (rslt : p, q)

  printQ rslt = modify $ \ (p, q) -> (p, rslt : q)


runPresenterMock = (flip execState) s
  where
    s = ([], []) :: ([Probability], [Maybe Quantity])


spec = do
  describe "calculateP" $ do
    it "Inora Ghost" $
      runPresenterMock (calculateP modelImpl 1 1) `shouldBe` ([toProbability $ recip 7], [])

    it "King Inora" $
      runPresenterMock (calculateP modelImpl 5 5) `shouldBe` ([toProbability $ recip 16807], [])

    it "Pseudo 01" $
      runPresenterMock (calculateP modelImpl 3 0) `shouldBe` ([toProbability 0], [])

    it "Pseudo 02" $
      runPresenterMock (calculateP modelImpl 0 3) `shouldBe` ([toProbability 1], [])


  describe "calculateQ" $ do
    it "Inora Ghost" $
      runPresenterMock (calculateQ modelImpl 1 (toProbability $ recip 7)) `shouldBe` ([], [Just 1])

    it "King Inora" $
      runPresenterMock (calculateQ modelImpl 5 (toProbability $ recip 16807)) `shouldBe` ([], [Just 5])

    it "Pseudo 01" $
      runPresenterMock (calculateQ modelImpl 1 (toProbability 0)) `shouldBe` ([], [Nothing])

    it "Pseudo 02" $
      runPresenterMock (calculateQ modelImpl 0 (toProbability 1)) `shouldBe` ([], [Nothing])