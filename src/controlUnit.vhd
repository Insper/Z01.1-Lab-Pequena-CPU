library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity controlunit is
	port (
			op:  in std_logic_vector(3 downto 0);
            en:  out std_logic;
            ng:  in  std_logic;
            zr:  in  std_logic;
			ula: out std_logic_vector(5 downto 0)
	);
end entity;

architecture  rtl of controlunit is

  signal control : std_logic_vector(6 downto 0);

begin

  ula <= control(6 downto 1);
  en  <= control(0);

  control <=
    "101010" & '1' when op = "0001" else
    "011111" & '1' when op = "1001" else
    "000000" & '1' when op = "0000" else
    "101000" & '1'; -- qualquer coisa!

end architecture;
