----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2026 04:40:49 PM
-- Design Name: 
-- Module Name: comparator_top - Structural
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

entity comparator_top is
    Port ( x : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0));
end comparator_top;

architecture Structural of comparator_top is
    -- Declaring Componets
    component if_then_else is
        port(X,Y : in std_logic_vector(1 downto 0);
               Z : out std_logic);
    end component;
    
    component boolean_equation is
        port( X, Y : in std_logic_vector(1 downto 0);
                 Z : out std_logic);
    end component;
    
    component when_else is
        port( X, Y : in std_logic_vector(1 downto 0);
                 Z : out std_logic);
    end component;
    
    component LUT_primitve is 
        port( X,Y : in std_logic_vector(1 downto 0);
                Z : out std_logic);
    end component;           

begin
    -- Port maps for the Componets
    if_then_else0 : if_then_else port map
    (X => X, Y => Y, Z => Z(3));
    
    boolean_equation0 : boolean_equation port map
    (X => X, Y => Y, Z => Z(2));
    
    when_else0 : when_else port map
    (X => X, Y => Y, Z => Z(1));
    
    LUT_primitive0 : LUT_primitve port map--i didnt realize i had been spelling primitive incorrectly till now
    (X => X, Y => Y, Z => Z(0));
       
end Structural;
