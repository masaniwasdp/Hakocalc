module Hakocalc.CLI.Option where


import Hakocalc.App.Entity.Defeat (HP, Probability, Quantity)


data Option
  = OptionP HP Quantity
  | OptionQ HP Probability