----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:53:24 04/06/2018 
-- Design Name: 
-- Module Name:    Alu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.NUMERIC_STD.ALL;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu is
    Port ( Entrada_UC : in  STD_LOGIC_VECTOR (5 downto 0);
           entrada_RF1 : in  STD_LOGIC_VECTOR (31 downto 0);
           entrada_RF2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  c : in STD_LOGIC;
           dwr : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Behavioral of Alu is

begin
process(Entrada_UC, entrada_RF1, entrada_RF2)
begin
	case Entrada_UC is 
		when "000000" => dwr <= entrada_RF1 + entrada_RF2;--suma
		when "000001" => dwr <= entrada_RF1 - entrada_RF2;--resta
		when "000010" => dwr <= entrada_RF1 and entrada_RF2;--And
		when "000011" => dwr <= entrada_RF1 nand entrada_RF2;--Nand
		when "000100" => dwr <= entrada_RF1 or entrada_RF2;--Or
		when "000101" => dwr <= entrada_RF1 nor entrada_RF2;--Nor
		when "000110" => dwr <= entrada_RF1 xor entrada_RF2;--Xor
		when "000111" => dwr <= entrada_RF1 xnor entrada_RF2;--Xnor
		when "001000" => dwr <= entrada_RF1 + entrada_RF2;--addcc
		when "001001" => dwr <= entrada_RF1 + entrada_RF2 + c;--addx
		when "001010" => dwr <= entrada_RF1 + entrada_RF2 + c;--addxcc
		when "001011" => dwr <= entrada_RF1 - entrada_RF2 ;--subcc
		when "001100" => dwr <= entrada_RF1 - entrada_RF2 - c ;--subx
		when "001101" => dwr <= entrada_RF1 - entrada_RF2 - c ;--subxcc
		when "001110" => dwr <= entrada_RF1 and entrada_RF2;--andcc
		when "001111" => dwr <= entrada_RF1 nand entrada_RF2;--andncc			
		when "010000" => dwr <= entrada_RF1 or entrada_RF2;--orcc
		when "010001" => dwr <= entrada_RF1 xor entrada_RF2;--xorcc
		when "010010" => dwr <= entrada_RF1 xnor entrada_RF2;--xnorcc
		when "010011" => dwr <= entrada_RF1 nor entrada_RF2;--orncc
		when "010100" => dwr <= entrada_RF1 - entrada_RF2;--save
		when "010101" => dwr <= entrada_RF1 + entrada_RF2;--restore
		when others => dwr <= x"00000000";
	end case;
end process;
end Behavioral;

