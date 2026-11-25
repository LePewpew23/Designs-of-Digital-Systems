----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2026 02:51:17 PM
-- Design Name: 
-- Module Name: Multiplier - Behavioral
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

entity mult is
    generic(n: integer := 6);
    port(
        sel : in std_logic;
        a : in std_logic_vector(n-1 downto 0);
        b : in std_logic_vector(n-1 downto 0);
        r : out std_logic_vector(n-1 downto 0)
    );
end mult;

architecture dataflow of mult is

signal product    : unsigned(n+n-1 downto 0);
signal high    : unsigned(n-1 downto 0);
signal low     : unsigned(n-1 downto 0);

begin

    product <= unsigned(a) * unsigned(b);
    --product slplit
    low <=  unsigned(product(n-1 downto 0));
    high <= unsigned(product((n+n)-1 downto n));
    
    --selection for upper or lower operation answer
    r <= std_logic_vector(low) when sel = '0' else
             std_logic_vector(high);
    
    


end dataflow;
