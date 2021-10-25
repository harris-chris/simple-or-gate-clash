module ORGATE where

import Clash.Prelude
--import Clash.Explicit.Testbench

topEntity :: Bool -> Bool -> Bool
topEntity in1 in2 = in1 || in2

--bitOrS :: (HiddenClockResetEnable dom) => Signal dom Bool -> Signal dom Bool -> Signal dom Bool
--bitOrS in1 in2 = bitOr in1 in2

