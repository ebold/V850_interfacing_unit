----------------------------------------------------------------------------------
-- Author: 			Enkhbold Ochirsuren
-- File name:		address_decoding.vhd
-- 
-- Create Date:    13:22:26 07/20/2009 
-- Design Name: 
-- Module Name:    address_decoding - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 3.02 - Removed unused signals from the entity, 31.05.2012
-- Revision 3.01 - Issue in generating "ce2_int" signal was fixed, 03.05.2012
-- Revision 3.0 	- INTX replaces INTA_D, and INTA is chosen by default, 02.05.2012
--						- INT3_L, INT4_L, INTP replace INATB, INTC, INTD respectively, 02.05.2012
--						- HRW is newly added, 02.05.2012
-- Revision 2.01 - Temporarily changed INTA_D logic, so that only INTB is considered, 30.11.2011
-- Revision 2.0 - Changes extending RAM address space to 1.5MB, 23.11.2011
-- Revision 1.0 - Changes supporting LCD display device, 25.08.2010
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity address_decoding is
    Port ( A21 : in  STD_LOGIC;
           A20 : in  STD_LOGIC;
           A19 : in  STD_LOGIC;
           A18 : in  STD_LOGIC;
           A17 : in  STD_LOGIC;
           A16 : in  STD_LOGIC;
           A7 : in  STD_LOGIC;
           A6 : in  STD_LOGIC;
           A5 : in  STD_LOGIC;
           A4 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
			  AD0 : in std_logic;
			  SEL0 : in std_logic;
			  SEL1 : in std_logic;
           WR0_L : in  STD_LOGIC;
           WR1_L : in  STD_LOGIC;
           RD_L : in  STD_LOGIC;
			  INTA : in std_logic;
			  INT3_L : in std_logic;
			  INT4_L : in std_logic;
			  INTP : in std_logic;
			  CPLD10 : in std_logic;
			  WAITD : in std_logic;
			  CLK64P : in std_logic;
			  BFX2 : in std_logic;
           RW : out  STD_LOGIC;
           LB_L : out  STD_LOGIC;
           UB_L : out  STD_LOGIC;
           CE2 : out  STD_LOGIC;
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
end address_decoding;

architecture Behavioral of address_decoding is

signal rw_int : std_logic; -- internal read/write signal
signal dstb_int : std_logic; -- internal data strobe
signal cs_uart_int : std_logic;	-- internal chip select (UART)
signal dec_in : std_logic_vector(2 downto 0);	-- internal decoder input (dec_in(2) is used as enable)
signal dec_out : std_logic_vector(3 downto 0);	-- internal decoder output
signal io_rw_en : std_logic;	-- enable for I/O read and write signals
signal ior_int, iow_int : std_logic; -- internal signals for /IOR and /IOW
signal dsp_en : std_logic; -- internal signal to select DSP registers
signal dsp_data_en : std_logic; -- for read/write access to the DSP
signal hpi_sel : std_logic_vector(2 downto 0); -- internal decoder input (hpi_en & A2 & A1)
signal hpi_en : std_logic_vector(3 downto 0); -- internal decoder output (hcn0, hbil, hcn1, hcs)
signal hcn0_int : std_logic; -- internal HCN0 signal
signal hcn1_int : std_logic; -- internal HCN1 signal
signal hbil_int : std_logic; -- internal HBIL signal
signal hcs_int : std_logic; -- internal /HCS signal
signal hcn0_en : std_logic;
signal hcn1_en : std_logic;
signal hbil_en : std_logic;
signal hcs_en : std_logic;
signal sint_int : std_logic; -- internal SINT signal
signal wait_int : std_logic; -- internal WAIT_NEC signal
signal clk32_int : std_logic; -- internal CLK32 signal
signal bfx2v_int : std_logic; -- internal BFX2V signal
signal cs_lcd_int : std_logic;
signal lcd_e_int : std_logic;
signal ce2_int : std_logic;

begin

-- Address space allocation, as of 23.11.2011:

-- 1. RAM (external SRAM), 1,5MB
-- 0x00180000 - 0x001FFFFF (512KB)
-- 0x00200000 - 0x002FFFFF (1MB)

-- 2. Memory mapped IO (UART, LCD/LED display, DSP)
-- DSP HPI: 0x00100000 - 0x0010FFFF (64KB)
-- 			0x00110000 - 0x0011FFFF (64KB)
-- UART: 	0x00140000 - 0x0014FFFF (64KB)
-- LCD/LED:	0x00160000 - 0x0016FFFF (64KB)

-- internal signals

rw_int <= WR0_L and WR1_L; 	-- internal read/write (active low)
dstb_int <= rw_int and RD_L;	-- internal data strobe (active low)
ce2_int <= A21 or ((not A21) and A20 and A19);

-------------------------------------------------------
-- interface logic to the external SRAM (1M x 16 bit)
-- SRAM devices: BS616LV1611, CY62167DV30
-------------------------------------------------------

CE2 <= ce2_int and (not dstb_int);	-- chip enable 2 (active high)

LB_L <= (RD_L and WR0_L) or (not ce2_int);	-- low byte enable (active low)
UB_L <= (RD_L and WR1_L) or (not ce2_int);	-- high byte enable (active low

RW <= rw_int;				-- read/#write (active high, '1' for read, '0' for write)

------------------------------------------------------------
-- interface logic to the LCD display (M9513 with SPLC782A1 controller inside)
-- address in the memory mapped I/O: 0x0016000x (x=0,2,4,6)
--
--	I/O address	command
-- 0x00160000	write instr
-- 0x00160002  read status
-- 0x00160004  write data
-- 0x00160008  read data
------------------------------------------------------------

cs_lcd_int <= (not (A21 or A19 or A16)) and A20 and A18 and A17;	-- chip enable (active high)

lcd_e_int <= not (RD_L and WR0_L);	-- active high

LCD_E <= lcd_e_int and cs_lcd_int;

process(AST, A2, cs_lcd_int, CPLD10)
begin
	if (CPLD10 = '0') then	-- if /RES='0'
		LCD_RS <= '0';	-- set to '0'
	elsif (falling_edge(AST)) then
		if (cs_lcd_int = '1') then -- if LCD selected
			LCD_RS <= A2;				-- then update "register selection" signal
		end if;
	end if;
end process;

process(AST, A1, cs_lcd_int, CPLD10)
begin
	if (CPLD10 = '0') then	-- if /RES='0'
		LCD_RW <= '0';	-- set to '0'
	elsif (falling_edge(AST)) then
		if (cs_lcd_int = '1') then -- if LCD selected
			LCD_RW <= A1;				-- then update "read/write" signal
		end if;
	end if;
end process;

----------------------------------------------------
-- interface logic to the external UART (TL16C554)
-- address in the memory mapped IO: 0x001400xy
--												(x=0,2,4,6 for channel select; y=0-7 for register select)
----------------------------------------------------

cs_uart_int <= A21 or A19 or A17 or A16 or (not (A20 and A18));	-- chip select for UART (active low, internal)
														-- address 0x001400xy (x=0,2,4,6 channel select; y=0-7 register address)

-- internal decoder for generating /CSA, /CSB, /CSC, /CSD signals

dec_in(0) <= A4;
dec_in(1) <= A5;
dec_in(2) <= cs_uart_int;

dec_out <= 	"1110" when dec_in = "000" else
				"1101" when dec_in = "001" else
				"1011" when dec_in = "010" else
				"0111" when dec_in = "011" else
				"1111";

-- generation of CSA_L, CSB_L, CSC_L, and CSD_L signals
CSA_L <= dec_out(0);
CSB_L <= dec_out(1);
CSC_L <= dec_out(2);
CSD_L <= dec_out(3);

-- logic for generating /IOR, /IOW signals

ior_int <= cs_uart_int or RD_L;
iow_int <= cs_uart_int or rw_int;
IOR_L <= ior_int;
IOW_L <= iow_int;

-- logic for generating INTX signal

INTX <= INTA;	-- by default select INTA

------------------------------------------------------------
-- interface logic to the DSP (TMS320UC5402)
-- address in the memory mapped I/O: 0x0010000x (x=0,2,4,6)
------------------------------------------------------------

-- chip select for DSP (active low, internal use)
dsp_en <= A21 or A19 or A18 or A17 or A16 or (not A20);
-- for read/write access to the DSP (active low, internal use)
dsp_data_en <= A21 or A19 or A18 or A17 or (not (A20 and A16));	-- activates when accessing to D_DSP_DATA (0x00110000)

-- "hpi_sel" is an array of dsp_en, A2, and A1 signals (hpi_sel = dsp_en & A2 & A1)
hpi_sel(2) <= dsp_en;
hpi_sel(1) <= A2;
hpi_sel(0) <= A1;

-- "hpi_en" is an array of hcs, hcn1, hbil, and hcn0 signals (hpi_en = hcs & hchn1 & hbil & hbi0)
-- 3-to-8 decoder, input=hpi_sel, output=hpi_en (active high)
hpi_en <= "1110" when hpi_sel = "000" else	-- hcs
			 "1101" when hpi_sel = "001" else	-- hcn1
			 "1011" when hpi_sel = "010" else	-- hbil
			 "0111" when hpi_sel = "011" else	-- hcn0
			 "1111";

hcn0_en <= hpi_en(3) or rw_int;	-- active low, for latch
hbil_en <= hpi_en(2) or rw_int;
hcn1_en <= hpi_en(1) or rw_int;

-- generation of internal hcn0, hcn1, hbil, and hcs signals

process(hcn0_en, AD0, CPLD10)
begin
	if (CPLD10 = '0') then	-- if /RES='0'
		hcn0_int <= '0';	-- set to '0'
	elsif (hcn0_en = '0') then
			hcn0_int <= AD0;
	end if;
end process;

process(hbil_en, AD0, CPLD10)
begin
	if (CPLD10 = '0') then	-- if /RES='0'
		hbil_int <= '0';	-- set to '0'
	elsif (hbil_en = '0') then
			hbil_int <= AD0;
	end if;
end process;

process(hcn1_en, AD0, CPLD10)
begin
	if (CPLD10 = '0') then	-- if /RES='0'
		hcn1_int <= '0';	-- set to '0'
	elsif (hcn1_en = '0') then
			hcn1_int <= AD0;
		end if;
end process;

hcs_int <= dstb_int or dsp_data_en; -- active low

-- HCN0, HCN1, HBIL, /HCS signals
HCN0 <= hcn0_int;
HCN1 <= hcn1_int;
HBIL <= hbil_int;
HCS_L <= hcs_int;		-- active low

-- /HSTB signal, active low
HSTB_L <= dstb_int or dsp_data_en;	-- activates when access to D_DSP_DATA (0x00110000)

-- SINT signal
sint_int <= not (SEL0 and SEL1);
SINT <= sint_int;

-- HRW signal
HRW <= rw_int;				-- in order to distinguish from RW (R/W) other logic can be used later, 02.05.12

-- WAIT_NEC (or WAIT) signal
wait_int <= WAITD;
WAIT_NEC <= wait_int;

-- CLK32 signal

process(CLK64P, CPLD10)
begin
	if (CPLD10 = '0') then
		clk32_int <= '0';
	elsif (CLK64P'event and CLK64P = '1') then
		clk32_int <= not clk32_int;
	end if;
end process;

CLK32 <= clk32_int;

-- BFX2V signal (used in "Sprach PLL")

process(BFX2, CPLD10)
begin
	if (CPLD10 = '0') then
		bfx2v_int <= '0';
	elsif (BFX2'event and BFX2 = '1') then
		bfx2v_int <= not bfx2v_int;
	end if;
end process;

BFX2V <= bfx2v_int;

end Behavioral;
