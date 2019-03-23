{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.CommandSpec where


import Control.Monad.State (execState)
import Hakocalc.Command
import Hakocalc.Entity.Probability (toProbability)
import Hakocalc.OutputMock (OutputMock (OutputMock), initMock)
import Test.Hspec


spec = do
  describe "commandP" $ do
    it "King Inora" $ do
      let action = commandP 5 5

      let result = OutputMock ([], [toProbability $ recip 16807], [])

      execState action initMock `shouldBe` result

    it "Pseudo" $ do
      let action = commandP 3 0

      let result = OutputMock ([], [toProbability 0], [])

      execState action initMock `shouldBe` result

  describe "commandQ" $ do
    it "King Inora" $ do
      let action = commandQ 5 (toProbability $ recip 16807)

      let result = OutputMock ([5], [], [])

      execState action initMock `shouldBe` result

    it "Pseudo" $ do
      let action = commandQ 0 (toProbability 1)

      let result = OutputMock ([], [], [()])

      execState action initMock `shouldBe` result