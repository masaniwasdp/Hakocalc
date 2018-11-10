{-|
 - Description : Modulo por analizi komandolinion opcion.
 - Copyright   : 2018 masaniwa
 - License     : MIT
 -}
module Hakocalc.Parser
  ( Option (..)
  , optionParser
  )
  where


import Data.Semigroup ((<>))
import Hakocalc.Command (PArgs (PArgs), QArgs (QArgs))
import Options.Applicative.Builder (argument, auto, command, help, info, metavar, progDesc, subparser)
import Options.Applicative.Builder.Internal (CommandFields, Mod)
import Options.Applicative.Common (Parser, ParserInfo)
import Options.Applicative.Extra (helper)

import qualified Hakocalc.Asset as Asset


{-| Opcio por komandoj. -}
data Option = POption PArgs | QOption QArgs


{-| Analizas komandolinion opcion. -}
optionParser :: ParserInfo Option

optionParser = info pars desc
  where
    pars = subparser $ pOptionParser <> qOptionParser

    desc = progDesc $ Asset.desc Asset.DescProg


{-| Analizas opcion por probablo komando. -}
pOptionParser :: Mod CommandFields Option

pOptionParser = command (Asset.command Asset.CmdP) (info pars desc)
  where
    pars = helper <*> fmap POption args

    args = PArgs <$> helpArg Asset.OptH <*> helpArg Asset.OptQ

    desc = progDesc $ Asset.desc Asset.DescCmdP


{-| Analizas opcion por kvanto komando. -}
qOptionParser :: Mod CommandFields Option

qOptionParser = command (Asset.command Asset.CmdQ) (info pars desc)
  where
    pars = helper <*> fmap QOption args

    args = QArgs <$> helpArg Asset.OptH <*> helpArg Asset.OptP

    desc = progDesc $ Asset.desc Asset.DescCmdQ


{-| Kreas argumenton analizilon kun helpo teksto. -}
helpArg :: Read a
  => Asset.OptKey -- ^ Ŝlosilo de la opcio.
  -> Parser a     -- ^ Argumento analizilo.

helpArg k = argument auto $ h <> m
  where
    h = help $ Asset.help k

    m = metavar $ Asset.metavar k
