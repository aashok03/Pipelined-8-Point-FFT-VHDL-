library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library IEEE_Proposed;
use IEEE_Proposed.float_pkg.all;
use work.complex_record.all;

entity eight_point_fft_pipeline_rom_display is
  Port ( 
        index: in std_logic_vector(2 downto 0);
        i_r: in std_logic;
        address: in std_logic_vector(2 downto 0);
        clock: in std_logic;
        dig : out std_logic_vector(6 downto 0);
        position: out std_logic_vector(7 downto 0)
  );
end eight_point_fft_pipeline_rom_display;

architecture Behavioral of eight_point_fft_pipeline_rom_display is

component ROM is  
    port ( 
        address : in std_logic_vector(2 downto 0); 
        data : out mem
        );
end component ROM;

component eight_point_fft_pipeline is
  Port (  
      input : in mem;
      clk : in std_logic;
      output: out mem   
  );
end component eight_point_fft_pipeline;


component seven_seg is
	port (
		 input : in std_logic_vector (31 downto 0);
         clk : in std_logic;         
         digit : out std_logic_vector(6 downto 0);
         pos : out std_logic_vector(7 downto 0)
	);
end component seven_seg;

signal input, output: mem;
signal inp: std_logic_vector(31 downto 0);


begin

rom1: ROM port map(address, input);
eight_point: eight_point_fft_pipeline port map (input, clock, output);
seven_seg1: seven_seg port map (inp, clock, dig, position);

process(index, i_r, inp, clock, address, input) begin

if(index = "000" and i_r = '0') then
    inp <= output(0).r;
elsif(index = "000" and i_r = '1') then
    inp <= output(0).i;
    
elsif(index = "001" and i_r = '0') then
    inp <= output(1).r;
elsif(index = "001" and i_r = '1') then
    inp <= output(1).i;
    
elsif(index = "010" and i_r = '0') then
    inp <= output(2).r;
elsif(index = "010" and i_r = '1') then
    inp <= output(2).i;
    
elsif(index = "011" and i_r = '0') then
    inp <= output(3).r;
elsif(index = "011" and i_r = '1') then
    inp <= output(3).i;

elsif(index = "100" and i_r = '0') then
    inp <= output(4).r;
elsif(index = "100" and i_r = '1') then
    inp <= output(4).i;
    
elsif(index = "101" and i_r = '0') then
    inp <= output(5).r;
elsif(index = "101" and i_r = '1') then
    inp <= output(5).i;
    
elsif(index = "110" and i_r = '0') then
    inp <= output(6).r;
elsif(index = "110" and i_r = '1') then
    inp <= output(6).i;
    
elsif(index = "111" and i_r = '0') then
    inp <= output(7).r;
elsif(index = "111" and i_r = '1') then
    inp <= output(7).i;    
    
else
    inp <= "11110000111100001111000011110000";
    
end if;
    
end process;


end Behavioral;
