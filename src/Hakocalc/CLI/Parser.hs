{-|
 - Description : Modulo por analizi komandolinion opcion.
 - Copyright   : 2017 masaniwa
 -}

module Hakocalc.CLI.Parser (optionParser) where

import Data.Semigroup ((<>))
import Hakocalc.CLI.Option (Option (..), ProbabilityOption (..), QuantityOption (..), TransitionOption (..))
import Options.Applicative (ParserInfo, argument, auto, command, help, helper, info, metavar, progDesc, subparser)


{-| Analizas komandolinion opcion. -}
optionParser :: ParserInfo Option

optionParser = info parser description where
  parser      = subparser $ probability <> quantity <> transition
  description = progDesc "Calculates probability that the monster will die, in Hakoniwa Islands."
  probability = command "probability" probabilityOptionParser
  quantity    = command "quantity" quantityOptionParser
  transition  = command "transition" transitionOptionParser


{-| Analizas opcion por probablo komando. -}
probabilityOptionParser :: ParserInfo Option

probabilityOptionParser = info parser description where
  parser      = helper <*> (POption <$> (ProbabilityOption <$> hp <*> quantity))
  description = progDesc "Calculates probability that the monster will die."
  hp          = argument auto $ help "The HP of the monster." <> metavar "HP"
  quantity    = argument auto $ help "The quantity of missiles to launch." <> metavar "MISSILES"


{-| Analizas opcion por kvanto komando. -}
quantityOptionParser :: ParserInfo Option

quantityOptionParser = info parser description where
  parser      = helper <*> (QOption <$> (QuantityOption <$> hp <*> probability))
  description = progDesc "Calculates enough quantity of missiles to kill the monster."
  hp          = argument auto $ help "The HP of the monster." <> metavar "HP"
  probability = argument auto $ help "The probability of killing the monster. (%)" <> metavar "PROBABILITY"


{-| Analizas opcion por transiro komando. -}
transitionOptionParser :: ParserInfo Option

transitionOptionParser = info parser description where
  parser      = helper <*> (TOption <$> (TransitionOption <$> hp <*> n <*> m))
  description = progDesc "Calculates probability transition that the monster dies when launching m missiles from n."
  hp          = argument auto $ help "The HP of the monster." <> metavar "HP"
  n           = argument auto $ help "The minimum quantity of missiles to launch." <> metavar "MIN"
  m           = argument auto $ help "The maximum quantity of missiles to launch." <> metavar "MAX"
