library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library IEEE_PROPOSED;
use IEEE_PROPOSED.float_pkg.all;
use work.complex_record.all;

entity fft_butterly_testbench is
--  Port ( );
end fft_butterly_testbench;

architecture Behavioral of fft_butterly_testbench is

component fft_butterfly is
  Port ( 
    A : in complex;           
    B : in complex;   
    W : in complex;        
    clk : std_logic;           
    A_comp : out complex;           
    B_comp : out complex
  );
end component fft_butterfly;


COMPONENT clk_gen_sim_0
  PORT (
    axi_clk_in_0 : IN STD_LOGIC;
    axi_rst_in_0_n : IN STD_LOGIC;
    axi_clk_0 : OUT STD_LOGIC;
    axi_rst_0_n : OUT STD_LOGIC
  );
END COMPONENT;


signal At, Bt, Wt, B_compt, A_compt : complex;
signal clk_out, rst_out : std_logic;

begin

clk_gen: clk_gen_sim_0 port map(axi_clk_in_0=> '1', axi_rst_in_0_n=> '0', axi_clk_0=> clk_out, axi_rst_0_n=> rst_out);
fft: fft_butterfly port map(A=>At, B=>Bt, W=>Wt, clk => clk_out, A_comp=>A_compt, B_comp=>B_compt);

At.r <= std_logic_vector(to_float(1.5, 8, 23));
At.i <= std_logic_vector(to_float(0.5, 8, 23));

Bt.r <= std_logic_vector(to_float(2, 8, 23));
Bt.i <= std_logic_vector(to_float(-3, 8, 23));

Wt.r <= std_logic_vector(to_float(0.5, 8, 23));
Wt.i <= std_logic_vector(to_float(0.5, 8, 23));

end Behavioral;
