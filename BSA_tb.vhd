--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:09:30 12/22/2021
-- Design Name:   
-- Module Name:   C:/Users/Montazer/Xilinx/BinarySearch/BSA_tb.vhd
-- Project Name:  BinarySearch
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: algorithm
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY BSA_tb IS
END BSA_tb;
 
ARCHITECTURE behavior OF BSA_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT algorithm
    PORT(
         clk : IN  std_logic;
         found : OUT  std_logic;
         mout : OUT  std_logic_vector(5 downto 0);
         midd : OUT  std_logic_vector(5 downto 0);
         element : IN  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal element : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal found : std_logic;
   signal mout : std_logic_vector(5 downto 0);
   signal midd : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: algorithm PORT MAP (
          clk => clk,
          found => found,
          mout => mout,
          midd => midd,
          element => element
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		
		element <= x"001c";
		
      wait for clk_period*10;

      wait;
   end process;

END;
