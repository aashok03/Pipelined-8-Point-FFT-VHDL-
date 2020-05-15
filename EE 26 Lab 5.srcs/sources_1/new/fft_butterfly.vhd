library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library IEEE_Proposed;
use IEEE_Proposed.float_pkg.all;
use work.complex_record.all;

entity fft_butterfly is    
Port ( 
    A : in complex;           
    B : in complex;   
    W : in complex;        
    clk : std_logic;           
    A_comp : out complex;           
    B_comp : out complex
    );
end fft_butterfly;

-- choose constant k = 1
-- constant N = 8
-- cos(2pi(1)/8) = cos(2pi(1)/8) = 0.7071067812

architecture Behavioral of fft_butterfly is

type num_array is array (3 downto 0) of std_logic_vector(31 downto 0);
--signal W : complex ;
signal add_in1, add_in2, add_out, sub_in1, sub_in2, sub_out, mul_in1, mul_in2, mul_out : num_array;
component fp_adder_subtractor IS  
PORT (
    aclk : IN STD_LOGIC;    
    s_axis_a_tvalid : IN STD_LOGIC;    
    s_axis_a_tready : OUT STD_LOGIC;    
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);    
    s_axis_b_tvalid : IN STD_LOGIC;    
    s_axis_b_tready : OUT STD_LOGIC;    
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);    
    s_axis_operation_tvalid : IN STD_LOGIC;    
    s_axis_operation_tready : OUT STD_LOGIC;    
    s_axis_operation_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);    
    m_axis_result_tvalid : OUT STD_LOGIC;    
    m_axis_result_tready : IN STD_LOGIC;    
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)  
    );
END component fp_adder_subtractor;

component fp_multiplier IS  
PORT (    
    aclk : IN STD_LOGIC;    
    s_axis_a_tvalid : IN STD_LOGIC;    
    s_axis_a_tready : OUT STD_LOGIC;    
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);    
    s_axis_b_tvalid : IN STD_LOGIC;    
    s_axis_b_tready : OUT STD_LOGIC;    
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);    
    m_axis_result_tvalid : OUT STD_LOGIC;    
    m_axis_result_tready : IN STD_LOGIC;    
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)  
    );
END component fp_multiplier;

begin

--W.r <= to_float(0.7071067812, W.r);
--W.i <= to_float(0.7071067812, W.i);
--W.r <= std_logic_vector(to_float(0.5, 8, 23));
--W.i <= std_logic_vector(to_float(0.5, 8, 23));

addition_gen:
for i in 0 to 3 generate   
    addition: fp_adder_subtractor port map (
     aclk => clk, 
     s_axis_a_tvalid => '0', 
     s_axis_a_tready => open, 
     s_axis_a_tdata => add_in1(i),  
     s_axis_b_tvalid => '0', 
     s_axis_b_tready => open, 
     s_axis_b_tdata => add_in2(i), 
     s_axis_operation_tvalid => '0', 
     s_axis_operation_tready => open,  
     s_axis_operation_tdata => "00000000",  
     m_axis_result_tvalid => open, 
     m_axis_result_tready => '0',   
     m_axis_result_tdata => add_out(i)
);
end generate addition_gen;


subtraction_gen:
for i in 0 to 3 generate    
    subtraction: fp_adder_subtractor port map (
    aclk => clk, 
    s_axis_a_tvalid => '0',
    s_axis_a_tready => open, 
    s_axis_a_tdata => sub_in1(i),  
    s_axis_b_tvalid => '0', 
    s_axis_b_tready => open, 
    s_axis_b_tdata => sub_in2(i), 
    s_axis_operation_tvalid => '0', 
    s_axis_operation_tready => open,  
    s_axis_operation_tdata => "00000001",  
    m_axis_result_tvalid => open, 
    m_axis_result_tready => '0',   
    m_axis_result_tdata => sub_out(i)
    );
end generate subtraction_gen;


multiplication_gen:
for i in 0 to 3 generate    
    multiplication: fp_multiplier port map (
    aclk => clk, 
    s_axis_a_tvalid => '0', 
    s_axis_a_tready => open, 
    s_axis_a_tdata => mul_in1(i),  
    s_axis_b_tvalid => '0', 
    s_axis_b_tready => open, 
    s_axis_b_tdata => mul_in2(i),  
    m_axis_result_tvalid => open, 
    m_axis_result_tready => '0',   
    m_axis_result_tdata => mul_out(i)
    );
end generate multiplication_gen;

--A_comp.r <= A.r + (B.r * W.r) - (B.i *W.i);
--A_comp.i <= A.i + (B.i * W.r) + (B.r * W.i);
--B_comp.r <= A.r - (B.r * W.r) + (B.i * W.i);
--B_comp.i <= A.i - (B.i * W.r) - (B.r * W.i);

A_comp.r <= add_out(0);
add_in1(0) <= A.r;
add_in2(0) <= sub_out(0); -- A_comp.r <= A.r + sub_out(0)

sub_in1(0) <= mul_out(0);
mul_in1(0) <= B.r;
mul_in2(0) <= W.r; -- sub_in1(0) <= B.r * W.r;

sub_in2(0) <= mul_out(1);
mul_in1(1) <= B.i;
mul_in2(1) <= W.i; -- sub_in2(0) <= B.i * W..i;

A_comp.i <= add_out(1);
add_in1(1) <= A.i;
add_in2(1) <= add_out(2); -- A_comp.i <= A.i + add_out(2)

add_in1(2) <= mul_out(2);
mul_in1(2) <= B.i;
mul_in2(2) <= W.r; -- add_in1(2) <= B.i * W.r;

add_in2(2) <= mul_out(3);
mul_in1(3) <= B.r;
mul_in2(3) <= W.i; -- add_in2(2) <= B.r * W..i;

B_comp.r <= sub_out(1);
sub_in1(1) <= A.r;
sub_in2(1) <= sub_out(2); -- B_comp.r <= A.r - sub_out(2)

sub_in1(2) <= mul_out(0); -- sub_in1(2) <= B.r * W.r;
sub_in2(2) <= mul_out(1); -- sub_in2(0) <= B.i * W..i;

B_comp.i <= sub_out(3);
sub_in1(3) <= A.i;
sub_in2(3) <= add_out(3); -- B_comp.i <= A.i - add_out(3)

add_in1(3) <= mul_out(2); -- add_in1(3) <= B.i * W.r;
add_in2(3) <= mul_out(3); -- add_in2(3) <= B.r * W..i;

end Behavioral;
