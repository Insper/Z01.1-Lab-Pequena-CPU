----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		USER_IN  : in  std_logic_vector(15 downto 0);
		USER_OUT : out std_logic_vector(15 downto 0);
		clk      : in  std_logic
	);
end entity;

architecture rtl of TopLevel is

  signal reg : std_logic_vector(15 downto 0) := x"0073"; -- 115
  signal saida : std_logic_vector(15 downto 0) := x"005F"; -- 95
  signal op_c : std_logic_vector(3 downto 0);
  signal ula_c: std_logic_vector(5 downto 0);

  component reg_c is
    port (
      d  : in  STD_LOGIC_VECTOR(15 downto 0);
      q  : out STD_LOGIC_VECTOR(15 downto 0);
      clk: in  std_logic
    );
  end component;

  component controlUnit is
    port (
      op:  in STD_LOGIC_VECTOR(3 downto 0);
      ula: out STD_LOGIC_VECTOR(5 downto 0)
    );
  end component;

  component ALU is
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
  end component;

  component mem is
	port (
    op : out  STD_LOGIC_VECTOR(3 downto 0);
    clk: in std_logic
	);
	end component;
  
begin

  u1 : alu port map(reg, user_in,
                    ula_c(5), ula_c(4), ula_c(3), ula_c(2), ula_c(1), ula_c(0),
                    open, open,
                    saida);

  u2 : controlUnit port map(op_c, ula_c);

  u3: reg_c port map(saida, reg, clk);

  u4: mem port map(op_c, clk);
  
  USER_OUT <= saida;

end rtl;
