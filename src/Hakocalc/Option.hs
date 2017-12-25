{-|
 - Description : Modulo de opcio por komandoj.
 - Copyright   : 2017 masaniwa
 - License     : MIT
 -}

module Hakocalc.Option
  ( Option (..)
  , ProbabilityOption (..)
  , QuantityOption (..)
  , TransitionOption (..) ) where

import Hakocalc.Probability.Common (Probability)
import Numeric.Natural (Natural)


{-| Opcio por komandoj. -}
data Option = POption ProbabilityOption -- ^ Opcio por probablo komando.
            | QOption QuantityOption    -- ^ Opcio por kvanto komando.
            | TOption TransitionOption  -- ^ Opcio por transiro komando.


{-| Opcio por probablo komando. -}
data ProbabilityOption = ProbabilityOption
                           { pHP       :: Natural -- ^ HP de monstro.
                           , pQuantity :: Natural -- ^ Kvanto da misiloj kiuj estos lanĉita.
                           }


{-| Opcio por kvanto komando. -}
data QuantityOption = QuantityOption
                        { qHP          :: Natural     -- ^ HP de monstro.
                        , qProbability :: Probability -- ^ Probablo de sukcesi mortigi monstron.
                        }


{-| Opcio por transiro komando. -}
data TransitionOption = TransitionOption
                          { tHP  :: Natural -- ^ HP de monstro.
                          , tMin :: Natural -- ^ Minimuma kvanto da misiloj kiuj estos lanĉita.
                          , tMax :: Natural -- ^ Maksimuma kvanto da misiloj kiuj estos lanĉita.
                          }
