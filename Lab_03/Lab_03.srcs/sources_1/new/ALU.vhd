----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2026 03:23:55 PM
-- Design Name: 
-- Module Name: ALU - structual
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

entity ALU is
    port(
        sel : in std_logic_vector(3 downto 0);
        a : in std_logic_vector(5 downto 0);
        b : in std_logic_vector(5 downto 0);
        r : out std_logic_vector(5 downto 0)
        );
end ALU;

architecture structual of ALU is

        constant n : integer := 6;
        constant m : integer := 3;
        
    component adder is
        generic(n: integer := 6);
        port(
            sel : in std_logic_vector(1 downto 0);
            a : in std_logic_vector(n-1 downto 0);
            b : in std_logic_vector(n-1 downto 0);
            r : out std_logic_vector(n-1 downto 0)
            );
        end component;
        
    component mult is
        generic(n: integer := 6);
        port(
            sel : in std_logic;
            a : in std_logic_vector(n-1 downto 0);
            b : in std_logic_vector(n-1 downto 0);
            r : out std_logic_vector(n-1 downto 0)
            );
        end component;
        
    component logic_unit is
        generic(n: integer := 6);
        port(
            sel : in std_logic_vector(1 downto 0);
            a : in std_logic_vector(n-1 downto 0);
            b : in std_logic_vector(n-1 downto 0);
            r : out std_logic_vector(n-1 downto 0)
            );
        end component;
        
    component shifter is
        generic(
            n: integer := 6;
            m: integer := 3
           );
            port(
                sel : in std_logic_vector(1 downto 0);
                a : in std_logic_vector(n-1 downto 0);
                b : in std_logic_vector(m-1 downto 0);
                r : out std_logic_vector(n-1 downto 0)
                );
        end component;
        
        signal adder_out : std_logic_vector(n-1 downto 0);
        signal mult_out : std_logic_vector(n-1 downto 0);
        signal logic_out : std_logic_vector(n-1 downto 0);
        signal shift_out : std_logic_vector(n-1 downto 0);
        
begin
   A1 : adder
      generic map(n => n)
      port map( sel => sel(1 downto 0), a => a, b => b, r=> adder_out);
      
  A2 : mult
      generic map(n => n)
      port map( sel => sel(0), a => a, b => b, r=> mult_out);

  A3 : logic_unit
      generic map(n => n)
      port map( sel => sel(1 downto 0), a => a, b => b, r=> logic_out);
  
  A4 : shifter
      generic map(n => n)
      port map( sel => sel(1 downto 0), a => a, b => b(2 downto 0), r=> shift_out);        

    with sel(3 downto 2) select 
        r <= adder_out when "00",
             mult_out when "01",
             logic_out when "10",
             shift_out when "11",
             (others => '0') when others;
          

end structual;
