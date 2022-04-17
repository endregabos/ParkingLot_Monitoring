library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--acesta este algoritmul pentru detectarea senzorilor care se aprind primii;
--pe intrari avem cei 8 senzori de la intrarile si iesirile din parcare (A si C pentru intrari; B si D pentru iesiri);
--ca si iesiri avem 4 semnale "A_Prim", "C_Prim", "B_Prim", "D_Prim" care devin 1 logic in cazul in care A1, C1, B1 si 
--respectiv D1 au fost primii senzori aprinsi din parcare, iar 0 in caz contrar; 

entity Semnal_Prim is
	port(A1, A2, C1, C2, B1, B2, D1, D2, reset, clk: in STD_LOGIC;
	A_Prim,C_Prim,B_Prim,D_Prim: out std_logic);
end Semnal_Prim;

architecture structural of Semnal_Prim is 
component Poarta_XOR is
	port(a,b: in STD_LOGIC;
	y: out STD_LOGIC);
end component;

component DFlipFlop is 
   port(
      Q : out STD_LOGIC;    
      clk : in STD_LOGIC;  
   	  reset: in STD_LOGIC;  
      D : in STD_LOGIC;
	  S : in STD_LOGIC
   );
end component;

signal S_A, S_B, S_C, S_D: STD_LOGIC;
--aceste semnale sunt iesirile de la portile XOR si reprezinta intrarile S din bistabilele D;

begin
	XOR_D: Poarta_XOR port map(D2,D1,S_D);
	XOR_B: Poarta_XOR port map(B2,B1,S_B);
	XOR_C: Poarta_XOR port map(C2,C1,S_C);
	XOR_A: Poarta_XOR port map(A2,A1,S_A);
	FF_D: DFlipFlop port map(D_Prim,clk,reset,D1,S_D); --daca primul senzor aprins a fost D1, D_Prim ia valoarea 1, in caz contrar ia valoarea 0;
	FF_B: DFlipFlop port map(B_Prim,clk,reset,B1,S_B); --daca primul senzor aprins a fost B1, B_Prim ia valoarea 1, in caz contrar ia valoarea 0;
	FF_C: DFlipFlop port map(C_Prim,clk,reset,C1,S_C); --daca primul senzor aprins a fost C1, C_Prim ia valoarea 1, in caz contrar ia valoarea 0;
	FF_A: DFlipFlop port map(A_Prim,clk,reset,A1,S_A); --daca primul senzor aprins a fost A1, A_Prim ia valoarea 1, in caz contrar ia valoarea 0;
end architecture; 