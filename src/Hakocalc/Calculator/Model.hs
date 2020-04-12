module Hakocalc.Calculator.Model
  ( Model
  , calculateP
  , calculateQ
  , model
  ) where


import Hakocalc.Calculator.DefeatProbability (HP, Probability, Quantity, missiles, probability)
import Hakocalc.Calculator.IPresenter (IPresenter, resultP, resultQ)


data Model a = Model a


model :: IPresenter a => a -> Model a

model = Model


calculateP :: IPresenter a => Model a -> HP -> Quantity -> IO ()

calculateP (Model presenter) h q = resultP presenter $ probability h q


calculateQ :: IPresenter a => Model a -> HP -> Probability -> IO ()

calculateQ (Model presenter) h p = resultQ presenter $ missiles h p