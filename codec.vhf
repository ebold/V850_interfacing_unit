--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : sch2hdl
--  /   /         Filename : codec.vhf
-- /___/   /\     Timestamp : 09/12/2018 12:04:51
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.6\ISE_DS\ISE\bin\nt64\unwrapped\sch2hdl.exe -intstyle ise -family xc9500xl -flat -suppress -vhdl codec.vhf -w C:/Users/oc/AppData/Local/Temp/efe/address_decoder/codec.sch
--Design Name: codec
--Device: xc9500xl
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FTCE_MXILINX_codec is
   generic( INIT : bit :=  '0');
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          T   : in    std_logic; 
          Q   : out   std_logic);
end FTCE_MXILINX_codec;

architecture BEHAVIORAL of FTCE_MXILINX_codec is
   attribute BOX_TYPE       : string ;
   signal TQ      : std_logic;
   signal Q_DUMMY : std_logic;
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component FDCE
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
begin
   Q <= Q_DUMMY;
   I_36_32 : XOR2
      port map (I0=>T,
                I1=>Q_DUMMY,
                O=>TQ);
   
   I_36_35 : FDCE
   generic map( INIT => INIT)
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>TQ,
                Q=>Q_DUMMY);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CB8CE_MXILINX_codec is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          CEO : out   std_logic; 
          Q   : out   std_logic_vector (7 downto 0); 
          TC  : out   std_logic);
end CB8CE_MXILINX_codec;

architecture BEHAVIORAL of CB8CE_MXILINX_codec is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal T2       : std_logic;
   signal T3       : std_logic;
   signal T4       : std_logic;
   signal T5       : std_logic;
   signal T6       : std_logic;
   signal T7       : std_logic;
   signal XLXN_1   : std_logic;
   signal Q_DUMMY  : std_logic_vector (7 downto 0);
   signal TC_DUMMY : std_logic;
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component FTCE_MXILINX_codec
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   attribute HU_SET of Q0 : label is "Q0_6";
   attribute HU_SET of Q1 : label is "Q1_7";
   attribute HU_SET of Q2 : label is "Q2_3";
   attribute HU_SET of Q3 : label is "Q3_4";
   attribute HU_SET of Q4 : label is "Q4_5";
   attribute HU_SET of Q5 : label is "Q5_2";
   attribute HU_SET of Q6 : label is "Q6_1";
   attribute HU_SET of Q7 : label is "Q7_0";
begin
   Q(7 downto 0) <= Q_DUMMY(7 downto 0);
   TC <= TC_DUMMY;
   I_36_1 : AND5
      port map (I0=>Q_DUMMY(7),
                I1=>Q_DUMMY(6),
                I2=>Q_DUMMY(5),
                I3=>Q_DUMMY(4),
                I4=>T4,
                O=>TC_DUMMY);
   
   I_36_2 : AND2
      port map (I0=>Q_DUMMY(4),
                I1=>T4,
                O=>T5);
   
   I_36_11 : AND3
      port map (I0=>Q_DUMMY(5),
                I1=>Q_DUMMY(4),
                I2=>T4,
                O=>T6);
   
   I_36_15 : AND4
      port map (I0=>Q_DUMMY(3),
                I1=>Q_DUMMY(2),
                I2=>Q_DUMMY(1),
                I3=>Q_DUMMY(0),
                O=>T4);
   
   I_36_16 : VCC
      port map (P=>XLXN_1);
   
   I_36_24 : AND2
      port map (I0=>Q_DUMMY(1),
                I1=>Q_DUMMY(0),
                O=>T2);
   
   I_36_26 : AND3
      port map (I0=>Q_DUMMY(2),
                I1=>Q_DUMMY(1),
                I2=>Q_DUMMY(0),
                O=>T3);
   
   I_36_28 : AND4
      port map (I0=>Q_DUMMY(6),
                I1=>Q_DUMMY(5),
                I2=>Q_DUMMY(4),
                I3=>T4,
                O=>T7);
   
   I_36_31 : AND2
      port map (I0=>CE,
                I1=>TC_DUMMY,
                O=>CEO);
   
   Q0 : FTCE_MXILINX_codec
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>XLXN_1,
                Q=>Q_DUMMY(0));
   
   Q1 : FTCE_MXILINX_codec
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>Q_DUMMY(0),
                Q=>Q_DUMMY(1));
   
   Q2 : FTCE_MXILINX_codec
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>T2,
                Q=>Q_DUMMY(2));
   
   Q3 : FTCE_MXILINX_codec
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>T3,
                Q=>Q_DUMMY(3));
   
   Q4 : FTCE_MXILINX_codec
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>T4,
                Q=>Q_DUMMY(4));
   
   Q5 : FTCE_MXILINX_codec
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>T5,
                Q=>Q_DUMMY(5));
   
   Q6 : FTCE_MXILINX_codec
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>T6,
                Q=>Q_DUMMY(6));
   
   Q7 : FTCE_MXILINX_codec
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                T=>T7,
                Q=>Q_DUMMY(7));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity COMP8_MXILINX_codec is
   port ( A  : in    std_logic_vector (7 downto 0); 
          B  : in    std_logic_vector (7 downto 0); 
          EQ : out   std_logic);
end COMP8_MXILINX_codec;

architecture BEHAVIORAL of COMP8_MXILINX_codec is
   attribute BOX_TYPE   : string ;
   signal AB0  : std_logic;
   signal AB1  : std_logic;
   signal AB2  : std_logic;
   signal AB3  : std_logic;
   signal AB4  : std_logic;
   signal AB5  : std_logic;
   signal AB6  : std_logic;
   signal AB7  : std_logic;
   signal AB03 : std_logic;
   signal AB47 : std_logic;
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component XNOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XNOR2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   I_36_32 : AND4
      port map (I0=>AB7,
                I1=>AB6,
                I2=>AB5,
                I3=>AB4,
                O=>AB47);
   
   I_36_33 : XNOR2
      port map (I0=>B(6),
                I1=>A(6),
                O=>AB6);
   
   I_36_34 : XNOR2
      port map (I0=>B(7),
                I1=>A(7),
                O=>AB7);
   
   I_36_35 : XNOR2
      port map (I0=>B(5),
                I1=>A(5),
                O=>AB5);
   
   I_36_36 : XNOR2
      port map (I0=>B(4),
                I1=>A(4),
                O=>AB4);
   
   I_36_41 : AND4
      port map (I0=>AB3,
                I1=>AB2,
                I2=>AB1,
                I3=>AB0,
                O=>AB03);
   
   I_36_42 : XNOR2
      port map (I0=>B(2),
                I1=>A(2),
                O=>AB2);
   
   I_36_43 : XNOR2
      port map (I0=>B(3),
                I1=>A(3),
                O=>AB3);
   
   I_36_44 : XNOR2
      port map (I0=>B(1),
                I1=>A(1),
                O=>AB1);
   
   I_36_45 : XNOR2
      port map (I0=>B(0),
                I1=>A(0),
                O=>AB0);
   
   I_36_50 : AND2
      port map (I0=>AB47,
                I1=>AB03,
                O=>EQ);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FDC_MXILINX_codec is
   generic( INIT : bit :=  '0');
   port ( C   : in    std_logic; 
          CLR : in    std_logic; 
          D   : in    std_logic; 
          Q   : out   std_logic);
end FDC_MXILINX_codec;

architecture BEHAVIORAL of FDC_MXILINX_codec is
   attribute BOX_TYPE   : string ;
   signal XLXN_5 : std_logic;
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component FDCP
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             PRE : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCP : component is "BLACK_BOX";
   
begin
   I_36_55 : GND
      port map (G=>XLXN_5);
   
   U0 : FDCP
   generic map( INIT => INIT)
      port map (C=>C,
                CLR=>CLR,
                D=>D,
                PRE=>XLXN_5,
                Q=>Q);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FTC_MXILINX_codec is
   generic( INIT : bit :=  '0');
   port ( C   : in    std_logic; 
          CLR : in    std_logic; 
          T   : in    std_logic; 
          Q   : out   std_logic);
end FTC_MXILINX_codec;

architecture BEHAVIORAL of FTC_MXILINX_codec is
   attribute BOX_TYPE       : string ;
   attribute HU_SET         : string ;
   signal TQ      : std_logic;
   signal Q_DUMMY : std_logic;
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component FDC_MXILINX_codec
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   attribute HU_SET of I_36_35 : label is "I_36_35_8";
begin
   Q <= Q_DUMMY;
   I_36_32 : XOR2
      port map (I0=>T,
                I1=>Q_DUMMY,
                O=>TQ);
   
   I_36_35 : FDC_MXILINX_codec
   generic map( INIT => INIT)
      port map (C=>C,
                CLR=>CLR,
                D=>TQ,
                Q=>Q_DUMMY);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity codec is
   port ( frame  : in    std_logic; 
          modd   : in    std_logic; 
          ck_out : out   std_logic; 
          fr_out : out   std_logic);
end codec;

architecture BEHAVIORAL of codec is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal C       : std_logic_vector (7 downto 0);
   signal D       : std_logic_vector (7 downto 0);
   signal P       : std_logic_vector (7 downto 0);
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_28 : std_logic;
   signal XLXN_29 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component COMP8_MXILINX_codec
      port ( A  : in    std_logic_vector (7 downto 0); 
             B  : in    std_logic_vector (7 downto 0); 
             EQ : out   std_logic);
   end component;
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component CB8CE_MXILINX_codec
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (7 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component FTC_MXILINX_codec
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   attribute HU_SET of I39 : label is "I39_10";
   attribute HU_SET of I40 : label is "I40_11";
   attribute HU_SET of I58 : label is "I58_12";
   attribute HU_SET of I60 : label is "I60_9";
begin
   I35 : INV
      port map (I=>modd,
                O=>XLXN_29);
   
   I36 : INV
      port map (I=>frame,
                O=>XLXN_28);
   
   I37 : AND2
      port map (I0=>frame,
                I1=>XLXN_8,
                O=>XLXN_3);
   
   I38 : OR2
      port map (I0=>XLXN_10,
                I1=>XLXN_9,
                O=>XLXN_8);
   
   I39 : COMP8_MXILINX_codec
      port map (A(7 downto 0)=>C(7 downto 0),
                B(7 downto 0)=>D(7 downto 0),
                EQ=>XLXN_10);
   
   I40 : COMP8_MXILINX_codec
      port map (A(7 downto 0)=>P(7 downto 0),
                B(7 downto 0)=>C(7 downto 0),
                EQ=>XLXN_9);
   
   I41 : BUF
      port map (I=>XLXN_3,
                O=>ck_out);
   
   I42 : VCC
      port map (P=>D(5));
   
   I43 : GND
      port map (G=>P(0));
   
   I44 : GND
      port map (G=>P(1));
   
   I45 : GND
      port map (G=>P(2));
   
   I46 : GND
      port map (G=>P(3));
   
   I47 : GND
      port map (G=>P(4));
   
   I48 : GND
      port map (G=>P(5));
   
   I49 : GND
      port map (G=>P(6));
   
   I50 : GND
      port map (G=>P(7));
   
   I51 : GND
      port map (G=>D(7));
   
   I52 : GND
      port map (G=>D(6));
   
   I53 : GND
      port map (G=>D(4));
   
   I54 : GND
      port map (G=>D(3));
   
   I55 : GND
      port map (G=>D(2));
   
   I56 : GND
      port map (G=>D(1));
   
   I57 : GND
      port map (G=>D(0));
   
   I58 : CB8CE_MXILINX_codec
      port map (C=>XLXN_28,
                CE=>XLXN_29,
                CLR=>modd,
                CEO=>open,
                Q(7 downto 0)=>C(7 downto 0),
                TC=>open);
   
   I59 : VCC
      port map (P=>XLXN_1);
   
   I60 : FTC_MXILINX_codec
      port map (C=>XLXN_3,
                CLR=>XLXN_2,
                T=>XLXN_1,
                Q=>fr_out);
   
   I61 : GND
      port map (G=>XLXN_2);
   
end BEHAVIORAL;


