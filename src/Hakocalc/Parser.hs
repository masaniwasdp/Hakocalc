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

optionParser = info pars $ desc Asset.DescProg
  where
    pars = subparser $ pOptionParser <> qOptionParser


{-| Analizas opcion por probablo komando. -}
pOptionParser :: Mod CommandFields Option

pOptionParser = command (Asset.command Asset.CmdP) (info pars $ desc Asset.DescCmdP)
  where
    pars = helper <*> fmap POption args

    args = PArgs <$> helpArg Asset.OptH <*> helpArg Asset.OptQ


{-| Analizas opcion por kvanto komando. -}
qOptionParser :: Mod CommandFields Option

qOptionParser = command (Asset.command Asset.CmdQ) (info pars $ desc Asset.DescCmdQ)
  where
    pars = helper <*> fmap QOption args

    args = QArgs <$> helpArg Asset.OptH <*> helpArg Asset.OptP


{-| Kreas argumenton analizilon kun helpo teksto. -}
helpArg :: Read a => Asset.OptKey -> Parser a

helpArg x = argument auto $ h <> m
  where
    h = help $ Asset.help x

    m = metavar $ Asset.metavar x


{-| -}
desc = progDesc . Asset.desc
