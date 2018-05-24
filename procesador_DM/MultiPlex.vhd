----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:06:40 04/16/2018 
-- Design Name: 
-- Module Name:    MultiPlex - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MultiPlex is
    Port ( Entrada_RF2 : in  STD_LOGIC_VECTOR (31 downto 0);
           imm : in  STD_LOGIC;
           Salida_SEU : in  STD_LOGIC_VECTOR (31 downto 0);
			  Salida_to_Alu : out  STD_LOGIC_VECTOR (31 downto 0));
end MultiPlex;

architecture Behavioral of MultiPlex is

begin
process(Entrada_RF2,imm, Salida_SEU)
begin
	if(imm = '1')then
		salida_to_Alu <= Salida_SEU;
	else
		salida_to_Alu <= Entrada_RF2;
	end if;
end process;
end Behavioral;

