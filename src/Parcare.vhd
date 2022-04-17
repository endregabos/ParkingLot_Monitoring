library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--aici avem reprezentarea intregii parcari prin arhitectura structurala;
--pe intrari avem cei 8 senzori de la intari si iesiri, si numarul maxim de locuri libere din parcare (14);
--pe iesire se afiseaza numarul de locuri libere din parcare, dar si semnalul ERROR in caz case intampinam o eroare;

entity Parcare_Masini is
	port(A1, A2, C1, C2, B1, B2, D1, D2, reset, clk: in STD_LOGIC;
	Intrare: inout STD_LOGIC_VECTOR(3 downto 0);
	Iesire: out STD_LOGIC_VECTOR(6 downto 0);
	ERROR: out STD_LOGIC);
end	Parcare_Masini;

architecture structural of Parcare_Masini is 
--Part 1;
component Semnal_Prim is
	port(A1, A2, C1, C2, B1, B2, D1, D2, reset, clk: in std_logic;
	A_Prim,C_Prim,B_Prim,D_Prim: out std_logic);
end component;
--Part 2;
component Is_Car_and_Errors is
	port(A_CAR, C_CAR, B_CAR, D_CAR, A_Prim, C_Prim, B_Prim, D_Prim, ERR_COUNTER: in std_logic;
	IN_A,IN_C,OUT_B,OUT_D,ERROR: out std_logic);
end component;
--Part 3;
component Cazuri_Numarator is
	port(IN_A, IN_C, OUT_B, OUT_D: in std_logic;
	NR_UP, NR_DOWN: out std_logic);
end component;
--Part 4;
component Numarare_Masini is
	port(NR_UP, NR_DOWN, NOT_ERR_COUNTER, reset, clk: in std_logic;
	Intrare: inout std_logic_vector(3 downto 0);
	Q0, Q1, Q2, Q3: out std_logic);
end component;
--Part 5;
component Afisare_Rezultat is
	port(REZ_0, REZ_1, REZ_2, REZ_3: in STD_LOGIC;
	NR_UP, NR_DOWN: in STD_LOGIC;
	ERR_COUNTER: out STD_LOGIC;
	Iesire: out STD_LOGIC_VECTOR(6 downto 0));
end component;

component SI_2 is
	port(a,b: in STD_LOGIC;
	y: out STD_LOGIC);
end component;

component NU is
	port(a: in STD_LOGIC;
	b: out STD_LOGIC);
end component;

signal A_Prim,C_Prim,B_Prim,D_Prim, A_CAR, C_CAR, B_CAR, D_CAR, ERR_COUNTER, IN_A, IN_C, OUT_B, OUT_D, NR_UP, NR_DOWN, NOT_ERR_COUNTER, REZ_0, REZ_1, REZ_2, REZ_3: std_logic; 

begin
	--aici legam toate cele 5 parti (Semnal_Prim, Is_Car_and_Errors, Cazuri_Numarator, Numarare_Masini si Afisare_Rezultat) in mod structural;
	Part1: Semnal_Prim port map(A1, A2, C1, C2, B1, B2, D1, D2, reset, clk, A_Prim,C_Prim,B_Prim,D_Prim);
	AND_A: SI_2 port map(A1, A2, A_CAR); --detecteaza masina pe intrarea A;
	AND_C: SI_2 port map(C1, C2, C_CAR); --detecteaza masina pe intrarea C;
	AND_B: SI_2 port map(B1, B2, B_CAR); --detecteaza masina pe iesirea B;
	AND_D: SI_2 port map(D1, D2, D_CAR); --detecteaza masina pe iesirea D;
	Part2: Is_Car_and_Errors port map(A_CAR, C_CAR, B_CAR, D_CAR, A_Prim, C_Prim, B_Prim, D_Prim, ERR_COUNTER, IN_A, IN_C, OUT_B, OUT_D, ERROR);
	Part3: Cazuri_Numarator port map(IN_A, IN_C, OUT_B, OUT_D, NR_UP, NR_DOWN);
	NOT_22: NU port map(ERR_COUNTER, NOT_ERR_COUNTER);
	Part4: Numarare_Masini port map(NR_UP, NR_DOWN, NOT_ERR_COUNTER, reset, clk, Intrare, REZ_0, REZ_1, REZ_2, REZ_3);
	Part5: Afisare_Rezultat port map(REZ_0, REZ_1, REZ_2, REZ_3, NR_UP, NR_DOWN, ERR_COUNTER, Iesire);
end architecture;

