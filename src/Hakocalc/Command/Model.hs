module Hakocalc.Command.Model
  ( Model
  , ModelImpl
  , calculateP
  , calculateQ
  , modelImpl
  ) where


import Hakocalc.Command.DefeatProbability (HP, Probability, Quantity, missiles, probability)
import Hakocalc.Command.Presenter (Presenter, printP, printQ)


class Model a where
  calculateP :: Presenter m => a -> HP -> Quantity -> m ()

  calculateQ :: Presenter m => a -> HP -> Probability -> m ()


data ModelImpl = ModelImpl


instance Model ModelImpl where
  calculateP ModelImpl h q = printP $ probability h q

  calculateQ ModelImpl h p = printQ $ missiles h p


modelImpl :: ModelImpl

modelImpl = ModelImpl