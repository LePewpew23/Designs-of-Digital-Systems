----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2026 02:51:17 PM
-- Design Name: 
-- Module Name: Adder - Behavioral
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
use ieee.numeric_std .all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
    generic(n: integer := 6);
    port(
        sel : in std_logic_vector(1 downto 0);
        a : in std_logic_vector(n-1 downto 0);
        b : in std_logic_vector(n-1 downto 0);
        r : out std_logic_vector(n-1 downto 0)
    );
end Adder;

architecture dataflow of Adder is

    signal carry_sel : std_logic;
    signal sub : std_logic;
    signal a_long : unsigned(n downto 0);
    signal b_long : unsigned(n downto 0);
    signal carry_long : unsigned(n downto 0);
    signal op1_long : unsigned(n downto 0);
    signal op2_long : unsigned(n downto 0);
    signal sum_long : unsigned(n downto 0);
    signal sum : std_logic_vector(n-1 downto 0);
    signal carry : std_logic_vector(n-1 downto 0);
    
begin

   
   with sel select
      r <=  a + b when "00",
 a + b  when "01",
 <expression> when others;
			
			

end dataflow;
