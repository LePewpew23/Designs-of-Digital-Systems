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

    --  Select
    carry_sel <= sel(0);
    sub <= sel(1);
    --  Inputs
    a_long <= '0' & unsigned(a); 
    b_long <= '0' & (not unsigned(b)) when sub = '1' else
              '0' & unsigned(b);
   
   --addintion and substaction
    op1_long <= a_long + b_long;
    op2_long <= a_long + b_long + 1; 
    
    --selects te operation output
    with sub select 
        sum_long <= op1_long when '0',
                    op2_long when '1',
                    TO_UNSIGNED(0,n+1) when others;
                    
   sum <= std_logic_vector(sum_long(n-1 downto 0));
   
   carry_long <= TO_UNSIGNED(0,n) & sum_long(n downto n);
                    
   carry <=  std_logic_vector(carry_long(n-1 downto 0));             
                
--output	
   with carry_sel select
      r <= sum when '0',
           carry when '1',
           (others => '0') when others;
           		
end dataflow;
