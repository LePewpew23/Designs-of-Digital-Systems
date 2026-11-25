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
begin


end structual;
