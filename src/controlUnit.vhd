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
    "101010" when "0001",
    "011111" when "1001",
    "001100" when others;

end architecture;
