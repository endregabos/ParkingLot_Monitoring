---------------------------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : Proiect_B8_Parcare
-- Author      : Microsoft
-- Company     : Microsoft
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\Users\Endre\Desktop\Automatica si Calculatoare\Proiectarea Sistemelor Numerice (PSN)\Gabos Endre Workspace\Gabos_Endre\Proiect_B8_Parcare\compile\Cazuri_Numarator.vhd
-- Generated   : Wed May 20 02:14:04 2020
-- From        : c:\Users\Endre\Desktop\Automatica si Calculatoare\Proiectarea Sistemelor Numerice (PSN)\Gabos Endre Workspace\Gabos_Endre\Proiect_B8_Parcare\src\Cazuri_Numarator.bde
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

entity Cazuri_Numarator is
  port(
       IN_A : in std_logic;
       IN_C : in std_logic;
       OUT_B : in std_logic;
       OUT_D : in std_logic;
       NR_DOWN : out std_logic;
       NR_UP : out std_logic
  );
end Cazuri_Numarator;

architecture structural of Cazuri_Numarator is

---- Component declarations -----

component NU
  port (
       a : in STD_LOGIC;
       b : out STD_LOGIC
  );
end component;
component SAU_4
  port (
       a : in STD_LOGIC;
       b : in STD_LOGIC;
       c : in STD_LOGIC;
       d : in STD_LOGIC;
       y : out STD_LOGIC
  );
end component;
component SI_3
  port (
       a : in STD_LOGIC;
       b : in STD_LOGIC;
       c : in STD_LOGIC;
       y : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal IN_1 : std_logic;
signal IN_2 : std_logic;
signal IN_3 : std_logic;
signal IN_4 : std_logic;
signal Not_IN_A : std_logic;
signal Not_IN_C : std_logic;
signal Not_OUT_B : std_logic;
signal Not_OUT_D : std_logic;
signal OUT_1 : std_logic;
signal OUT_2 : std_logic;
signal OUT_3 : std_logic;
signal OUT_4 : std_logic;

begin

----  Component instantiations  ----

AND3_1 : SI_3
  port map(
       a => OUT_B,
       b => Not_IN_C,
       c => Not_IN_A,
       y => OUT_1
  );

AND3_2 : SI_3
  port map(
       a => OUT_D,
       b => Not_IN_C,
       c => Not_IN_A,
       y => OUT_2
  );

AND3_3 : SI_3
  port map(
       a => OUT_D,
       b => OUT_B,
       c => Not_IN_A,
       y => OUT_3
  );

AND3_4 : SI_3
  port map(
       a => OUT_D,
       b => OUT_B,
       c => Not_IN_C,
       y => OUT_4
  );

AND3_5 : SI_3
  port map(
       a => Not_OUT_D,
       b => Not_OUT_B,
       c => IN_C,
       y => IN_1
  );

AND3_6 : SI_3
  port map(
       a => Not_OUT_D,
       b => Not_OUT_B,
       c => IN_A,
       y => IN_2
  );

AND3_7 : SI_3
  port map(
       a => Not_OUT_D,
       b => IN_C,
       c => IN_A,
       y => IN_3
  );

AND3_8 : SI_3
  port map(
       a => IN_A,
       b => IN_C,
       c => Not_OUT_B,
       y => IN_4
  );

C_DOWN : SAU_4
  port map(
       a => IN_1,
       b => IN_2,
       c => IN_3,
       d => IN_4,
       y => NR_DOWN
  );

C_UP : SAU_4
  port map(
       a => OUT_1,
       b => OUT_2,
       c => OUT_3,
       d => OUT_4,
       y => NR_UP
  );

NOT_10 : NU
  port map(
       a => IN_C,
       b => Not_IN_C
  );

NOT_11 : NU
  port map(
       a => OUT_D,
       b => Not_OUT_D
  );

NOT_12 : NU
  port map(
       a => OUT_B,
       b => Not_OUT_B
  );

NOT_13 : NU
  port map(
       a => OUT_D,
       b => Not_OUT_D
  );

NOT_14 : NU
  port map(
       a => OUT_B,
       b => Not_OUT_B
  );

NOT_15 : NU
  port map(
       a => OUT_D,
       b => Not_OUT_D
  );

NOT_16 : NU
  port map(
       a => OUT_B,
       b => Not_OUT_B
  );

NOT_5 : NU
  port map(
       a => IN_C,
       b => Not_IN_C
  );

NOT_6 : NU
  port map(
       a => IN_A,
       b => Not_IN_A
  );

NOT_7 : NU
  port map(
       a => IN_C,
       b => Not_IN_C
  );

NOT_8 : NU
  port map(
       a => IN_A,
       b => Not_IN_A
  );

NOT_9 : NU
  port map(
       a => IN_A,
       b => Not_IN_A
  );


end structural;
