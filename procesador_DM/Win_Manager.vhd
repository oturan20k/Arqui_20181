----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:08:53 05/07/2018 
-- Design Name: 
-- Module Name:    Win_Manager - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Win_Manager is
    Port ( reg_f1 : in  STD_LOGIC_VECTOR (4 downto 0);
           reg_f2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC_VECTOR (1 downto 0);
           sreg_f1 : out  STD_LOGIC_VECTOR (5 downto 0);
           sreg_f2 : out  STD_LOGIC_VECTOR (5 downto 0);
           srd : out  STD_LOGIC_VECTOR (5 downto 0);
           nwp : out  STD_LOGIC_VECTOR (1 downto 0):="00");
end Win_Manager;

architecture Behavioral of Win_Manager is

signal rs1t,rs2t,rdt: integer range 0 to 39:=0;

begin

process(cwp,op,op3,reg_f1,reg_f2,rd)
	begin
	
		if(op = "10") then
			if(op3 = "111100")then
				nwp<=conv_std_logic_vector(conv_integer(cwp) - 1,2);--save

			elsif(op3 = "111101")then
				nwp<=conv_std_logic_vector(conv_integer(cwp)+ 1,2);--restore
			end if;
		else
			nwp<=cwp;
		end if;

		if(reg_f1>="11000" and reg_f1<="11111") then--Si el registro esta entrelos bits 24 y 31 entrada
				rs1t <= conv_integer(reg_f1)-(conv_integer(cwp)*16);
		elsif(reg_f1>="10000" and reg_f1<="10111") then--Si es un registro esta entre los bits 16 y 23 local
				rs1t <= conv_integer(reg_f1)+(conv_integer(cwp)*16);
		elsif(reg_f1>="01000" and reg_f1<="01111") then--Si es un registro esta entre los bits 8 y 15 salida
				rs1t <= conv_integer(reg_f1)+ (conv_integer(cwp)*16);
		elsif(reg_f1>="00000" and reg_f1<="00111") then--Si es un registro esta entre los bits 0 y 7 globales
				rs1t <= conv_integer(reg_f1);
		end if;
		
		if(reg_f2>="11000" and reg_f2<="11111") then--Si el registro esta entrelos bits 24 y 31 entrada
				rs2t <= conv_integer(reg_f2)-(conv_integer(cwp)*16);
		elsif(reg_f2>="10000" and reg_f2<="10111") then--Si es un registro esta entre los bits 16 y 23 local
				rs2t <= conv_integer(reg_f2)+(conv_integer(cwp)*16);
		elsif(reg_f2>="01000" and reg_f2<="01111") then--Si es un registro esta entre los bits 8 y 15 salida
				rs2t <= conv_integer(reg_f2)+ (conv_integer(cwp)*16);
		elsif(reg_f2>="00000" and reg_f2<="00111") then--Si es un registro esta entre los bits 0 y 7 globales
				rs2t <= conv_integer(reg_f2);
		end if;
		
		if(rd>="11000" and rd<="11111") then--Si el registro esta entrelos bits 24 y 31 entrada
				rdt<= conv_integer(rd)-(conv_integer(cwp)*16);
		elsif(rd>="10000" and rd<="10111") then--Si es un registro esta entre los bits 16 y 23 local
				rdt<= conv_integer(rd)+(conv_integer(cwp)*16);
		elsif(rd>="01000" and rd<="01111") then--Si es un registro esta entre los bits 8 y 15 salida
				rdt <= conv_integer(rd)+ (conv_integer(cwp)*16);
		elsif(rd>="00000" and rd<="00111") then--Si es un registro esta entre los bits 0 y 7 globales
				rdt <= conv_integer(rd);
		end if;
			
end process;
sreg_f1 <= conv_std_logic_vector(rs1t,6);
sreg_f2 <= conv_std_logic_vector(rs2t,6);
srd <= conv_std_logic_vector(rdt,6);

	
end Behavioral;


