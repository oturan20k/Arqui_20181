--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:41:53 04/16/2018
-- Design Name:   
-- Module Name:   D:/procesadores/procesador_1/TB_SEU.vhd
-- Project Name:  procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SEU
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
 
ENTITY TB_SEU IS
END TB_SEU;
 
ARCHITECTURE behavior OF TB_SEU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         imm : IN  std_logic_vector(12 downto 0);
         Salida_Mux : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal Salida_Mux : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          imm => imm,
          Salida_Mux => Salida_Mux
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
     imm <="0000001100000";
	  
      wait;
   end process;

END;
