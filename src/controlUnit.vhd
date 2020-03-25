library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity controlunit is
	port (
			op:  in std_logic_vector(3 downto 0);
			ula: out std_logic_vector(5 downto 0)
	);
end entity;

architecture  rtl of controlunit is

begin

  with op select ula <=
    "101010" when "0001", -- mov 0, C
    "011111" when "1001", -- add 1, C
    "001101" when "1000",-- not C
    "000010" when "1010", -- add Y,C
    "001110" when "1011",  -- sub 1,C
    "001100" when others; -- nop

end architecture;
