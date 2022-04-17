library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SI_3 is
	port(a,b,c: in STD_LOGIC;
	y: out STD_LOGIC);
end SI_3;

architecture flux of SI_3 is
begin
	y<=a and b and c;
end architecture;
