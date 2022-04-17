---------------------------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : Proiect_B8_Parcare
-- Author      : Microsoft
-- Company     : Microsoft
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\Users\Endre\Desktop\Automatica si Calculatoare\Proiectarea Sistemelor Numerice (PSN)\Gabos Endre Workspace\Gabos_Endre\Proiect_B8_Parcare\compile\Afisare_Rezultat.vhd
-- Generated   : Wed May 20 03:01:51 2020
-- From        : c:\Users\Endre\Desktop\Automatica si Calculatoare\Proiectarea Sistemelor Numerice (PSN)\Gabos Endre Workspace\Gabos_Endre\Proiect_B8_Parcare\src\Afisare_Rezultat.bde
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

entity Afisare_Rezultat is
  port(
       NR_DOWN : in STD_LOGIC;
       NR_UP : in STD_LOGIC;
       REZ_0 : in STD_LOGIC;
       REZ_1 : in STD_LOGIC;
       REZ_2 : in STD_LOGIC;
       REZ_3 : in STD_LOGIC;
       ERR_COUNTER : out STD_LOGIC;
       Iesire : out STD_LOGIC_VECTOR(6 downto 0)
  );
end Afisare_Rezultat;

architecture structural of Afisare_Rezultat is

---- Component declarations -----

component BCD_7SEGMENTE
  port (
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       C : in STD_LOGIC;
       D : in STD_LOGIC;
       Iesire : out STD_LOGIC_VECTOR(6 downto 0)
  );
end component;
component NU
  port (
       a : in STD_LOGIC;
       b : out STD_LOGIC
  );
end component;
component SAU
  port (
       a : in STD_LOGIC;
       b : in STD_LOGIC;
       y : out STD_LOGIC
  );
end component;
component SI_5
  port (
       a : in STD_LOGIC;
       b : in STD_LOGIC;
       c : in STD_LOGIC;
       d : in STD_LOGIC;
       e : in STD_LOGIC;
       y : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal EMPTY : std_logic;
signal FULL : std_logic;
signal Not_REZ_0 : std_logic;
signal Not_REZ_1 : std_logic;
signal Not_REZ_2 : std_logic;
signal Not_REZ_3 : std_logic;

begin

----  Component instantiations  ----

AND5_1 : SI_5
  port map(
       a => NR_UP,
       b => REZ_3,
       c => REZ_2,
       d => REZ_1,
       e => Not_REZ_0,
       y => FULL
  );

AND5_2 : SI_5
  port map(
       a => Not_REZ_3,
       b => Not_REZ_2,
       c => Not_REZ_1,
       d => Not_REZ_0,
       e => NR_DOWN,
       y => EMPTY
  );

BCD_7SEGM_DECODER : BCD_7SEGMENTE
  port map(
       A => REZ_0,
       B => REZ_1,
       C => REZ_2,
       D => REZ_3,
       Iesire => Iesire
  );

NOT_18 : NU
  port map(
       a => REZ_3,
       b => Not_REZ_3
  );

NOT_19 : NU
  port map(
       a => REZ_2,
       b => Not_REZ_2
  );

NOT_20 : NU
  port map(
       a => REZ_1,
       b => Not_REZ_1
  );

NOT_21 : NU
  port map(
       a => REZ_0,
       b => Not_REZ_0
  );

NOT_23 : NU
  port map(
       a => REZ_0,
       b => Not_REZ_0
  );

OR_E : SAU
  port map(
       a => FULL,
       b => EMPTY,
       y => ERR_COUNTER
  );


end structural;
