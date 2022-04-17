library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--aici avem un numarator binar reversibil;
--atunci cand pe intrarea "reset" avem 1 logic, pe iesirile "Q3" "Q2" "Q1" "Q0" vom avea 1 1 1 0 (numarul maxim de locuri libere din parcare);
--atunci cand intrarea "enable" este activa pe 1 logic, numaratorul este activ;
--avem doua moduri de numarare:
	--atunci cand intrarea "c_up" este 1 si "c_down" este 0, numaratorul numara in ordine crescatoare;
	--atunci cand intrarea "c_up" este 0 si "c_down" este 1, numaratorul numara in ordine descrescatoare;
entity NUMARATOR_REVERSIBIL is 
	port(enable, reset, c_up, c_down, clk: in std_logic;
	Intrare: inout std_logic_vector(3 downto 0);
	Q0, Q1, Q2, Q3: out std_logic);
end NUMARATOR_REVERSIBIL;

architecture Arhitectura of NUMARATOR_REVERSIBIL is
signal temp: std_logic_vector(3 downto 0);
--semnalul "temp" este un semnal auxiliar, 
--iar in interiorul numaratorului acesta este semnalul care se modifica si este transmis catre 
--iesirile "Q3" "Q2" "Q1" "Q0";
begin
	process(clk)	
	begin
		if reset = '1' then	--atunci cand intrarea reset este activa, numaratorul este initializat cu numarul maxim de locuri libere din parcare;
			Intrare <= "1110";
			temp <= Intrare;
		end if;
		if enable = '1' then
			if clk'event and clk='1' and c_up = '1' and c_down = '0' then --daca intrarea c_up este activa si avem un impuls de tact, numaratorul numara in ordine crescatoare; 
				temp <= temp + 1;
				elsif clk'event and clk='1' and c_up = '0' and c_down = '1' then --daca intrarea c_down este activa si avem un impuls de tact, numaratorul numara in ordine descrescatoare;
					temp <= temp - 1;
			end if;
		end if;
	end process;
	--se transmite numarul catre iesiri;
	Q0 <= temp(0);
	Q1 <= temp(1);
	Q2 <= temp(2);
	Q3 <= temp(3);
end Arhitectura;