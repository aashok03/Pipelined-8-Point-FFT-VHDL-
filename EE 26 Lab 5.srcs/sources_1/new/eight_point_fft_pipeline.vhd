library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library IEEE_Proposed;
use IEEE_Proposed.float_pkg.all;
use work.complex_record.all;

entity eight_point_fft_pipeline is
  Port (  
      input : in mem;
      clk : in std_logic;
      output: out mem   
  );
end eight_point_fft_pipeline;

architecture Behavioral of eight_point_fft_pipeline is

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

component D_Latch is
    Port ( 
        clk: in std_logic;
        D: in complex;
        Q: out complex
    );
end component D_latch;


signal W0, W1, W2, W3 : complex;

signal stage1_out, stage2_in, stage2_out, stage3_in : mem;


begin

W0.r <= std_logic_vector(to_float(1, 8, 23));
W0.i <= std_logic_vector(to_float(0, 8, 23));

W1.r <= std_logic_vector(to_float(0.70710678118, 8, 23));
W1.i <= std_logic_vector(to_float(0.70710678118, 8, 23));

W2.r <= std_logic_vector(to_float(0, 8, 23));
W2.i <= std_logic_vector(to_float(1, 8, 23));

W3.r <= std_logic_vector(to_float(-0.70710678118, 8, 23));
W3.i <= std_logic_vector(to_float(0.70710678118, 8, 23));


stage1_X00: fft_butterfly port map (A=> input(0), B=> input(4), W=> W0, clk=> clk, A_comp=> stage1_out(0), B_comp=> stage1_out(4));-- 0, 4
stage1_X01: fft_butterfly port map (A=> input(1), B=> input(5), W=> W0, clk=> clk, A_comp=> stage1_out(2), B_comp=> stage1_out(6));-- 1, 5
stage1_X10: fft_butterfly port map (A=> input(2), B=> input(6), W=> W0, clk=> clk, A_comp=> stage1_out(1), B_comp=> stage1_out(5));-- 2, 6
stage1_X11: fft_butterfly port map (A=> input(3), B=> input(7), W=> W0, clk=> clk, A_comp=> stage1_out(3), B_comp=> stage1_out(7));-- 3, 7

stage1: for i in 0 to 7 generate
            d1:D_Latch port map (clk, stage1_out(i), stage2_in(i));
        end generate stage1;

stage2_0X0: fft_butterfly port map (A=> stage2_in(0), B=> stage2_in(1), W=> W0, clk=> clk, A_comp=> stage2_out(0), B_comp=> stage2_out(4));-- 0, 2
stage2_0X1: fft_butterfly port map (A=> stage2_in(2), B=> stage2_in(3), W=> W0, clk=> clk, A_comp=> stage2_out(1), B_comp=> stage2_out(5));-- 1, 3
stage2_1X0: fft_butterfly port map (A=> stage2_in(4), B=> stage2_in(5), W=> W2, clk=> clk, A_comp=> stage2_out(2), B_comp=> stage2_out(6));-- 4, 6 
stage2_1X1: fft_butterfly port map (A=> stage2_in(6), B=> stage2_in(7), W=> W2, clk=> clk, A_comp=> stage2_out(3), B_comp=> stage2_out(7));-- 5, 7

stage2: for j in 0 to 7 generate
            d2:D_Latch port map (clk, stage2_out(j), stage3_in(j));
        end generate stage2;

stage3_00X: fft_butterfly port map (A=> stage3_in(0), B=> stage3_in(1), W=> W0, clk=> clk, A_comp=> output(0), B_comp=> output(4));-- 0, 1
stage3_01X: fft_butterfly port map (A=> stage3_in(2), B=> stage3_in(3), W=> W1, clk=> clk, A_comp=> output(7), B_comp=> output(3));-- 2, 3
stage3_10X: fft_butterfly port map (A=> stage3_in(4), B=> stage3_in(5), W=> W2, clk=> clk, A_comp=> output(6), B_comp=> output(2));-- 4, 5
stage3_11X: fft_butterfly port map (A=> stage3_in(6), B=> stage3_in(7), W=> W3, clk=> clk, A_comp=> output(5), B_comp=> output(1));-- 6, 7


end Behavioral;
