----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2026 08:28:27 AM
-- Design Name: 
-- Module Name: mux_8to1 - Behavioral
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
--use ieee.numeric_std.all;

entity mux_8to1 is
generic ( N : integer);
 Port ( addr :  in std_logic_vector(2 downto 0); --selecton
        din0, din1, din2, din3, din4, din5, din6 , din7  :  in std_logic_vector(N-1 downto 0); --amount of inputs
        dout :  out std_logic_vector(N-1 downto 0)         
 );
end mux_8to1;

architecture Behavioral of mux_8to1 is

begin
    with addr select
        dout <= din0 when "000",
                din1 when "001",
                din2 when "010",
                din3 when "011",
                din4 when "100",
                din5 when "101",
                din6 when "110",
                din7 when "111",
                (others => '0')  when others ;     
                                      

end Behavioral;
