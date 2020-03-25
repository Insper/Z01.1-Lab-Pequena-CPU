library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity ALU is
	port (
			x,y:   in STD_LOGIC_VECTOR(15 downto 0); -- entradas de dados da ALU
			zx:    in STD_LOGIC;                     -- zera a entrada x
			nx:    in STD_LOGIC;                     -- inverte a entrada x
			zy:    in STD_LOGIC;                     -- zera a entrada y
			ny:    in STD_LOGIC;                     -- inverte a entrada y
			f:     in STD_LOGIC;                     -- se 0 calcula x & y, senão x + y
			no:    in STD_LOGIC;                     -- inverte o valor da saída
			zr:    out STD_LOGIC;                    -- setado se saída igual a zero
			ng:    out STD_LOGIC;                    -- setado se saída é negativa
			saida: out STD_LOGIC_VECTOR(15 downto 0) -- saída de dados da ALU
	);
end entity;

architecture  rtl OF alu is

  signal x_z, x_n, y_z, y_n, s, so : std_logic_vector(15 downto 0);

begin

  x_z <= x when zx = '0' else (others => '0');
  y_z <= y when zy = '0' else (others => '0');

  x_n <= x_z when nx = '0' else not x_z;
  y_n <= y_z when ny = '0' else not y_z;

  s <= x_n and y_n when f = '0' else std_logic_vector(unsigned(x_n) + unsigned(y_n));

  so <= s when no = '0' else not s;

  saida <= so;

  ng <= so(15); zr <= '1' when so = x"0000" else '0';

end architecture;
