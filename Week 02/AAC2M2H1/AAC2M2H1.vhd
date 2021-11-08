LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ALU IS
PORT( Op_code : IN STD_LOGIC_VECTOR( 2 DOWNTO 0 );
A, B : IN STD_LOGIC_VECTOR( 31 DOWNTO 0 );
Y : OUT STD_LOGIC_VECTOR( 31 DOWNTO 0 ) );
END ALU;

architecture ALU_Arch of ALU is
    signal ALU_out : std_logic_vector(31 downto 0);
    begin
        comb_proc : process (A, B, Op_code)
        begin
            case (Op_code) is
                when "000" =>
                    ALU_out <= A;
                when "001" =>
                    ALU_out <= A+B;
                when "010" =>
                    ALU_out <= A-B;
                when "011" =>
                    ALU_out <= A and B;
                when "100" =>
                    ALU_out <= A or B;
                when "101" =>
                    ALU_out <= A+1;
                when "110" =>
                    ALU_out <= A-1;
                when "111" =>
                    ALU_out <= B;
                when others =>
                    ALU_out <= x"00000000" ;
            end case;
        end process comb_proc;
        Y <= ALU_out;
    end architecture ALU_arch;

