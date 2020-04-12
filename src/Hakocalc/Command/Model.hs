module Hakocalc.Command.Model
  ( Model
  , calculateP
  , calculateQ
  , model
  ) where


import Hakocalc.Command.DefeatProbability (HP, Probability, Quantity, missiles, probability)
import Hakocalc.Command.IPresenter (IPresenter, printP, printQ)


data Model a = Model a


model :: IPresenter a => a -> Model a

model = Model


calculateP :: IPresenter a => Model a -> HP -> Quantity -> IO ()

calculateP (Model presenter) h q = printP presenter $ probability h q


calculateQ :: IPresenter a => Model a -> HP -> Probability -> IO ()

calculateQ (Model presenter) h p = printQ presenter $ missiles h p