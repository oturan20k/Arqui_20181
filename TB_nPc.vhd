--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:56:10 04/02/2018
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/proyectos/procesador_1/TB_nPc.vhd
-- Project Name:  procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: nPc
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
 
ENTITY TB_nPc IS
END TB_nPc;
 
ARCHITECTURE behavior OF TB_nPc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nPc
    PORT(
         In_nPC : IN  std_logic_vector(31 downto 0);
         Rst_nPC : IN  std_logic;
         Clk_nPC : IN  std_logic;
         Out_nPC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal In_nPC : std_logic_vector(31 downto 0) := (others => '0');
   signal Rst_nPC : std_logic := '0';
   signal Clk_nPC : std_logic := '0';

 	--Outputs
   signal Out_nPC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_nPC_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nPc PORT MAP (
          In_nPC => In_nPC,
          Rst_nPC => Rst_nPC,
          Clk_nPC => Clk_nPC,
          Out_nPC => Out_nPC
        );

   -- Clock process definitions
   Clk_nPC_process :process
   begin
		Clk_nPC <= '0';
		wait for Clk_nPC_period/2;
		Clk_nPC <= '1';
		wait for Clk_nPC_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Rst_nPC <='1';
      wait for 100 ns;	
		Rst_nPC <= '0';
		In_nPC <= "00000000000000000000000000000111";
		wait for 100 ns;
		In_nPC <= "00000000000000000000000000100101";	
		wait for 100 ns;
		In_nPC <= "00000000000000000000000000000011";
		

      wait for Clk_nPC_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
