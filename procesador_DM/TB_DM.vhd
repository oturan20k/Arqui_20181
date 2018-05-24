--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:49:41 05/24/2018
-- Design Name:   
-- Module Name:   D:/procesadores/procesador_1/TB_DM.vhd
-- Project Name:  procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DM
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
 
ENTITY TB_DM IS
END TB_DM;
 
ARCHITECTURE behavior OF TB_DM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DM
    PORT(
         c_RD : IN  std_logic_vector(31 downto 0);
         s_Alu : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         WREN : IN  std_logic;
         clk : IN  std_logic;
         s_DM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal c_RD : std_logic_vector(31 downto 0) := (others => '0');
   signal s_Alu : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal WREN : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal s_DM : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DM PORT MAP (
          c_RD => c_RD,
          s_Alu => s_Alu,
          rst => rst,
          WREN => WREN,
          clk => clk,
          s_DM => s_DM
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		c_RD <= x"00000009";
      s_Alu <= x"0000000A";
      WREN <= '1';

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
