----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2026 02:51:17 PM
-- Design Name: 
-- Module Name: Shifter - Behavioral
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

entity Shifter is
    generic(
        n: integer := 6;
        m: integer := 3
    );
    port(
        sel : in std_logic_vector(1 downto 0);
        a : in std_logic_vector(n-1 downto 0);
        b : in std_logic_vector(m-1 downto 0);--says how much to shifts
        r : out std_logic_vector(n-1 downto 0)
        );
end Shifter;

architecture dataflow of Shifter is

signal shift_amount : integer;

begin

shift_amount <= to_integer(unsigned(b));

with sel select
    r <= std_logic_vector(unsigned(a) sll shift_amount) when "00",
         std_logic_vector(unsigned(a) sll shift_amount) when "01",
         std_logic_vector(unsigned(a) srl shift_amount) when "10",
         std_logic_vector(shift_right(signed(a), shift_amount)) when "11",
         (others => '0') when others;
            

end dataflow;
