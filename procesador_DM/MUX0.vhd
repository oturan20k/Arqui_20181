----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:03:41 05/24/2018 
-- Design Name: 
-- Module Name:    MUX0 - Behavioral 
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

entity MUX0 is
    Port ( SDR : in  STD_LOGIC;
           S_DM : in  STD_LOGIC_VECTOR (31 downto 0);
           S_Alu : in  STD_LOGIC_VECTOR (31 downto 0);
           S_To_RF : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX0;

architecture Behavioral of MUX0 is

begin
process(S_DM,S_Alu,SDR)
begin
	if(SDR = '0')then
		S_To_RF <= S_Alu;
	elsif(SDR = '1')then	
		S_To_RF <= S_DM;
	end if;
end process;


end Behavioral;

