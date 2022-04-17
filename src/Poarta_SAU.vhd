library IEEE;
use IEEE.STD_LOGIC_1164.all;	
   
entity SAU is
	port(a,b: in STD_LOGIC;
	y: out STD_LOGIC);
end SAU;
   
architecture Flux of SAU is
begin
	y <= a or b;
end architecture;