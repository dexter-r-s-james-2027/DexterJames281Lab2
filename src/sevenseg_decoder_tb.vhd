----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 08:28:57 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

  component sevenseg_decoder is
    port(
	i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
    o_seg_n : out STD_LOGIC_VECTOR (6 downto 0)
    );	
  end component;
  
  signal w_in : STD_LOGIC_VECTOR (3 downto 0) := (others=>'0'); --Name these something else
  signal w_out : STD_LOGIC_VECTOR (6 downto 0) := (others=> '0'); --w prefix for wire

begin 

  sevenseg_decocer_uut: sevenseg_decoder port map ( --unit under test 'uut' suffix
  
    i_Hex => w_in,
    o_seg_n => w_out
  );
  test_process : process  
  begin
  
    w_in <= "0000"; wait for 10 ns;  -- Flipped '0'
            assert w_out = "1000000" report "error on 0" severity failure;
    w_in <= "0001"; wait for 10 ns;  -- Flipped '1'
            assert w_out = "1111001" report "error on 1" severity failure;
    w_in <= "0010"; wait for 10 ns;  -- Flipped '2'
            assert w_out = "0100100" report "error on 2" severity failure; 
    w_in <= "0011"; wait for 10 ns;  -- Flipped '3'
            assert w_out = "0110000" report "error on 3" severity failure; 
    w_in <= "0100"; wait for 10 ns;  -- Flipped '4'
            assert w_out = "0011001" report "error on 4" severity failure;
    w_in <= "0101"; wait for 10 ns;  -- Flipped '5'
            assert w_out = "0010010" report "error on 5" severity failure;
    wait; 
  end process;

end Behavioral;
