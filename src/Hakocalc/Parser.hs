{-|
 - Description : Modulo por analizi komandolinion opcion.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Parser
  ( Option (..)
  , ProbabilityOption' (..)
  , QuantityOption' (..)
  , optionParser
  )
  where


import Data.Semigroup ((<>))
import Hakocalc.Probability.Common (Probability)
import Numeric.Natural (Natural)

import qualified Options.Applicative as App


{-| Opcio por komandoj. -}
data Option = ProbabilityOption ProbabilityOption' | QuantityOption QuantityOption'


{-| Opcio por probablo komando. -}
data ProbabilityOption' = ProbabilityOption'
  Natural -- ^ HP de monstro.
  Natural -- ^ Kvanto da misiloj kiuj estos lanĉita.


{-| Opcio por kvanto komando. -}
data QuantityOption' = QuantityOption'
  Natural     -- ^ HP de monstro.
  Probability -- ^ Probablo de sukcesi mortigi monstron.


{-| Analizas komandolinion opcion. -}
optionParser :: App.ParserInfo Option

optionParser = App.info pars desc
  where
    pars = App.subparser $
      App.command "probability" probabilityOptionParser <>
      App.command "quantity" quantityOptionParser

    desc = App.progDesc "Calculates probability that a monster will die, in the Hakoniwa Islands."


{-| Analizas opcion por probablo komando. -}
probabilityOptionParser :: App.ParserInfo Option

probabilityOptionParser = App.info pars desc
  where
    pars = App.helper <*> (ProbabilityOption <$> opt')

    desc = App.progDesc "Calculates probability that a monster will die."

    opt' = ProbabilityOption' <$>
      helpArg "The HP of the monster." "HP" <*>
      helpArg "The quantity of missiles to launch." "MISSILES"


{-| Analizas opcion por kvanto komando. -}
quantityOptionParser :: App.ParserInfo Option

quantityOptionParser = App.info pars desc
  where
    pars = App.helper <*> (QuantityOption <$> opt')

    desc = App.progDesc "Calculates quantity of missiles to kill a monster."

    opt' = QuantityOption' <$>
      helpArg "The HP of the monster." "HP" <*>
      helpArg "The probability of killing the monster. (%)" "PROBABILITY"


{-| Kreas argumenton analizilon kun helpo teksto. -}
helpArg :: Read a
  => String       -- ^ Helpo teksto.
  -> String       -- ^ Meta variablo.
  -> App.Parser a -- ^ Argumento analizilo.

helpArg h m = App.argument App.auto $ App.help h <> App.metavar m
