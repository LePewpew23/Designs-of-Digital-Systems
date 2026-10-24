----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/14/2026 05:29:54 PM
-- Design Name: 
-- Module Name: if_then_else - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity if_then_else is
    Port ( x : in std_logic_vector(1 downto 0);
           y : in std_logic_vector(1 downto 0);
           z : out STD_LOGIC);
end if_then_else;

architecture Behavioral of if_then_else is

begin

    P1: process(X,Y)
    begin 
        if ( X = Y ) then 
            Z <= '1';
        else 
            Z <= '0';
        end if;
     end process;
                
end Behavioral;
