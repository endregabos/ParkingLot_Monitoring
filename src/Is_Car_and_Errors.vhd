library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--aici avem cazurile in care o masina intra sau iese in mod corect in/din paracre, respectiv cazurile de eroare
--in momentul in care masina doreste sa intre primtr-o iesire sau doreste sa iasa printr-o intrare, sau ERR_COUNTER este 1;
--ERR_COUNTER devine 1 in momentul in care parcarea este goala si o masina doreste sa iasa din parcare, sau in momentul in care parcarea este plina si o masina doreste sa intre in parcare;

entity Is_Car_and_Errors is
	port(A_CAR, C_CAR, B_CAR, D_CAR, A_Prim, C_Prim, B_Prim, D_Prim, ERR_COUNTER: in std_logic;
	IN_A,IN_C,OUT_B,OUT_D,ERROR: out std_logic);
end Is_Car_and_Errors;
--iesirile "IN_A" si "IN_C" devin 1 logic in momentul in care masina intra in mod corect in parcare (printr-o intrare);
--iesirile "OUT_B" si "OUT_D" devin 1 logic in momentul in care masina iese in mod corect din parcare (printr-o iesire);
--iesirea "ERROR" devine 1 logic in momentul in care apare o eroare de tipul mentionat mai sus;

architecture structural of Is_Car_and_Errors is
component SI_2 is
	port(a,b: in STD_LOGIC;
	y: out STD_LOGIC);
end component;

component NU is
	port(a: in STD_LOGIC;
	b: out STD_LOGIC);
end component;

component SAU_5 is 
	port(a,b,c,d,e: in STD_LOGIC;
	y: out STD_LOGIC);
end component;
signal Not_A_Prim, Not_C_Prim, Not_B_Prim, Not_D_Prim, ERROR_A, ERROR_C, ERROR_B, ERROR_D: std_logic;
--semnalele ERROR_A, ERROR_C, ERROR_B, ERROR_D ne arata daca exista o eroare la senzorii A, C, B sau D;
begin
	NOT_1: NU port map(D_Prim,Not_D_Prim);
	NOT_2: NU port map(B_Prim,Not_B_Prim);
	NOT_3: NU port map(C_Prim,Not_C_Prim);
	NOT_4: NU port map(A_Prim,Not_A_Prim);
	A: SI_2 port map(A_CAR,A_Prim,IN_A); --daca primul senzor aprins a fost A1 si senzorii detecteaza o masina, inseamna ca masina intra in mod corespunzator in parcare;
	C: SI_2 port map(C_CAR,C_Prim,IN_C); --daca primul senzor aprins a fost C1 si senzorii detecteaza o masina, inseamna ca masina intra in mod corespunzator in parcare;
	B: SI_2 port map(B_CAR,B_Prim,OUT_B); --daca primul senzor aprins a fost B1 si senzorii detecteaza o masina, inseamna ca masina iese in mod corespunzator din parcare;
	D: SI_2 port map(D_CAR,D_Prim,OUT_D); --daca primul senzor aprins a fost D1 si senzorii detecteaza o masina, inseamna ca masina iese in mod corespunzator din parcare;
	ERR_D: SI_2 port map(Not_D_Prim,D_CAR,ERROR_D); --daca primul senzor aprins a fost D2 si senzorii detecteaza o masina, apare o eroare la senzorul D (masina intra printr-o iesire);
	ERR_B: SI_2 port map(Not_B_Prim,B_CAR,ERROR_B);	--daca primul senzor aprins a fost B2 si senzorii detecteaza o masina, apare o eroare la senzorul B (masina intra printr-o iesire);
	ERR_C: SI_2 port map(Not_C_Prim,C_CAR,ERROR_C);	--daca primul senzor aprins a fost C2 si senzorii detecteaza o masina, apare o eroare la senzorul C (masina iese printr-o intrare);
	ERR_A: SI_2 port map(Not_A_Prim,A_CAR,ERROR_A);	--daca primul senzor aprins a fost A2 si senzorii detecteaza o masina, apare o eroare la senzorul A (masina iese printr-o intrare);
	SAU_ERR: SAU_5 port map(ERR_COUNTER,ERROR_D,ERROR_B,ERROR_C,ERROR_A,ERROR); --daca exista vre-o eroare de tipul mentionat mai sus, iesirea ERROR devine 1 
end architecture;