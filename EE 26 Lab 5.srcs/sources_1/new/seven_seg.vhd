library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--library IEEE_PROPOSED;
--use IEEE_PROPOSED.float_pkg.all;

--use work.complex_record.all;

entity seven_seg is
	port (
		 input : in std_logic_vector (31 downto 0);
         clk : in std_logic;
         
         digit : out std_logic_vector(6 downto 0);
         pos : out std_logic_vector(7 downto 0)
	);
end seven_seg;

architecture data_flow of seven_seg is

component decoder
	port (
		encode : in std_logic_vector(3 downto 0);
		seg : out std_logic_vector(6 downto 0)
	);
end component;

signal d1, d2, d3, d4, d5, d6, d7, d8: std_logic_vector(6 downto 0);

begin

dig1: decoder port map(encode => input(3 downto 0), seg => d1);
dig2: decoder port map(encode => input(7 downto 4), seg => d2);
dig3: decoder port map(encode => input(11 downto 8), seg => d3);
dig4: decoder port map(encode => input(15 downto 12), seg => d4);
dig5: decoder port map(encode => input(19 downto 16), seg => d5);
dig6: decoder port map(encode => input(23 downto 20), seg => d6);
dig7: decoder port map(encode => input(27 downto 24), seg => d7);
dig8: decoder port map(encode => input(31 downto 28), seg => d8);

process (clk) 

variable count : integer := 0;
variable slow_clk : unsigned(2 downto 0) := "111";

begin

if (clk'event and clk = '1') then
    count := count + 1;
    
    if (count = 100000) then
        slow_clk := slow_clk + "001";
        count := 0;
        
        if (slow_clk = "000") then
            digit <= d1;
            pos <= "11111110";
        end if;
            
        if (slow_clk = "001") then
            digit <= d2;
            pos <= "11111101";  
        end if;
        
        if (slow_clk = "010") then
            digit <= d3;
            pos <= "11111011";
        end if;

        if (slow_clk = "011") then
            digit <= d4;
            pos <= "11110111";
        end if;
            
        if (slow_clk = "100") then
            digit <= d5;
            pos <= "11101111";
        end if;
            
        if (slow_clk = "101") then
            digit <= d6;
            pos <= "11011111";
        end if;
            
        if (slow_clk = "110") then
            digit <= d7;
            pos <= "10111111";
        end if;
                        
        if (slow_clk = "111") then
            digit <= d8;
            pos <= "01111111";
        end if;
    end if;
end if;

end process;


end data_flow;
