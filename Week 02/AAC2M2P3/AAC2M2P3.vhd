library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;

architecture FSM_Arch of FSM is
   signal CurrentState, NextState : std_logic_vector(1 downto 0); 
   signal StateOut : std_logic; 

   begin
      comb_proc : process (CurrentState,NextState,In1)
      begin 
         case(CurrentState) is
            when "00" =>
               if    (In1='0') then NextState <= "00"; StateOut<='0';
               elsif (In1='1') then NextState <= "01"; StateOut<='0';
               else                 NextState <= "00"; StateOut<='0'; end if;
            when "01" =>
               if    (In1='0') then NextState <= "11"; StateOut<='1';
               elsif (In1='1') then NextState <= "01"; StateOut<='0';
               else                 NextState <= "00"; StateOut<='0'; end if;
            when "11" =>
               if    (In1='0') then NextState <= "11"; StateOut<='1';
               elsif (In1='1') then NextState <= "00"; StateOut<='0';
               else                 NextState <= "00"; StateOut<='0'; end if;

            when others =>          NextState <= "00"; StateOut<='0';
         end case; 
      end process comb_proc;

      clk_proc : process(CLK,RST)
      begin 
         if (RST='1') then CurrentState <= "00";
         elsif (rising_edge(CLK)) then CurrentState <= NextState; Out1 <= StateOut;
         end if;
      end process clk_proc;

   end architecture FSM_Arch; 