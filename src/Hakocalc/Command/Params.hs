module Hakocalc.Command.Params where


import Hakocalc.Entity.Defeat (HP, Probability, Quantity)


data Params
  = ParamsP HP Quantity
  | ParamsQ HP Probability