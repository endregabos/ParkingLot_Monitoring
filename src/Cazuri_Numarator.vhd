library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--aici avem cazurile in care masinile intra sau ies din parcare 
--iesirea NR_UP devine 1 logic in cazul in care o masina iese din parcare;
--iesirea NR_DOWN devine 1 logic in cazul in care o masina intra in parcare;
entity Cazuri_Numarator is
	port(IN_A, IN_C, OUT_B, OUT_D: in std_logic;
	NR_UP, NR_DOWN: out std_logic);
end Cazuri_Numarator;

architecture structural of Cazuri_Numarator is
component SI_3 is
	port(a,b,c: in STD_LOGIC;
	y: out STD_LOGIC);
end component;

component NU is
	port(a: in STD_LOGIC;
	b: out STD_LOGIC);
end component; 

component SAU_4 is 
	port(a,b,c,d: in STD_LOGIC;
	y: out STD_LOGIC);
end component;

signal Not_IN_A, Not_IN_C, Not_OUT_B, Not_OUT_D, OUT_1, OUT_2, OUT_3, OUT_4, IN_1, IN_2, IN_3, IN_4: std_logic;
--semnalele OUT_1, OUT_2, OUT_3, OUT_4 reprezinta faptul ca o masina a parasit parcarea;
--semnalele IN_1, IN_2, IN_3, IN_4 reprezinta faptul case o masina a intrat in parcare;
begin
	NOT_5: NU port map(IN_C, Not_IN_C);
	NOT_6: NU port map(IN_A, Not_IN_A);
	AND3_1: SI_3 port map(OUT_B, Not_IN_C, Not_IN_A, OUT_1); --o masina se afla la iesirea B, iar intrarile A si C sunt libere;
	NOT_7: NU port map(IN_C, Not_IN_C);
	NOT_8: NU port map(IN_A, Not_IN_A);
	AND3_2: SI_3 port map(OUT_D, Not_IN_C, Not_IN_A, OUT_2); --o masina se afla la iesirea D, iar intrarile A si C sunt libere;
	NOT_9: NU port map(IN_A, Not_IN_A);
	AND3_3: SI_3 port map(OUT_D, OUT_B, Not_IN_A, OUT_3); --se afla cate o masina la iesirile B si D, intrarea A fiind libera;
	NOT_10: NU port map(IN_C, Not_IN_C);
	AND3_4: SI_3 port map(OUT_D, OUT_B, Not_IN_C, OUT_4); --se afla cate o masina la iesirile B si D, intrarea C fiind libera;
	C_UP: SAU_4 port map(OUT_1, OUT_2, OUT_3, OUT_4, NR_UP); --se elibereaza un loc in parcare;
	NOT_11: NU port map(OUT_D, Not_OUT_D);
	NOT_12: NU port map(OUT_B, Not_OUT_B);
	AND3_5: SI_3 port map(Not_OUT_D, Not_OUT_B, IN_C, IN_1); --o masina se afla la intrarea C, iar iesirile B si D sunt libere;
	NOT_13: NU port map(OUT_D, Not_OUT_D);
	NOT_14: NU port map(OUT_B, Not_OUT_B);
	AND3_6: SI_3 port map(Not_OUT_D, Not_OUT_B, IN_A, IN_2); --o masina se afla la intrarea A, iar iesirile B si D sunt libere;
	NOT_15: NU port map(OUT_D, Not_OUT_D);
	AND3_7: SI_3 port map(Not_OUT_D, IN_C, IN_A, IN_3); --se afla cate o masina la intrarile A si C, iesirea D fiind libera;
	NOT_16: NU port map(OUT_B, Not_OUT_B);
	AND3_8: SI_3 port map(IN_A, IN_C, Not_OUT_B, IN_4);	--se afla cate o masina la intrarile A si C, iesirea B fiind libera;
	C_DOWN: SAU_4 port map(IN_1, IN_2, IN_3, IN_4, NR_DOWN); --se ocupa un loc in parcare;
	
end architecture;

