----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:26:49 04/19/2018 
-- Design Name: 
-- Module Name:    Procesador_conectado - Behavioral 
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

entity Procesador_conectado is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Salida_procesador : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador_conectado;

architecture Behavioral of Procesador_conectado is
COMPONENT adder
	PORT(
		entrada_b : IN std_logic_vector(31 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT nPc
	PORT(
		In_nPC : IN std_logic_vector(31 downto 0);
		Rst_nPC : IN std_logic;
		Clk_nPC : IN std_logic;          
		Out_nPC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT Unidad_Control
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		salida_Alu : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	COMPONENT reg_file
	PORT(
		reg_s_1 : IN std_logic_vector(5 downto 0);
		reg_s_2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		rst : IN std_logic;
		dwr : IN std_logic_vector(31 downto 0);          
		salida_1 : OUT std_logic_vector(31 downto 0);
		salida_2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT MultiPlex
	PORT(
		Entrada_RF2 : IN std_logic_vector(31 downto 0);
		imm : IN std_logic;
		Salida_SEU : IN std_logic_vector(31 downto 0);          
		Salida_to_Alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT SEU
	PORT(
		imm : IN std_logic_vector(12 downto 0);          
		Salida_Mux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT Alu
	PORT(
		Entrada_UC : IN std_logic_vector(5 downto 0);
		entrada_RF1 : IN std_logic_vector(31 downto 0);
		entrada_RF2 : IN std_logic_vector(31 downto 0);
		c : IN std_logic;          
		dwr : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT PSR_Mod
	PORT(
		S_mux : IN std_logic_vector(31 downto 0);
		S_RF : IN std_logic_vector(31 downto 0);
		S_UC : IN std_logic_vector(5 downto 0);
		S_Alu : IN std_logic_vector(31 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	COMPONENT PSR
	PORT(
		nzvc : IN std_logic_vector(3 downto 0);
		rst : IN std_logic;
		clk : IN std_logic; 
		cwp : IN std_logic_vector(1 downto 0);          
		ncwp : OUT std_logic_vector(1 downto 0);
		c : OUT std_logic
		);
	END COMPONENT;
	COMPONENT Win_Manager
	PORT(
		reg_f1 : IN std_logic_vector(4 downto 0);
		reg_f2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		cwp : IN std_logic_vector(1 downto 0);          
		sreg_f1 : OUT std_logic_vector(5 downto 0);
		sreg_f2 : OUT std_logic_vector(5 downto 0);
		srd : OUT std_logic_vector(5 downto 0);
		nwp : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;	

signal adderToNpc, npcToAdder, npcToIm, imToURS, aluRes, RFtoAlu, RFtoMux, SeuToMux,MuxToAlu: STD_LOGIC_VECTOR (31 downto 0);
signal ucToAlu, winToRF1, winToRF2, winToRFD : STD_LOGIC_VECTOR (5 downto 0);
signal PSRMToPSR  : STD_LOGIC_VECTOR (3 downto 0);
signal PSRToWin, WinToPsr : STD_LOGIC_VECTOR (1 downto 0);
signal PSRtoAlu : STD_LOGIC;
begin
Inst_adder: adder PORT MAP(
		entrada_b => npcToAdder,
		salida => adderToNpc
	);
	
Inst_nPc: nPc PORT MAP(
		In_nPC => adderToNpc,
		Rst_nPC => rst ,
		Clk_nPC => clk,
		Out_nPC => npcToAdder
	);
Inst_Pc: nPc PORT MAP(
		In_nPC => npcToAdder,
		Rst_nPC => rst ,
		Clk_nPC => clk,
		Out_nPC => npcToIm
	);
Inst_instructionMemory: instructionMemory PORT MAP(
		address => npcToIm,
		reset => rst,
		outInstruction => imToURS
	);
Inst_Unidad_Control: Unidad_Control PORT MAP(
		op => imToURS(31 downto 30) ,
		op3 => imToURS(24 downto 19) ,
		salida_Alu => ucToAlu
	);
Inst_reg_file: reg_file PORT MAP(
		reg_s_1 => winToRF1 ,
		reg_s_2 => winToRF2,
		rd => winToRFD,
		rst => rst,
		dwr => aluRes,
		salida_1 => RFtoAlu,
		salida_2 => RFtoMux
	);
Inst_Win_Manager: Win_Manager PORT MAP(
		reg_f1 => imToURS(18 downto 14),
		reg_f2 => imToURS(4 downto 0) ,
		rd => imToURS(29 downto 25),
		op => imToURS(31 downto 30),
		op3 =>imToURS(24 downto 19),
		cwp => PSRToWin,
		sreg_f1 =>winToRF1, 
		sreg_f2 => winToRF2,
		srd => winToRFD,
		nwp => WinToPsr
	);
Inst_MultiPlex: MultiPlex PORT MAP(
		Entrada_RF2 => RFtoMux,
		imm => imToURS(13),
		Salida_SEU => SeuToMux ,
		Salida_to_Alu => MuxToAlu
	);
Inst_SEU: SEU PORT MAP(
		imm => imToURS(12 downto 0) ,
		Salida_Mux => SeuToMux
	);
Inst_Alu: Alu PORT MAP(
		Entrada_UC => ucToAlu,
		entrada_RF1 =>RFtoAlu ,
		entrada_RF2 =>MuxToAlu ,
		c => PSRtoAlu,
		dwr => aluRes
	);
	
Inst_PSR_Mod: PSR_Mod PORT MAP(
		S_mux => MuxToAlu,
		S_RF => RFtoAlu,
		S_UC => ucToAlu,
		S_Alu => aluRes,
		nzvc => PSRMToPSR
	);
Inst_PSR: PSR PORT MAP(
		nzvc => PSRMToPSR,
		rst => rst,
		clk => clk,
		c => PSRtoAlu,
		cwp => WinToPsr,
		ncwp => PSRToWin
	);


Salida_procesador <= aluRes;



end Behavioral;

