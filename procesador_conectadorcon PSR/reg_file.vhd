----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:04:16 04/05/2018 
-- Design Name: 
-- Module Name:    reg_file - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_file is
    Port ( reg_s_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           reg_s_2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  rst: in  STD_LOGIC;
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           salida_1 : out  STD_LOGIC_VECTOR (31 downto 0);
           salida_2 : out  STD_LOGIC_VECTOR (31 downto 0));
end reg_file;

architecture Behavioral of reg_file is
type rom_type is array (31 downto 0) of std_logic_vector (31 downto 0);
signal registro : rom_type := (others=>x"00000000");


begin

process(reg_s_1, reg_s_2,rst, rd,dwr)
begin
	if(rst = '1')then
		salida_1 <= x"00000000";
		salida_2 <= x"00000000";
		registro <=(others => x"00000000");
	else
		salida_1 <= registro(conv_integer(reg_s_1));
		salida_2 <= registro(conv_integer(reg_s_2));
		if(rd/="00000")then
		registro(conv_integer(rd))<=dwr;
		end if;
	end if;
end process;
end Behavioral;

