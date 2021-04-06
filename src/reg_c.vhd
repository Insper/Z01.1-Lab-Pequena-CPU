library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reg_c is
	port (
      d  : in  STD_LOGIC_VECTOR(15 downto 0);
      q  : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
      en : in  std_logic;
      clk: in  std_logic
	);
end entity;

architecture  rtl OF reg_c is
begin

    process(clk)
    begin
      if(rising_edge(clk)) then
        if(en = '1') then
          q<=d;
        end if;
      end if;
    end process;

end architecture;
