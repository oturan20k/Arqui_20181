----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:35:04 04/02/2018 
-- Design Name: 
-- Module Name:    nPc - Behavioral 
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

entity nPc is
    Port ( In_nPC : in  STD_LOGIC_VECTOR (31 downto 0);
           Rst_nPC : in  STD_LOGIC;
           Clk_nPC : in  STD_LOGIC;
           Out_nPC : out  STD_LOGIC_VECTOR (31 downto 0));
end nPc;

	architecture Behavioral of nPc is

begin
	process (In_nPC, Rst_nPC, Clk_nPC)
	begin
		if (Rst_nPC = '1')then
			Out_nPC <= "00000000000000000000000000000000";
		else 
			if(rising_edge(Clk_nPC))then
			Out_nPC <= In_nPC;
			end if;
		end if;
	end process;
end Behavioral;

