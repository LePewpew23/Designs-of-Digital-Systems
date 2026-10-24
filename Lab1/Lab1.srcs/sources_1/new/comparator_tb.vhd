----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2026 05:05:32 PM
-- Design Name: 
-- Module Name: comparator_tb - Behavioral
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
use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator_tb is
 -- no inputs and outputs in testbenches
end comparator_tb;

architecture Behavioral of comparator_tb is
    -- declerating componets
    component comparator_top is port(
        X, Y : in std_logic_vector(1 downto 0);
        Z : out std_logic_vector(3 downto 0));
    end component;

    -- signals are going to be used instead of input or output
    signal X_in, Y_in : std_logic_vector(1 downto 0);
    signal Z_out : std_logic_vector(3 downto 0);
  
begin
    -- componet instantiation
    uut :comparator_top
        port map(X => X_IN, Y => Y_IN, Z => Z_OUT);
    -- test bench statments
    tb : process
    begin
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                X_in <= conv_std_logic_vector(i,2);
                Y_in <= conv_std_logic_vector(j,2);
                wait for 100 ns;
             end loop;
         end loop;
       wait;
    end process;
   
end Behavioral;
