library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ieee_proposed;
use ieee_proposed.float_pkg.all;
use work.complex_record.all;

-- mem is a type defined as "array(7 downto 0) of complex" in the package file.

entity ROM is  
    port ( 
        address : in std_logic_vector(2 downto 0); 
        data : out mem
        );
end entity ROM;

architecture behavioral of ROM is  

type mem_all is array (0 to 63) of complex;  

constant my_rom : mem_all := (    -- floating-point numbers can be defined in decimal or IEEE 754 hex representation.    
0  => (r => std_logic_vector(to_float(1, 8, 23)), i => std_logic_vector(to_float(0, 8, 23))),    
1  => (r => std_logic_vector(to_float(0,8, 23)), i => std_logic_vector(to_float(2,8, 23))),
2  => (r => std_logic_vector(to_float(0,8, 23)), i => std_logic_vector(to_float(0,8, 23))),
3  => (r => std_logic_vector(to_float(0,8, 23)), i => std_logic_vector(to_float(0,8, 23))),
4  => (r => std_logic_vector(to_float(0,8, 23)), i => std_logic_vector(to_float(0,8, 23))),
5  => (r => std_logic_vector(to_float(0,8, 23)), i => std_logic_vector(to_float(0,8, 23))),   
6  => (r => std_logic_vector(to_float(0, 8, 23)), i => std_logic_vector(to_float(1, 8, 23))),    
7  => (r => std_logic_vector(to_float(1, 8, 23)), i => std_logic_vector(to_float(0, 8, 23))),    

16  => (r => std_logic_vector(to_float(0, 8, 23)), i => std_logic_vector(to_float(1, 8, 23))),    
17  => (r => std_logic_vector(to_float(2,8, 23)), i => std_logic_vector(to_float(0,8, 23))),
18  => (r => std_logic_vector(to_float(0,8, 23)), i => std_logic_vector(to_float(0,8, 23))),
19  => (r => std_logic_vector(to_float(0,8, 23)), i => std_logic_vector(to_float(0,8, 23))),
20  => (r => std_logic_vector(to_float(0,8, 23)), i => std_logic_vector(to_float(0,8, 23))),
21  => (r => std_logic_vector(to_float(0,8, 23)), i => std_logic_vector(to_float(0,8, 23))),   
22  => (r => std_logic_vector(to_float(1, 8, 23)), i => std_logic_vector(to_float(0, 8, 23))),    
23  => (r => std_logic_vector(to_float(0, 8, 23)), i => std_logic_vector(to_float(1, 8, 23))),

others => (r => x"00000000", i => x"00000000"));

begin    

g1: for i in 0 to 7 generate
    data(i) <= my_rom(to_integer(unsigned(address & std_logic_vector(to_unsigned(i,3)))));    
end generate g1;

end architecture behavioral;