----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2026 03:23:55 PM
-- Design Name: 
-- Module Name: Logic_Unit - dataflow
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Logic_Unit is
    generic(n: integer := 6);
    port(
        sel : in std_logic_vector(1 downto 0);
        a : in std_logic_vector(n-1 downto 0);
        b : in std_logic_vector(n-1 downto 0);
        r : out std_logic_vector(n-1 downto 0)
        );
end Logic_Unit;

architecture dataflow of Logic_Unit is



begin

   with sel select  
    r <= not a when "00",
         a and b when "01",
         a or b when "10",
         a xor b when "11",
         (others => '0') when others;
     

end dataflow;
