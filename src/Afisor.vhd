library IEEE;
use IEEE.STD_LOGIC_1164.all;

--se afiseaza locurile libere din parcare;
--iesirile sunt active pe 0 logic;
entity BCD_7SEGMENTE is
	port(D, C, B, A: in STD_LOGIC;
	Iesire: out STD_LOGIC_VECTOR(6 downto 0));
end BCD_7SEGMENTE;

architecture comportamentala of BCD_7SEGMENTE is
signal temp: std_logic_vector(3 downto 0); 
begin
	temp(3)<=D;
	temp(2)<=C;
	temp(1)<=B;
	temp(0)<=A;
	process(temp)
	begin
		case temp is
			when "0000" => 
			Iesire <= "0000001"; --0
			when "0001"	=>
			Iesire <= "1001111"; --1
			when "0010" => 
			Iesire <= "0010010"; --2
			when "0011" => 
			Iesire <= "0000110"; --3
			when "0100" => 
			Iesire <= "1001100"; --4
			when "0101" => 
			Iesire <= "0100100"; --5
			when "0110" => 
			Iesire <= "0100000"; --6
			when "0111" => 
			Iesire <= "0001111"; --7
			when "1000" => 
			Iesire <= "0000000"; --8
			when "1001" => 
			Iesire <= "0000100"; --9
			when "1010" => 
			Iesire <= "0001000"; --10 - A
			when "1011" => 
			Iesire <= "1100000"; --11 - b
			when "1100" => 
			Iesire <= "0110001"; --12 - C
			when "1101" => 
			Iesire <= "1000010"; --13 -	d
			when "1110" => 
			Iesire <= "0110000"; --14 - E
			when others =>
			Iesire <= "1111111"; --null
		end case;
	end process;
end architecture;