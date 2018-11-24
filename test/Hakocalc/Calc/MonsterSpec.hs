module Hakocalc.Calc.MonsterSpec where


import Hakocalc.Calc.Common (toProbabilityJust)
import Hakocalc.Calc.Monster
import Test.Hspec


spec :: Spec

spec = do
  defeatProbabilitySpec
  enoughMissilesSpec


defeatProbabilitySpec :: Spec

defeatProbabilitySpec = describe "defeatProbability" $ do
  it "Inora-Ghost" $
    defeatProbability 1 1 `shouldBe` toRecipProbability 7

  it "Pseudo" $
    defeatProbability 0 3 `shouldBe` toRecipProbability 1

  it "King-Inora" $
    defeatProbability 5 5 `shouldBe` toRecipProbability 16807


enoughMissilesSpec :: Spec

enoughMissilesSpec = describe "enoughMissiles" $ do
  it "Inora-Ghost" $
    enoughMissiles 1 (toRecipProbability 7) `shouldBe` Just 1

  it "Pseudo" $
    enoughMissiles 1 (toRecipProbability 1) `shouldBe` Nothing

  it "King-Inora" $
    enoughMissiles 5 (toRecipProbability 16807) `shouldBe` Just 5


toRecipProbability :: Rational -> Probability

toRecipProbability = toProbabilityJust . recip
