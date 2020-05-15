library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library IEEE_PROPOSED;
use IEEE_PROPOSED.float_pkg.all;

package complex_record is

type complex is
 record
    r: std_logic_vector(31 downto 0);
    i: std_logic_vector(31 downto 0);
end record;

type mem is array (7 downto 0) of complex; 

end package complex_record;
