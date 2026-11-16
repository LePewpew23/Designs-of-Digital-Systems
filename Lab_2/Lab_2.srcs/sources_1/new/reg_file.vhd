----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2026 08:28:27 AM
-- Design Name: 
-- Module Name: reg_file - Behavioral
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

entity reg_file is
    Port ( clk : in STD_LOGIC;
           we  : in std_logic;
           rst : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (2 downto 0);
           din : in STD_LOGIC_VECTOR (3 downto 0);
           dout : out STD_LOGIC_VECTOR (3 downto 0));
end reg_file;

architecture Behavioral of reg_file is

    signal write_en : std_logic_vector(7 downto 0);
    signal Reg0_out, Reg1_out, Reg2_out, Reg3_out, Reg4_out, Reg5_out, Reg6_out, Reg7_out  : std_logic_vector(3 downto 0);
    
    component decoder_3to8 is   
        port(  din : in std_logic_vector(2 downto 0);
                en : in std_logic;  
              dout : out std_logic_vector(7 downto 0));
    end component; 
    

    component reg_module is
        generic ( N : integer := 4);
        Port    (clk : in STD_LOGIC;
                rst : in STD_LOGIC;
                we  : in STD_LOGIC;
                din : in std_logic_vector(N-1 downto 0);
                dout : out std_logic_vector(N-1 downto 0)); 
    end component;    

    component mux_8to1 is 
        generic ( N : integer := 4);
        Port ( addr :  in std_logic_vector(2 downto 0); 
                din0, din1, din2, din3, din4, din5, din6 , din7  :  in std_logic_vector(N-1 downto 0); 
                dout :  out std_logic_vector(N-1 downto 0)); 
    end component;   
    
begin
      mainDecoder : decoder_3to8
        port map(din => addr, en => we, dout => write_en);  
    
      reg0 : reg_module

 
         generic map ( N => 4)
         port map (
 we => write_en(0), rst => rst, clk => clk, din => din, dout => reg0_out);
     
     reg1 : reg_module
          generic map ( N => 4)
          port map ( we => write_en(1), rst => rst, clk => clk, din => din, dout => reg1_out);    

     reg2 : reg_module 
         generic map ( N => 4)
         port map (we => write_en(2), rst => rst, clk => clk, din => din, dout => reg2_out);
     
     reg3 : reg_module
          generic map ( N => 4)
          port map ( we => write_en(3), rst => rst, clk => clk, din => din, dout => reg3_out);    
      reg4 : reg_module 
         generic map ( N => 4)
         port map ( we => write_en(4), rst => rst, clk => clk, din => din, dout => reg4_out);
     
     reg5 : reg_module
          generic map ( N => 4)
          port map ( we => write_en(5), rst => rst, clk => clk, din => din, dout => reg5_out);    

     reg6 : reg_module 
         generic map ( N => 4)
         port map (we => write_en(6), rst => rst, clk => clk, din => din, dout => reg6_out);
     
     reg7 : reg_module
          generic map ( N => 4)
          port map ( we => write_en(7), rst => rst, clk => clk, din => din, dout => reg7_out);    
          
     mainMux : mux_8to1 
            generic map ( N => 4)
            port map ( addr => addr, dout => dout, din0 => reg0_out, din1 => reg1_out, din2 => reg2_out, din3 => reg3_out, din4 => reg4_out, din5 => reg5_out, din6 => reg6_out, din7 => reg7_out);
                  
end Behavioral;
