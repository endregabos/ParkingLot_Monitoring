library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--daca pe intrarea "reset" avem 1 logic, atunci pe iesirile "Q3" "Q2" "Q1" "Q0" vom avea 1 1 1 0 (numarul maxim de locuri libere din parcare - 14)
--cat timp intrarea "E" este activa pe 1 logic, pe iesiri vom avea valorile de pe intrarile "X3" "X2" "X1" "X0"
--daca intrarea "E" este 0 (inactiva), atunci registrul memoreaza valorile de pe intrari

entity Registru_Memorie is
	port(X0, X1, X2, X3: in STD_LOGIC;
	clk, reset, E: in STD_LOGIC;
	Q0, Q1, Q2, Q3: out STD_LOGIC);
end Registru_Memorie;

architecture arhitectura of Registru_Memorie is	
begin
	process(clk)
	begin
		if rising_edge (clk) then
			if reset ='1' then
				Q0<='0';
				Q1<='1';
				Q2<='1';
				Q3<='1';
			elsif E='1' then
				Q0<=X0;
				Q1<=X1;
				Q2<=X2;
				Q3<=X3;
			elsif E='0' then
			end if;
		end if;
	end process;
end arhitectura;  