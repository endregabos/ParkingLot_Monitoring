library IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity SAU_5 is
	port(a,b,c,d,e: in STD_LOGIC;
	y: out STD_LOGIC);
end SAU_5;
   
architecture flux of SAU_5 is
begin
	y <= a or b or c or d or e;
end architecture;