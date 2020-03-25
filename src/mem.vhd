library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity mem is
	port (
    op : out  STD_LOGIC_VECTOR(3 downto 0);
    clk: in std_logic
	);
end entity;

architecture  rtl OF mem is

  signal address : integer := 0;
  type ram_type is array (0 to 7) of std_logic_vector(3 downto 0); signal RAM : ram_type := (
              "0001", -- mov 0,C
              "1001", -- add 1,C
              "0000", -- nop
              "1010", -- add Y,C
              "1011", -- sub 1,C
              "1000", -- not C
              "0000", -- nop
              "0000"); -- nop
begin

    process(clk)
    begin
      if(rising_edge(clk)) then
        if(address < 7) then
          address <= address + 1;
        end if;
      end if;
    end process;

    op <= ram(address);

end architecture;
