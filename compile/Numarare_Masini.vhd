---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Proiect_B8_Parcare
-- Author      : Microsoft
-- Company     : Microsoft
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\Users\Endre\Desktop\Automatica si Calculatoare\Proiectarea Sistemelor Numerice (PSN)\Gabos Endre Workspace\Gabos_Endre\Proiect_B8_Parcare\compile\Numarare_Masini.vhd
-- Generated   : Wed May 20 03:04:56 2020
-- From        : c:\Users\Endre\Desktop\Automatica si Calculatoare\Proiectarea Sistemelor Numerice (PSN)\Gabos Endre Workspace\Gabos_Endre\Proiect_B8_Parcare\src\Numarare_Masini.bde
-- By          : Bde2Vhdl ver. 2.6
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Numarare_Masini is
  port(
       NOT_ERR_COUNTER : in std_logic;
       NR_DOWN : in std_logic;
       NR_UP : in std_logic;
       clk : in std_logic;
       reset : in std_logic;
       Q0 : out std_logic;
       Q1 : out std_logic;
       Q2 : out std_logic;
       Q3 : out std_logic;
       Intrare : inout std_logic_vector(3 downto 0)
  );
end Numarare_Masini;

architecture structurala of Numarare_Masini is

---- Component declarations -----

component DEMUX_1_2
  port (
       a : in STD_LOGIC;
       sel : in STD_LOGIC;
       x0 : out STD_LOGIC;
       x1 : out STD_LOGIC
  );
end component;
component NU
  port (
       a : in STD_LOGIC;
       b : out STD_LOGIC
  );
end component;
component NUMARATOR_REVERSIBIL
  port (
       c_down : in STD_LOGIC;
       c_up : in STD_LOGIC;
       clk : in STD_LOGIC;
       enable : in STD_LOGIC;
       reset : in STD_LOGIC;
       Q0 : out STD_LOGIC;
       Q1 : out STD_LOGIC;
       Q2 : out STD_LOGIC;
       Q3 : out STD_LOGIC;
       Intrare : inout STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component Registru_Memorie
  port (
       E : in STD_LOGIC;
       X0 : in STD_LOGIC;
       X1 : in STD_LOGIC;
       X2 : in STD_LOGIC;
       X3 : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       Q0 : out STD_LOGIC;
       Q1 : out STD_LOGIC;
       Q2 : out STD_LOGIC;
       Q3 : out STD_LOGIC
  );
end component;
component SAU
  port (
       a : in STD_LOGIC;
       b : in STD_LOGIC;
       y : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal Not_SEMN : std_logic;
signal NR_0 : std_logic;
signal NR_1 : std_logic;
signal NR_2 : std_logic;
signal NR_3 : std_logic;
signal SEMN : std_logic;
signal Y0 : std_logic;
signal Y1 : std_logic;

begin

----  Component instantiations  ----

DMUX1_2 : DEMUX_1_2
  port map(
       a => SEMN,
       sel => NR_DOWN,
       x0 => Y0,
       x1 => Y1
  );

MEM_REGISTER : Registru_Memorie
  port map(
       E => Not_SEMN,
       Q0 => Q0,
       Q1 => Q1,
       Q2 => Q2,
       Q3 => Q3,
       X0 => NR_0,
       X1 => NR_1,
       X2 => NR_2,
       X3 => NR_3,
       clk => clk,
       reset => reset
  );

NOT_17 : NU
  port map(
       a => SEMN,
       b => Not_SEMN
  );

NUMARATOR : NUMARATOR_REVERSIBIL
  port map(
       Intrare => Intrare,
       Q0 => NR_0,
       Q1 => NR_1,
       Q2 => NR_2,
       Q3 => NR_3,
       c_down => Y1,
       c_up => Y0,
       clk => clk,
       enable => NOT_ERR_COUNTER,
       reset => reset
  );

OR_C : SAU
  port map(
       a => NR_UP,
       b => NR_DOWN,
       y => SEMN
  );


end structurala;
