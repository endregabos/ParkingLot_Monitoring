library IEEE;
use IEEE.STD_LOGIC_1164.all;	
   
entity SAU_4 is
	port(a,b,c,d: in STD_LOGIC;
	y: out STD_LOGIC);
end SAU_4;
   
architecture Flux of SAU_4 is
begin
	y <= a or b or c or d;
end architecture;