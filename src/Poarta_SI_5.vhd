library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 

entity SI_5 is
	port(a,b,c,d,e: in STD_LOGIC;
	y: out STD_LOGIC);
end SI_5;
   
architecture flux of SI_5 is
begin
	y <= a and b and c and d and e;
end architecture;