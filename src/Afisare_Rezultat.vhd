library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--aici afisam numarul de locuri libere din parcare cu ajutorul unui afisor de tip 7 SEGMENTE;
--totodata tratam cele doua cazuri de eroare ale numaratorului:
	--atunci cand parcarea este goala si o masina doreste sa iasa;
	--atunci cand parcarea este plina si o masina doreste sa intre;
--daca apare o eroare de acest tip, pe iesirea ERR_COUNTER vom avea 1 logic;

entity Afisare_Rezultat is
	port(REZ_0, REZ_1, REZ_2, REZ_3: in STD_LOGIC;
	NR_UP, NR_DOWN: in STD_LOGIC;
	ERR_COUNTER: out STD_LOGIC;
	Iesire: out STD_LOGIC_VECTOR(6 downto 0));
end Afisare_Rezultat;

architecture structural of Afisare_Rezultat is
component SI_5 is
	port(a,b,c,d,e: in STD_LOGIC;
	y: out STD_LOGIC);
end component;

component SAU is
	port(a,b: in STD_LOGIC;
	y: out STD_LOGIC);
end component;

component NU is
	port(a: in STD_LOGIC;
	b: out STD_LOGIC);
end component;

component BCD_7SEGMENTE is
	port(D, C, B, A: in STD_LOGIC; --D este cel mai semnificativ bit, A este cel mai putin semnificativ bit;
	Iesire: out STD_LOGIC_VECTOR(6 downto 0)); --iesirile sunt active pe 0 logic;
end component;

signal FULL, EMPTY, Not_REZ_3, Not_REZ_2, Not_REZ_1, Not_REZ_0: std_logic;
--semnalul FULL reprezinta prima eroare a numaratorului;
--semnalul EMPTY reprezinta cea de-a doua eroare a numaratorului;

begin
	AND5_1: SI_5 port map(NR_UP, REZ_3, REZ_2, REZ_1, Not_REZ_0, FULL); --al doilea caz de eroare al numaratorului;
	NOT_18: NU port map(REZ_3, Not_REZ_3);
	NOT_19: NU port map(REZ_2, Not_REZ_2);
	NOT_20: NU port map(REZ_1, Not_REZ_1);
	NOT_21: NU port map(REZ_0, Not_REZ_0);
	NOT_23: NU port map(REZ_0, Not_REZ_0);
	AND5_2: SI_5 port map(Not_REZ_3, Not_REZ_2, Not_REZ_1, Not_REZ_0, NR_DOWN, EMPTY); --primul caz de eroare al numaratorului;
	OR_E: SAU port map(FULL, EMPTY, ERR_COUNTER); --ERR_COUNTER devine 1 in cazul in care avem prima eroare sau a doua eroare; 
	BCD_7SEGM_DECODER: BCD_7SEGMENTE port map(REZ_3, REZ_2, REZ_1, REZ_0, Iesire);
end architecture;
