----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/14/2026 05:29:54 PM
-- Design Name: 
-- Module Name: LUT_primitve - primitve
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity LUT_primitve is
    Port ( x : in std_logic_vector(1 downto 0);
           y : in std_logic_vector(1 downto 0);
           z : out STD_LOGIC);
end LUT_primitve;

architecture primitve of LUT_primitve is

begin

LUT4_inst : LUT4
   generic map (
      INIT => X"8421")
   port map (
      O => Z,   -- LUT general output
      I0 => X(0), -- LUT input
      I1 => X(1), -- LUT input
      I2 => Y(0), -- LUT input
      I3 => Y(1)  -- LUT input
   );

end primitve;
