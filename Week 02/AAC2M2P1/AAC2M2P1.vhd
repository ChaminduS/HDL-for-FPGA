LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity AAC2M2P1 is port (                 	
   CP: 	in std_logic; 	-- clock
   SR:  in std_logic;  -- Active low, synchronous reset
   P:    in std_logic_vector(3 downto 0);  -- Parallel input
   PE:   in std_logic;  -- Parallel Enable (Load)
   CEP: in std_logic;  -- Count enable parallel input
   CET:  in std_logic; -- Count enable trickle input
   Q:   out std_logic_vector(3 downto 0);            			
    TC:  out std_logic  -- Terminal Count
);            		
end AAC2M2P1;

architecture behavioral of AAC2M2P1 is
    signal q : std_logic_vector(3 downto 0);
    begin 
    process (CP)
    variable cond : std_logic_vector(3 downto 0);
    begin
        cond := SR & PE & CET & CEP;
        if (rising_edge(CP)) then
            case cond is
                when "0001"|"0010"|"0011"|"0100"|"0101"|"0110"|"0111" => q <= "0000";
                when