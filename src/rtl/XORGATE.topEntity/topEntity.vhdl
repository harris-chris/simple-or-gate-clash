-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.XORGATE_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk    : in XORGATE_topEntity_types.clk_XilinxSystem;
       -- reset
       rst    : in XORGATE_topEntity_types.rst_XilinxSystem;
       -- enable
       en     : in XORGATE_topEntity_types.en_XilinxSystem;
       eta    : in boolean;
       result : out boolean);
end;

architecture structural of topEntity is
  -- src/clash/xor-gate.hs:7:1-3
  signal a : boolean := false;

begin
  result <= ((not a) and eta) or (a and (not eta));

  -- register begin
  a_register : process(clk)
  begin
    if rising_edge(clk) then
      if rst =  '1'  then
        a <= false;
      elsif en then
        a <= eta;
      end if;
    end if;
  end process;
  -- register end


end;

