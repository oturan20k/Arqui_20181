--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:05:15 04/06/2018
-- Design Name:   
-- Module Name:   D:/procesadores/procesador_1/TB_Alu.vhd
-- Project Name:  procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Alu
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
 
ENTITY TB_Alu IS
END TB_Alu;
 
ARCHITECTURE behavior OF TB_Alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alu
    PORT(
         Entrada_UC : IN  std_logic_vector(5 downto 0);
         entrada_RF1 : IN  std_logic_vector(31 downto 0);
         entrada_RF2 : IN  std_logic_vector(31 downto 0);
         dwr : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Entrada_UC : std_logic_vector(5 downto 0) := (others => '0');
   signal entrada_RF1 : std_logic_vector(31 downto 0) := (others => '0');
   signal entrada_RF2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal dwr : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alu PORT MAP (
          Entrada_UC => Entrada_UC,
          entrada_RF1 => entrada_RF1,
          entrada_RF2 => entrada_RF2,
          dwr => dwr
        );

   -- Clock process definitions
--   <clock>_process :process
  -- begin
	--	<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Entrada_UC <= "000010";
		entrada_RF1<= x"00000009";
		entrada_RF2<= x"00000005";

      wait;
   end process;

END;
