----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:02 04/23/2018 
-- Design Name: 
-- Module Name:    PSR_Mod - Behavioral 
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

entity PSR_Mod is
    Port ( S_mux : in  STD_LOGIC_VECTOR (31 downto 0);
           S_RF : in  STD_LOGIC_VECTOR (31 downto 0);
           S_UC : in  STD_LOGIC_VECTOR (5 downto 0);
           S_Alu : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end PSR_Mod;

architecture Behavioral of PSR_Mod is

begin
process(S_mux,S_RF,S_UC,S_Alu)
begin
--suma
	if(S_UC="001000" or S_UC="001010")then
		nzvc(3)<=S_Alu(31); 
      if(S_Alu=x"00000000")then
			nzvc(2)<='1';
		else
			nzvc(2)<='0';
		end if;
		nzvc(1)<=(S_RF(31) and S_mux(31) and (not S_Alu(31))) or((not S_RF(31)) and (not S_mux(31)) and S_Alu(31));
		nzvc(0)<=(S_RF(31) and S_mux(31)) or (not(S_Alu(31)) and (S_RF(31) or S_mux(31)));
	end if;	
--resta
	if(S_UC="001011" or S_UC="001101")then
		nzvc(3)<=S_Alu(31);
		if(S_Alu=x"00000000")then
			nzvc(2)<='1';
		else
			nzvc(2)<='0';
		end if;
		nzvc(1)<=(S_RF(31) and (not S_mux(31)) and (not S_Alu(31))) or((not S_RF(31)) and S_mux(31) and S_Alu(31));
		nzvc(0)<=((not S_RF(31)) and S_mux(31)) or(S_Alu(31) and ((not S_RF(31)) or S_mux(31))); 
	end if;
--ANDcc,ORcc....
	if ((S_UC="001110") or (S_UC="001111") or (S_UC="010000") or (S_UC="010001") or (S_UC="010010") or (S_UC="010011")) then
		nzvc(3) <= S_Alu(31);
		if (S_Alu = x"00000000") then
			nzvc(2) <= '1';
		else
			nzvc(2) <= '0';
		end if;
		nzvc(1) <= '0';
		nzvc(0) <= '0';
	end if;
		
		
end process;
end Behavioral;