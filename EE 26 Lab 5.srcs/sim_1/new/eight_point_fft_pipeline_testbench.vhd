library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library IEEE_Proposed;
use IEEE_Proposed.float_pkg.all;
use work.complex_record.all;

entity eight_point_fft_pipeline_testbench is
--  Port ( );
end eight_point_fft_pipeline_testbench;

architecture Behavioral of eight_point_fft_pipeline_testbench is

component eight_point_fft_pipeline is
  Port ( 
      input : in mem;
      clk : in std_logic;
      output: out mem
  );
end component eight_point_fft_pipeline;

COMPONENT clk_gen_sim_0
  PORT (
    axi_clk_in_0 : IN STD_LOGIC;
    axi_rst_in_0_n : IN STD_LOGIC;
    axi_clk_0 : OUT STD_LOGIC;
    axi_rst_0_n : OUT STD_LOGIC
  );
END COMPONENT;

signal xt, yt: mem;
signal clk_out, rst_out : std_logic;


begin


clk_gen: clk_gen_sim_0 port map(axi_clk_in_0=> '1', axi_rst_in_0_n=> '0', axi_clk_0=> clk_out, axi_rst_0_n=> rst_out);
eight_point: eight_point_fft_pipeline port map (
                                       input => xt,
                                       clk=> clk_out,
                                       output => yt);                                       
                                       

xt(0).r <= std_logic_vector(to_float(1,8, 23));
xt(0).i <= std_logic_vector(to_float(0,8, 23));

xt(1).r <= std_logic_vector(to_float(0,8, 23));
xt(1).i <= std_logic_vector(to_float(2,8, 23));

xt(2).r <= std_logic_vector(to_float(0,8, 23));
xt(2).i <= std_logic_vector(to_float(0,8, 23));

xt(3).r <= std_logic_vector(to_float(0,8, 23));
xt(3).i <= std_logic_vector(to_float(0,8, 23));

xt(4).r <= std_logic_vector(to_float(0,8, 23));
xt(4).i <= std_logic_vector(to_float(0,8, 23));

xt(5).r <= std_logic_vector(to_float(0,8, 23));
xt(5).i <= std_logic_vector(to_float(0,8, 23));

xt(6).r <= std_logic_vector(to_float(0,8, 23));
xt(6).i <= std_logic_vector(to_float(1,8, 23));

xt(7).r <= std_logic_vector(to_float(1,8, 23));
xt(7).i <= std_logic_vector(to_float(0,8, 23));


end Behavioral;
