----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:45:52 05/22/2018 
-- Design Name: 
-- Module Name:    DM - Behavioral 
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

entity DM is
    Port ( c_RD : in  STD_LOGIC_VECTOR (31 downto 0);
           s_Alu : in  STD_LOGIC_VECTOR (31 downto 0);
			  rst: in  STD_LOGIC;
           WREN : in  STD_LOGIC;
			  clk: in  STD_LOGIC;
           s_DM : out  STD_LOGIC_VECTOR (31 downto 0));
end DM;

architecture Behavioral of DM is
type rom_type is array (31 downto 0) of std_logic_vector (31 downto 0);
signal registro : rom_type := (others=>x"00000000");


begin

process(c_RD, s_Alu,rst, WREN, clk)
begin
if(rising_edge(clk))then
	if(rst = '1')then
		s_DM <= x"00000000";
		registro <=(others => x"00000000");
	else
		
		if(WREN = '1')then			
			registro(conv_integer(s_Alu))<=c_RD;
		else
			s_DM <=registro(conv_integer(s_Alu));
		end if;
	end if;
end if;
end process;
end Behavioral;

