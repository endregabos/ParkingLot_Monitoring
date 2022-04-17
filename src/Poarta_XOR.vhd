library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Poarta_XOR is
	port(a,b: in STD_LOGIC;
	y: out STD_LOGIC);
end Poarta_XOR;
   
architecture flux of Poarta_XOR is
begin
	y <= a xor b;
end architecture;