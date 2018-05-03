--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:20:50 04/16/2018
-- Design Name:   
-- Module Name:   D:/procesadores/procesador_1/TB_MultiPlex.vhd
-- Project Name:  procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MultiPlex
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_MultiPlex IS
END TB_MultiPlex;
 
ARCHITECTURE behavior OF TB_MultiPlex IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MultiPlex
    PORT(
         Entrada_RF2 : IN  std_logic_vector(31 downto 0);
         imm : IN  std_logic;
         Salida_SEU : IN  std_logic_vector(31 downto 0);
         Salida_to_Alu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Entrada_RF2 : std_logic_vector(31 downto 0) := (others => '0');
   signal imm : std_logic := '0';
   signal Salida_SEU : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Salida_to_Alu : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MultiPlex PORT MAP (
          Entrada_RF2 => Entrada_RF2,
          imm => imm,
          Salida_SEU => Salida_SEU,
          Salida_to_Alu => Salida_to_Alu
        );

   -- Clock process definitions
  -- <clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
	Entrada_RF2<= x"0011f001";
	imm <= '0';
	Salida_SEU <= x"002573fa";
	
    

      wait;
   end process;

END;
