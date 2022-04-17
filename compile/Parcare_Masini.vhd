---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Proiect_B8_Parcare
-- Author      : Microsoft
-- Company     : Microsoft
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\Users\Endre\Desktop\Automatica si Calculatoare\Proiectarea Sistemelor Numerice (PSN)\Gabos Endre Workspace\Gabos_Endre\Proiect_B8_Parcare\compile\Parcare_Masini.vhd
-- Generated   : Fri May 22 02:07:24 2020
-- From        : c:\Users\Endre\Desktop\Automatica si Calculatoare\Proiectarea Sistemelor Numerice (PSN)\Gabos Endre Workspace\Gabos_Endre\Proiect_B8_Parcare\src\Parcare_Masini.bde
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

entity Parcare_Masini is
  port(
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       B1 : in STD_LOGIC;
       B2 : in STD_LOGIC;
       C1 : in STD_LOGIC;
       C2 : in STD_LOGIC;
       D1 : in STD_LOGIC;
       D2 : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       ERROR : out STD_LOGIC;
       Iesire : out STD_LOGIC_VECTOR(6 downto 0);
       Intrare : inout STD_LOGIC_VECTOR(3 downto 0)
  );
end Parcare_Masini;

architecture structural of Parcare_Masini is

---- Component declarations -----

component Afisare_Rezultat
  port (
       NR_DOWN : in STD_LOGIC;
       NR_UP : in STD_LOGIC;
       REZ_0 : in STD_LOGIC;
       REZ_1 : in STD_LOGIC;
       REZ_2 : in STD_LOGIC;
       REZ_3 : in STD_LOGIC;
       ERR_COUNTER : out STD_LOGIC;
       Iesire : out STD_LOGIC_VECTOR(6 downto 0)
  );
end component;
component Cazuri_Numarator
  port (
       IN_A : in STD_LOGIC;
       IN_C : in STD_LOGIC;
       OUT_B : in STD_LOGIC;
       OUT_D : in STD_LOGIC;
       NR_DOWN : out STD_LOGIC;
       NR_UP : out STD_LOGIC
  );
end component;
component Is_Car_and_Errors
  port (
       A_CAR : in STD_LOGIC;
       A_Prim : in STD_LOGIC;
       B_CAR : in STD_LOGIC;
       B_Prim : in STD_LOGIC;
       C_CAR : in STD_LOGIC;
       C_Prim : in STD_LOGIC;
       D_CAR : in STD_LOGIC;
       D_Prim : in STD_LOGIC;
       ERR_COUNTER : in STD_LOGIC;
       ERROR : out STD_LOGIC;
       IN_A : out STD_LOGIC;
       IN_C : out STD_LOGIC;
       OUT_B : out STD_LOGIC;
       OUT_D : out STD_LOGIC
  );
end component;
component NU
  port (
       a : in STD_LOGIC;
       b : out STD_LOGIC
  );
end component;
component Numarare_Masini
  port (
       NOT_ERR_COUNTER : in STD_LOGIC;
       NR_DOWN : in STD_LOGIC;
       NR_UP : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       Q0 : out STD_LOGIC;
       Q1 : out STD_LOGIC;
       Q2 : out STD_LOGIC;
       Q3 : out STD_LOGIC;
       Intrare : inout STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component Semnal_Prim
  port (
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       B1 : in STD_LOGIC;
       B2 : in STD_LOGIC;
       C1 : in STD_LOGIC;
       C2 : in STD_LOGIC;
       D1 : in STD_LOGIC;
       D2 : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       A_Prim : out STD_LOGIC;
       B_Prim : out STD_LOGIC;
       C_Prim : out STD_LOGIC;
       D_Prim : out STD_LOGIC
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

signal A_CAR : std_logic;
signal A_Prim : std_logic;
signal B_CAR : std_logic;
signal B_Prim : std_logic;
signal C_CAR : std_logic;
signal C_Prim : std_logic;
signal D_CAR : std_logic;
signal D_Prim : std_logic;
signal ERR_COUNTER : std_logic;
signal IN_A : std_logic;
signal IN_C : std_logic;
signal NET484 : STD_LOGIC;
signal NET501 : STD_LOGIC;
signal NOT_ERR_COUNTER : std_logic;
signal NR_DOWN : std_logic;
signal NR_UP : std_logic;
signal OUT_B : std_logic;
signal OUT_D : std_logic;
signal REZ_0 : std_logic;
signal REZ_1 : std_logic;
signal REZ_2 : std_logic;
signal REZ_3 : std_logic;

begin

----  Component instantiations  ----

AND_A : SI_2
  port map(
       a => A1,
       b => A2,
       y => A_CAR
  );

AND_B : SI_2
  port map(
       a => B1,
       b => B2,
       y => B_CAR
  );

AND_C : SI_2
  port map(
       a => C1,
       b => C2,
       y => C_CAR
  );

AND_D : SI_2
  port map(
       a => D1,
       b => D2,
       y => D_CAR
  );

NOT_22 : NU
  port map(
       a => ERR_COUNTER,
       b => NOT_ERR_COUNTER
  );

Part1 : Semnal_Prim
  port map(
       A1 => A1,
       A2 => A2,
       A_Prim => A_Prim,
       B1 => B1,
       B2 => B2,
       B_Prim => B_Prim,
       C1 => C1,
       C2 => C2,
       C_Prim => C_Prim,
       D1 => D1,
       D2 => D2,
       D_Prim => D_Prim,
       clk => clk,
       reset => reset
  );

Part2 : Is_Car_and_Errors
  port map(
       A_CAR => A_CAR,
       A_Prim => A_Prim,
       B_CAR => B_CAR,
       B_Prim => B_Prim,
       C_CAR => C_CAR,
       C_Prim => C_Prim,
       D_CAR => D_CAR,
       D_Prim => D_Prim,
       ERROR => ERROR,
       ERR_COUNTER => ERR_COUNTER,
       IN_A => IN_A,
       IN_C => IN_C,
       OUT_B => OUT_B,
       OUT_D => OUT_D
  );

Part3 : Cazuri_Numarator
  port map(
       IN_A => IN_A,
       IN_C => IN_C,
       NR_DOWN => NET484,
       NR_UP => NET501,
       OUT_B => OUT_B,
       OUT_D => OUT_D
  );

Part4 : Numarare_Masini
  port map(
       Intrare => Intrare,
       NOT_ERR_COUNTER => NOT_ERR_COUNTER,
       NR_DOWN => NET484,
       NR_UP => NET501,
       Q0 => REZ_0,
       Q1 => REZ_1,
       Q2 => REZ_2,
       Q3 => REZ_3,
       clk => clk,
       reset => reset
  );

Part5 : Afisare_Rezultat
  port map(
       ERR_COUNTER => ERR_COUNTER,
       Iesire => Iesire,
       NR_DOWN => NET484,
       NR_UP => NET501,
       REZ_0 => REZ_0,
       REZ_1 => REZ_1,
       REZ_2 => REZ_2,
       REZ_3 => REZ_3
  );


end structural;
