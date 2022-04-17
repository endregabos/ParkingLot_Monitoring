library IEEE;
use IEEE.STD_LOGIC_1164.all;

--daca pe intrarea "reset" avem 1 logic, atunci iesirea va deveni 0 logic;
--cat timp intrarea "S" este activa (pe 1 logic), atunci pe iesirea "Q" vom avea valoarea de pe intrarea "D";
--in caz contrar, bistabilul va retine valoarea de pe intrarea "Q";

entity DFlipFlop is 
   port(
      Q : out STD_LOGIC;    
      clk : in STD_LOGIC;  
   	  reset: in STD_LOGIC;  
      D : in STD_LOGIC;
	  S : in STD_LOGIC
   );
end DFlipFlop;

architecture comportamentala of DFlipFlop is  
begin  
 process(clk)
 begin 
	if(reset='1') then 
    	Q <= '0';
    elsif(rising_edge(clk)) then	
		if(S='1') then 
    		Q <= D; 
   		end if;
   		end if; 
 end process;  
end comportamentala; 