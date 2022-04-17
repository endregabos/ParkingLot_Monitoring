library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--aici numaram cate masini intra sau ies din parcare, iar rezultatele numaratorului le salvam in registrul de memorie, 
--iar cand registrul este activ, rezultatul se trimite pe iesirile registrului;
entity Numarare_Masini is
	port(NR_UP, NR_DOWN, NOT_ERR_COUNTER, reset, clk: in std_logic; --NOT_ERR_COUNTER reprezinta intrarea de enable a numaratorului;
	Intrare: inout std_logic_vector(3 downto 0); --reprezinta numarul maxim de locuri din parcare cu care este initializat numaratorul;
	Q0, Q1, Q2, Q3: out std_logic);
end Numarare_Masini;

architecture structurala of Numarare_Masini is
component SAU is
	port(a,b: in STD_LOGIC;
	y: out STD_LOGIC);
end component;

component NU is
	port(a: in STD_LOGIC;
	b: out STD_LOGIC);
end component;

--cu ajutorul demultiplexorului vedem spre care dintre iesirile Y0 sau Y1 trebuie sa trimitem valoarea de pe intrarea SEMN:
	--daca se trimite spre iesirea Y0: valoarea din numarator creste;
	--daca se trimite spre iesirea Y1: valoarea din numarator scade;
component DEMUX_1_2 is
	port(a,sel: in STD_LOGIC;
	x0,x1: out STD_LOGIC);
end component;

component NUMARATOR_REVERSIBIL is 
	port(enable, reset, c_up, c_down, clk: in std_logic;
	Intrare: inout std_logic_vector(3 downto 0);
	Q0, Q1, Q2, Q3: out std_logic);
end component;

component Registru_Memorie is
	port(X0, X1, X2, X3: in STD_LOGIC;
	clk, reset, E: in STD_LOGIC;
	Q0, Q1, Q2, Q3: out STD_LOGIC);
end component;

signal SEMN, Y0, Y1, Not_SEMN, NR_0, NR_1, NR_2, NR_3: std_logic;
--cu ajutorul semnalelor NR_3, NR_2, NR_1, NR_0 trimitem valoarea din numarator spre registru (NR_3 reprezentand bit-ul cel mai semnificativ, iar NR_0 bit-ul cel mai putin semnificativ);  
--semnalul Not-SEMN reprezinta intrarea de Enable a registrului: cand acesta este 1, valoarea de pe intrare se trimite spre iesire, iar cand acesta este 0 valoarea de pe intrare se memoreaza in registru;
begin
	OR_C: SAU port map(NR_UP, NR_DOWN, SEMN);
	DMUX1_2: DEMUX_1_2 port map(SEMN, NR_DOWN, Y0, Y1); --iesirile sunt cele doua moduri pentru numarator;
	NOT_17: NU port map(SEMN, Not_SEMN); --iesirea este enable-ul registrului;
	NUMARATOR: NUMARATOR_REVERSIBIL port map(NOT_ERR_COUNTER, reset, Y0, Y1, clk, Intrare, NR_0, NR_1, NR_2, NR_3);
	MEM_REGISTER: Registru_Memorie port map(NR_0, NR_1, NR_2, NR_3, clk, reset, Not_SEMN, Q0, Q1, Q2, Q3);
end architecture;
