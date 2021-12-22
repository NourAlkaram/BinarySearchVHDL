----------------------------------------------------------------------------------
-- Engineers: Mhd Nour Alkaram & Saeed Batheesh
-- 
-- Create Date:    00:29:18 12/22/2021 
-- Module Name:    algorithm - Behavioral 
-- Project Name: 	 Binary Search Algorithm

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity algorithm is
    Port ( clk : in  STD_LOGIC;
			  found : out STD_LOGIC;
           mout : out  STD_LOGIC_VECTOR (5 downto 0);
           midd : out  STD_LOGIC_VECTOR (5 downto 0);
			  element : in STD_LOGIC_VECTOR (15 downto 0));
end algorithm;

architecture Behavioral of algorithm is

type arr is array ( 0 to 31 ) of std_logic_vector (15 downto 0);
signal ar : arr :=(0 => x"0000", 1 => x"0002", 2 => x"0004",
						 3 => x"0006", 4 => x"0008", 5 => x"000a",
						 6 => x"000c", 7 => x"000e", 8 => x"0010",
						 9 => x"0012", 10 => x"0014", 11 => x"0016",
						 12 => x"0018", 13 => x"001a", 14 => x"001c",
						 15 => x"001e", 16 => x"0020", 17 => x"0022",
						 18 => x"0024", 19 => x"0026", 20 => x"0028",
						 21 => x"002a", 22 => x"002c", 23 => x"002e",
						 24 => x"0030", 25 => x"0032", 26 => x"0034",
						 27 => x"0036", 28 => x"0038", 29 => x"003a",
						 30 => x"003c", 31 => x"003e");

signal l : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal r : STD_LOGIC_VECTOR (5 downto 0) := "011111";
signal mid : STD_LOGIC_VECTOR (5 downto 0):= "001111";
signal F : STD_LOGIC := '0';

begin

process(clk)
	begin
		if(falling_edge(clk)) then
			mid <= conv_std_logic_vector(conv_integer(l+r) / 2 , 6);
		
			if (l > r) then
				F <= '0';
				
			elsif (conv_integer(ar(conv_integer(mid))) = conv_integer(element)) then 
				mout <= mid;
				F <= '1';
				
			elsif (conv_integer(ar(conv_integer(mid))) > conv_integer(element)) then
				r <= mid - 1;
				
			elsif (conv_integer(ar(conv_integer(mid))) < conv_integer(element)) then
				l <= mid + 1;
				
			end if;
			
		end if;
	end process;
	
midd <= mid;
found <= F;

end Behavioral;