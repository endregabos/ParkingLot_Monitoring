library IEEE;
use IEEE.STD_LOGIC_1164.all;	

--se trimite semnalul "a" de pe intrare pe una dintre iesirile "x0" sau "x1", in functie de selectia "sel";
entity DEMUX_1_2 is
	port(a,sel: in STD_LOGIC;
	x0,x1: out STD_LOGIC);
end DEMUX_1_2;
   
architecture Flux of DEMUX_1_2 is
begin
	x0 <= a and (not sel);
	x1 <= a and sel;
end architecture;