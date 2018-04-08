----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:52 04/06/2018 
-- Design Name: 
-- Module Name:    Unidad_Control - Behavioral 
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

entity Unidad_Control is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           salida_Alu : out  STD_LOGIC_VECTOR (5 downto 0));
end Unidad_Control;

architecture Behavioral of Unidad_Control is

begin
process(op, op3)
begin
	if(op="10")then
		case op3 is
			when "000000" => salida_Alu <="000000";--suma
			when "000100" => salida_Alu <="000001";--resta
			when "000001" => salida_Alu <="000010";--And
			when "000101" => salida_Alu <="000011";--Nand
			when "000010" => salida_Alu <="000100";--Or
			when "000110" => salida_Alu <="000101";--Nor
			when "000011" => salida_Alu <="000110";--Xor
			when "000111" => salida_Alu <="000111";--Xnor
			when others =>salida_Alu <="111111";--en caso de otro
		end case;
	end if;
end process;

end Behavioral;

