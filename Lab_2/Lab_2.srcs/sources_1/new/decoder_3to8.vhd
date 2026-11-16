----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2026 08:28:27 AM
-- Design Name: 
-- Module Name: decoder_3to8 - Behavioral
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

entity decoder_3to8 is
    port(  
        din : in std_logic_vector(2 downto 0);
        en : in std_logic;  
        dout : out std_logic_vector(7 downto 0));
    
    
end decoder_3to8;

architecture dataflow of decoder_3to8 is
    -- decoder makes the decsion of which reg mod to select with the given input and passes the en to that mod
    -- this is going to be the number of cases that could happen
    signal temp : std_logic_vector(7 downto 0); 
begin   
        temp(7) <= din(2) and din(1) and din(0);                          
        temp(6) <= din(2) and din(1) and not din(0);
        temp(5) <= din(2) and not din(1) and din(0);
        temp(4) <= din(2) and not din(1) and not din(0);
        temp(3) <= not din(2) and din(1) and din(0);     
        temp(2) <= not din(2) and din(1) and not din(0);     
        temp(1) <= not din(2) and not din(1) and din(0);  
        temp(0) <= not din(2) and not din(1) and not din(0);
       
       process(en, temp)
       begin       
         if en = '0' then
            dout <= "00000000";
          else
            dout <= temp;
         end if;
       end process;
       
end dataflow;
