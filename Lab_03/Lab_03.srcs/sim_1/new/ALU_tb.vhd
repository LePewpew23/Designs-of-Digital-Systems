----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/25/2026 04:58:37 AM
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is

    component ALU is
        port(
            sel : in std_logic_vector(3 downto 0);
            a   : in std_logic_vector(5 downto 0);
            b   : in std_logic_vector(5 downto 0);
            r   : out std_logic_vector(5 downto 0)
        );
    end component;

    signal sel_tb : std_logic_vector(3 downto 0) := (others => '0');
    signal a_tb   : std_logic_vector(5 downto 0) := (others => '0');
    signal b_tb   : std_logic_vector(5 downto 0) := (others => '0');
    signal r_tb   : std_logic_vector(5 downto 0);

begin

    DUT : ALU
        port map(
            sel => sel_tb,
            a   => a_tb,
            b   => b_tb,
            r   => r_tb
        );

    stimulus : process
    begin

        -- Test Group 1: A = 4, B = 2

        a_tb <= "000100";
        b_tb <= "000010";

        for i in 0 to 15 loop
            sel_tb <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;


       -- Test Group 2: A = 49, B = 50
        a_tb <= "110001";
        b_tb <= "110010";

        for i in 0 to 15 loop
            sel_tb <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;


        -- Test Group 3: A = 63, B = 63
        a_tb <= "111111";
        b_tb <= "111111";

        for i in 0 to 15 loop
            sel_tb <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;

        -- End simulation stimulus
        wait;

    end process;

end Behavioral;