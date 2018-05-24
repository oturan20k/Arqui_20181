--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:04:08 05/10/2018
-- Design Name:   
-- Module Name:   D:/procesadores/procesador_1/TB_win.vhd
-- Project Name:  procesador_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Win_Manager
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
 
ENTITY TB_win IS
END TB_win;
 
ARCHITECTURE behavior OF TB_win IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Win_Manager
    PORT(
         reg_f1 : IN  std_logic_vector(4 downto 0);
         reg_f2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         cwp : IN  std_logic_vector(1 downto 0);
         sreg_f1 : OUT  std_logic_vector(5 downto 0);
         sreg_f2 : OUT  std_logic_vector(5 downto 0);
         srd : OUT  std_logic_vector(5 downto 0);
         nwp : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reg_f1 : std_logic_vector(4 downto 0) := (others => '0');
   signal reg_f2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal cwp : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal sreg_f1 : std_logic_vector(5 downto 0);
   signal sreg_f2 : std_logic_vector(5 downto 0);
   signal srd : std_logic_vector(5 downto 0);
   signal nwp : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Win_Manager PORT MAP (
          reg_f1 => reg_f1,
          reg_f2 => reg_f2,
          rd => rd,
          op => op,
          op3 => op3,
          cwp => cwp,
          sreg_f1 => sreg_f1,
          sreg_f2 => sreg_f2,
          srd => srd,
          nwp => nwp
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
			reg_f1 <= "10000";
         reg_f2 <= "10001";
         rd <= "10010";
         op <="10";
         op3 <= "111100";
         cwp <= "01";
		wait;
               
   end process;

END;
