library IEEE;
use IEEE.STD_LOGIC_1164.all;	
   
entity SI_2 is
	port(a,b: in STD_LOGIC;
	y: out STD_LOGIC);
end SI_2;
   
architecture Flux of SI_2 is
begin
	y <= a and b;
end architecture;