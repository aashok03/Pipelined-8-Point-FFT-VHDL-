library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library IEEE_Proposed;
use IEEE_Proposed.float_pkg.all;
use work.complex_record.all;

entity D_Latch is
    Port ( 
        clk: in std_logic;
        D: in complex;
        Q: out complex
    );
end D_Latch;

architecture Behavioral of D_Latch is

begin

process(clk) begin 
    if(rising_edge(clk)) then 
        Q <= D; 
    end if;       
end process;


end Behavioral;
