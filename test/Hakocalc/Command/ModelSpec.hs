{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Hakocalc.Command.ModelSpec where


import Data.IORef (IORef, newIORef, readIORef, writeIORef)
import Hakocalc.Command.DefeatProbability (Probability, Quantity)
import Hakocalc.Command.IPresenter (IPresenter (..))
import Hakocalc.Command.Model
import Hakocalc.Math.Probability (toProbability)
import Test.Hspec


data Presenter = Presenter (IORef [Probability]) (IORef [Maybe Quantity])


instance IPresenter Presenter where
  printP (Presenter refp _) rslt = writeIORef refp =<< (rslt :) <$> readIORef refp

  printQ (Presenter _ refq) rslt = writeIORef refq =<< (rslt :) <$> readIORef refq


spec = do
  describe "calculateP" $ do
    it "Inora Ghost" $ do
      p <- newIORef []
      q <- newIORef []

      calculateP (model $ Presenter p q) 1 1

      readIORef p `shouldReturn` [toProbability $ recip 7]
      readIORef q `shouldReturn` []

    it "King Inora" $ do
      p <- newIORef []
      q <- newIORef []

      calculateP (model $ Presenter p q) 5 5

      readIORef p `shouldReturn` [toProbability $ recip 16807]
      readIORef q `shouldReturn` []

    it "Pseudo 01" $ do
      p <- newIORef []
      q <- newIORef []

      calculateP (model $ Presenter p q) 3 0

      readIORef p `shouldReturn` [toProbability 0]
      readIORef q `shouldReturn` []

    it "Pseudo 02" $ do
      p <- newIORef []
      q <- newIORef []

      calculateP (model $ Presenter p q) 0 3

      readIORef p `shouldReturn` [toProbability 1]
      readIORef q `shouldReturn` []


  describe "calculateQ" $ do
    it "Inora Ghost" $ do
      p <- newIORef []
      q <- newIORef []

      calculateQ (model $ Presenter p q) 1 (toProbability $ recip 7)

      readIORef p `shouldReturn` []
      readIORef q `shouldReturn` [Just 1]

    it "King Inora" $ do
      p <- newIORef []
      q <- newIORef []

      calculateQ (model $ Presenter p q) 5 (toProbability $ recip 16807)

      readIORef p `shouldReturn` []
      readIORef q `shouldReturn` [Just 5]

    it "Pseudo 01" $ do
      p <- newIORef []
      q <- newIORef []

      calculateQ (model $ Presenter p q) 1 (toProbability 0)

      readIORef p `shouldReturn` []
      readIORef q `shouldReturn` [Nothing]

    it "Pseudo 02" $ do
      p <- newIORef []
      q <- newIORef []

      calculateQ (model $ Presenter p q) 0 (toProbability 1)

      readIORef p `shouldReturn` []
      readIORef q `shouldReturn` [Nothing]