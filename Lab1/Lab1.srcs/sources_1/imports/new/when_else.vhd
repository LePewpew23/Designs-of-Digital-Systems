----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/14/2026 05:29:54 PM
-- Design Name: When-Else DataFlow
-- Module Name: when_else - dataflow
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description:  
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


entity when_else is
    Port ( x : in std_logic_vector(1 downto 0);
           y : in std_logic_vector(1 downto 0);
           z : out STD_LOGIC);
end when_else;

architecture dataflow of when_else is

begin

    Z <= '1' when( X = Y ) else '0';

end dataflow;
