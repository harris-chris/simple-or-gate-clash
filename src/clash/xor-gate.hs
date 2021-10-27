module XORGATE where

import Clash.Prelude
--import Clash.Explicit.Testbench

xor :: Bool -> Bool -> (Bool, Bool)
xor a b = let 
  output = (not a && b) || (a && not b) in
  (b, output)


xorS :: (HiddenClockResetEnable dom) => Signal dom Bool -> Signal dom Bool
xorS = mealy XORGATE.xor False

topEntity
  :: Clock XilinxSystem 
  -> Reset XilinxSystem
  -> Enable XilinxSystem
  -> Signal XilinxSystem Bool
  -> Signal XilinxSystem Bool
topEntity = exposeClockResetEnable xorS

