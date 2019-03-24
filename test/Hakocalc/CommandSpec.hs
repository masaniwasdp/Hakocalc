{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.CommandSpec where


import Hakocalc.Command
import Hakocalc.Entity.Probability (toProbability)
import Hakocalc.OutputMock (OutputLog (..), OutputMock (..), run)
import Test.Hspec


spec = do
  describe "commandP" $ do
    it "King Inora" $ do
      let action = commandP 5 5

      let result = OutputMock [PLog $ toProbability (recip 16807)]

      run action `shouldBe` result

    it "Pseudo" $ do
      let action = commandP 3 0

      let result = OutputMock [PLog $ toProbability 0]

      run action `shouldBe` result

  describe "commandQ" $ do
    it "King Inora" $ do
      let action = commandQ 5 $ toProbability (recip 16807)

      let result = OutputMock [QLog 5]

      run action `shouldBe` result

    it "Pseudo" $ do
      let action = commandQ 0 $ toProbability 1

      let result = OutputMock [FLog]

      run action `shouldBe` result