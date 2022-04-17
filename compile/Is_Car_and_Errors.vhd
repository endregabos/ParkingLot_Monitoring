---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Proiect_B8_Parcare
-- Author      : Microsoft
-- Company     : Microsoft
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\Users\Endre\Desktop\Automatica si Calculatoare\Proiectarea Sistemelor Numerice (PSN)\Gabos Endre Workspace\Gabos_Endre\Proiect_B8_Parcare\compile\Is_Car_and_Errors.vhd
-- Generated   : Wed May 20 00:11:31 2020
-- From        : c:\Users\Endre\Desktop\Automatica si Calculatoare\Proiectarea Sistemelor Numerice (PSN)\Gabos Endre Workspace\Gabos_Endre\Proiect_B8_Parcare\src\Is_Car_and_Errors.bde
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

entity Is_Car_and_Errors is
  port(
       A_CAR : in std_logic;
       A_Prim : in std_logic;
       B_CAR : in std_logic;
       B_Prim : in std_logic;
       C_CAR : in std_logic;
       C_Prim : in std_logic;
       D_CAR : in std_logic;
       D_Prim : in std_logic;
       ERR_COUNTER : in std_logic;
       ERROR : out std_logic;
       IN_A : out std_logic;
       IN_C : out std_logic;
       OUT_B : out std_logic;
       OUT_D : out std_logic
  );
end Is_Car_and_Errors;

architecture structural of Is_Car_and_Errors is

---- Component declarations -----

component NU
  port (
       a : in STD_LOGIC;
       b : out STD_LOGIC
  );
end component;
component SAU_5
  port (
       a : in STD_LOGIC;
       b : in STD_LOGIC;
       c : in STD_LOGIC;
       d : in STD_LOGIC;
       e : in STD_LOGIC;
       y : out STD_LOGIC
  );
end component;
component SI_2
  port (
       a : in STD_LOGIC;
       b : in STD_LOGIC;
       y : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal ERROR_A : std_logic;
signal ERROR_B : std_logic;
signal ERROR_C : std_logic;
signal ERROR_D : std_logic;
signal Not_A_Prim : std_logic;
signal Not_B_Prim : std_logic;
signal Not_C_Prim : std_logic;
signal Not_D_Prim : std_logic;

begin

----  Component instantiations  ----

A : SI_2
  port map(
       a => A_CAR,
       b => A_Prim,
       y => IN_A
  );

B : SI_2
  port map(
       a => B_CAR,
       b => B_Prim,
       y => OUT_B
  );

C : SI_2
  port map(
       a => C_CAR,
       b => C_Prim,
       y => IN_C
  );

D : SI_2
  port map(
       a => D_CAR,
       b => D_Prim,
       y => OUT_D
  );

ERR_A : SI_2
  port map(
       a => Not_A_Prim,
       b => A_CAR,
       y => ERROR_A
  );

ERR_B : SI_2
  port map(
       a => Not_B_Prim,
       b => B_CAR,
       y => ERROR_B
  );

ERR_C : SI_2
  port map(
       a => Not_C_Prim,
       b => C_CAR,
       y => ERROR_C
  );

ERR_D : SI_2
  port map(
       a => Not_D_Prim,
       b => D_CAR,
       y => ERROR_D
  );

NOT_1 : NU
  port map(
       a => D_Prim,
       b => Not_D_Prim
  );

NOT_2 : NU
  port map(
       a => B_Prim,
       b => Not_B_Prim
  );

NOT_3 : NU
  port map(
       a => C_Prim,
       b => Not_C_Prim
  );

NOT_4 : NU
  port map(
       a => A_Prim,
       b => Not_A_Prim
  );

SAU_ERR : SAU_5
  port map(
       a => ERR_COUNTER,
       b => ERROR_D,
       c => ERROR_B,
       d => ERROR_C,
       e => ERROR_A,
       y => ERROR
  );


end structural;
