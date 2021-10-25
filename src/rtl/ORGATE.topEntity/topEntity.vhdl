-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.ORGATE_topEntity_types.all;

entity topEntity is
  port(in1    : in boolean;
       in2    : in boolean;
       result : out boolean);
end;

architecture structural of topEntity is


begin
  result <= in1 or in2;


end;

