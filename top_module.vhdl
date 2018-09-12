----------------------------------------------------------------------------------
-- Author: 		Enkhbold Ochirsuren
-- 
-- Create Date:    14:48:27 10/07/2009 
-- File Name:		top_module.vhdl
-- Design Name: 
-- Module Name:    top_module - Structural 
-- Project Name: 	On-board peripheral interface unit for V850 uPD70F37xy
-- Target Devices: Xilinx XC9572XL
-- Tool versions: 	Xilinx ISE Project Navigator 11.1
-- Description: 		Top-level module
--
-- Dependencies: 
--
-- Revision: 2.01 - Removed unused signals from entity, 31.05.2012
-- Revision: 2.00 - INTX logic replaced INTA_D, HRW added, 02.05.2012
-- Revision: 1.00 - Design release completed, 02.12.2009
-- Revision 0.01 - File Created
-- Additional Comments: 
--
-- This design includes:
-- (1) address logic used by processor to access to RAM, DSP, and external UART in VHDL (address_decoding.vhd)
-- (2) decoder in schematics (codec.sch) and its VHDL description(codec.vhf)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_module is
	port (
			A21 : in  std_logic;
         A20 : in  std_logic;
         A19 : in  std_logic;
         A18 : in  std_logic;
         A17 : in  std_logic;
         A16 : in  std_logic;
         A7 : in  std_logic;
         A6 : in  std_logic;
         A5 : in  std_logic;
         A4 : in  std_logic;
         A2 : in  std_logic;
         A1 : in  std_logic;
			AD0 : in std_logic;
			SEL0 : in std_logic;
			SEL1 : in std_logic;
         WR0_L : in  std_logic;
         WR1_L : in  std_logic;
         RD_L : in  std_logic;
			INTA : in std_logic;
			INT3_L : in std_logic;
			INT4_L : in std_logic;
			INTP : in std_logic;
			CPLD10 : in std_logic;
			WAITD : in std_logic;
			CLK64P : in std_logic;
			BFX2 : in std_logic;
         RW : out  std_logic;
         LB_L : out  std_logic;
         UB_L : out  std_logic;
         CE2 : out  std_logic;
			CSA_L : out std_logic;
			CSB_L : out std_logic;
			CSC_L : out std_logic;
			CSD_L : out std_logic;
			IOR_L : out std_logic;
			IOW_L : out std_logic;
			INTX  : out std_logic;
			HCS_L : out std_logic;
			HCN0 : out std_logic;
			HCN1 : out std_logic;
			HBIL : out std_logic;
			HSTB_L : out std_logic;
			HRW  : out std_logic;
			SINT : out std_logic;
			WAIT_NEC : out std_logic;
			CLK32 : out std_logic;
			BFX2V : out std_logic;
			CPLD1 : in std_logic;
			CPLD2 : in std_logic;
			BFX2D : out std_logic;
			-- signals for the LCD display, 2010.08.25
			AST : in std_logic;
			LCD_RS : out std_logic;
			LCD_RW : out std_logic;
			LCD_E : out std_logic
			);
end top_module;

architecture structural of top_module is

	component address_decoding
		port (
				A21 : in  std_logic;
				A20 : in  std_logic;
				A19 : in  std_logic;
				A18 : in  std_logic;
				A17 : in  std_logic;
				A16 : in  std_logic;
				A7 : in  std_logic;
				A6 : in  std_logic;
				A5 : in  std_logic;
				A4 : in  std_logic;
				A2 : in  std_logic;
				A1 : in  std_logic;
				AD0 : in std_logic;
				SEL0 : in std_logic;
				SEL1 : in std_logic;
				WR0_L : in  std_logic;
				WR1_L : in  std_logic;
				RD_L : in  std_logic;
				INTA : in std_logic;
				INT3_L : in std_logic;
				INT4_L : in std_logic;
				INTP : in std_logic;
				CPLD10 : in std_logic;	-- passing /RES to the 2nd CPLD
				WAITD : in std_logic;
				CLK64P : in std_logic;
				BFX2 : in std_logic;
				RW : out  std_logic;
				LB_L : out  std_logic;
				UB_L : out  std_logic;
				CE2 : out  std_logic;
				CSA_L : out std_logic;
				CSB_L : out std_logic;
				CSC_L : out std_logic;
				CSD_L : out std_logic;
				IOR_L : out std_logic;
				IOW_L : out std_logic;
				INTX  : out std_logic;
				HCS_L : out std_logic;
				HCN0 : out std_logic;
				HCN1 : out std_logic;
				HBIL : out std_logic;
				HSTB_L : out std_logic;
				HRW  : out std_logic;
				SINT : out std_logic;
				WAIT_NEC : out std_logic;
				CLK32 : out std_logic;
				BFX2V : out std_logic;
				AST : in std_logic;
				LCD_RS : out std_logic;
				LCD_RW : out std_logic;
				LCD_E : out std_logic
				);
	end component;

	component codec
		port (
				modd : in std_logic;
				frame : in std_logic;
				ck_out : out std_logic;
				fr_out : out std_logic
				);
	end component;

begin

	I1: address_decoding
	port map (
				A21=>A21,
				A20=>A20,
				A19=>A19,
				A18=>A18,
				A17=>A17,
				A16=>A16,
				A7=>A7,
				A6=>A6,
				A5=>A5,
				A4=>A4,
				A2=>A2,
				A1=>A1,
				AD0=>AD0,
				SEL0=>SEL0,
				SEL1=>SEL1,
				WR0_L=>WR0_L,
				WR1_L=>WR1_L,
				RD_L=>RD_L,
				INTA=>INTA,
				INT3_L=>INT3_L,
				INT4_L=>INT4_L,
				INTP=>INTP,
				CPLD10=>CPLD10,
				WAITD=>WAITD,
				CLK64P=>CLK64P,
				BFX2=>BFX2,
				RW=>RW,
				LB_L=>LB_L,
				UB_L=>UB_L,
				CE2=>CE2,
				CSA_L=>CSA_L,
				CSB_L=>CSB_L,
				CSC_L=>CSC_L,
				CSD_L=>CSD_L,
				IOR_L=>IOR_L,
				IOW_L=>IOW_L,
				INTX=>INTX,
				HCS_L=>HCS_L,
				HCN0=>HCN0,
				HCN1=>HCN1,
				HBIL=>HBIL,
				HSTB_L=>HSTB_L,
				HRW=>HRW,
				SINT=>SINT,
				WAIT_NEC=>open,
				CLK32=>CLK32,
				BFX2V=>BFX2V,
				AST=>AST,
				LCD_RS=>LCD_RS,
				LCD_RW=>LCD_RW,
				LCD_E=>LCD_E
				);

	I2: codec
	port map (
				modd=>CPLD1,
				frame=>CPLD2,
				ck_out=>open,
				fr_out=>BFX2D
				);

end structural;

configuration prototype1 of top_module is
	for structural
		for I1: address_decoding
			use entity work.address_decoding(Behavioral);
		end for;
		for I2: codec
			use entity work.codec;
		end for;
	end for;
end prototype1;
