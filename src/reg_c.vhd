library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reg_c is
	port (
    d  : in  STD_LOGIC_VECTOR(15 downto 0);
    clk: in  std_logic;
    q  : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0')
	);
end entity;

architecture  rtl OF reg_c is
begin

    process(clk)
    begin
      if(rising_edge(clk)) then
        q<=d;
      end if;
    end process;

end architecture;
