library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NU is
	port(a: in STD_LOGIC;
	b: out STD_LOGIC);
end NU;

architecture Flux of NU is
begin
	b <= not a;
end architecture;