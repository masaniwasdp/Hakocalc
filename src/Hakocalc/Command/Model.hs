module Hakocalc.Command.Model
  ( calculateP
  , calculateQ
  ) where


import Hakocalc.Command.DefeatProbability (HP, Probability, Quantity, missiles, probability)
import Hakocalc.Command.Presenter (Presenter, printP, printQ)


calculateP :: Presenter m => HP -> Quantity -> m ()

calculateP h q = printP $ probability h q


calculateQ :: Presenter m => HP -> Probability -> m ()

calculateQ h p = printQ $ missiles h p