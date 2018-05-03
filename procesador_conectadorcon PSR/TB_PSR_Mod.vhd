--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:26:32 04/24/2018
-- Design Name:   
-- Module Name:   D:/procesadores/procesador_1/TB_PSR_Mod.vhd
-- Project Name:  procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR_Mod
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
 
ENTITY TB_PSR_Mod IS
END TB_PSR_Mod;
 
ARCHITECTURE behavior OF TB_PSR_Mod IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR_Mod
    PORT(
         S_mux : IN  std_logic_vector(31 downto 0);
         S_RF : IN  std_logic_vector(31 downto 0);
         S_UC : IN  std_logic_vector(5 downto 0);
         S_Alu : IN  std_logic_vector(31 downto 0);
         nzvc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal S_mux : std_logic_vector(31 downto 0) := (others => '0');
   signal S_RF : std_logic_vector(31 downto 0) := (others => '0');
   signal S_UC : std_logic_vector(5 downto 0) := (others => '0');
   signal S_Alu : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal nzvc : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR_Mod PORT MAP (
          S_mux => S_mux,
          S_RF => S_RF,
          S_UC => S_UC,
          S_Alu => S_Alu,
          nzvc => nzvc
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

		S_mux<= "00000000000000000000000000000000";
		S_RF <= "00000000000000000000000000000000";
		S_Alu<= "00000000000000000000000000000000";
		S_UC<= "001000";
		

      -- hold reset state for 100 ns.
     

      -- insert stimulus here 

      wait;
   end process;

END;
