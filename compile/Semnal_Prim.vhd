---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Proiect_B8_Parcare
-- Author      : Microsoft
-- Company     : Microsoft
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\Users\Endre\Desktop\Automatica si Calculatoare\Proiectarea Sistemelor Numerice (PSN)\Gabos Endre Workspace\Gabos_Endre\Proiect_B8_Parcare\compile\Semnal_Prim.vhd
-- Generated   : Wed May 20 00:05:41 2020
-- From        : c:\Users\Endre\Desktop\Automatica si Calculatoare\Proiectarea Sistemelor Numerice (PSN)\Gabos Endre Workspace\Gabos_Endre\Proiect_B8_Parcare\src\Semnal_Prim.bde
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

entity Semnal_Prim is
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
       A_Prim : out std_logic;
       B_Prim : out std_logic;
       C_Prim : out std_logic;
       D_Prim : out std_logic
  );
end Semnal_Prim;

architecture structural of Semnal_Prim is

---- Component declarations -----

component DFlipFlop
  port (
       D : in STD_LOGIC;
       S : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       Q : out STD_LOGIC
  );
end component;
component Poarta_XOR
  port (
       a : in STD_LOGIC;
       b : in STD_LOGIC;
       y : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal S_A : STD_LOGIC;
signal S_B : STD_LOGIC;
signal S_C : STD_LOGIC;
signal S_D : STD_LOGIC;

begin

----  Component instantiations  ----

FF_A : DFlipFlop
  port map(
       D => A1,
       Q => A_Prim,
       S => S_A,
       clk => clk,
       reset => reset
  );

FF_B : DFlipFlop
  port map(
       D => B1,
       Q => B_Prim,
       S => S_B,
       clk => clk,
       reset => reset
  );

FF_C : DFlipFlop
  port map(
       D => C1,
       Q => C_Prim,
       S => S_C,
       clk => clk,
       reset => reset
  );

FF_D : DFlipFlop
  port map(
       D => D1,
       Q => D_Prim,
       S => S_D,
       clk => clk,
       reset => reset
  );

XOR_A : Poarta_XOR
  port map(
       a => A2,
       b => A1,
       y => S_A
  );

XOR_B : Poarta_XOR
  port map(
       a => B2,
       b => B1,
       y => S_B
  );

XOR_C : Poarta_XOR
  port map(
       a => C2,
       b => C1,
       y => S_C
  );

XOR_D : Poarta_XOR
  port map(
       a => D2,
       b => D1,
       y => S_D
  );


end structural;
