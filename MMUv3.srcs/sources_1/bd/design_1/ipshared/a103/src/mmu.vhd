library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std.all;

entity mmu is
  Port (
    virt : in std_logic_vector(31 downto 0);
    phys : out std_logic_vector(31 downto 0);
    clock   : in  std_logic;
    we      : in  std_logic;
    datain  : in  std_logic_vector(15 downto 0)
     );
end mmu;

architecture Behavioral of mmu is

-- prepei edo na ftiakso ena signal gia na mporesv na balv ola ta bit mazi kai na ta portaro sto phys toy mmu
--All the signals are declared here,which are not a part of the top module.
--These are temporary signaaaaals 
  signal temp : std_logic_vector(7 downto 0); --edo apothikeyo prosorina to physical part ths virtual address
 -- signal phs : std_logic_vector(15 downto 0);  -- edo apothikeyo prosorina to physical part poy kanv retrieve apo thn ram


component ram
    port (
    clock   : in  std_logic;
    we      : in  std_logic;
    address : in  std_logic_vector(15 downto 0);
    datain  : in  std_logic_vector(15 downto 0);
    dataout : out std_logic_vector(15 downto 0)
  );
end component;

begin
--instantiate and do port map for the ram
ram1: ram port map (
        clock   => clock,
        we      => we,
        address => virt(31 downto 16),
        datain  => datain,
        dataout => phys(31 downto 16)
        );
        
        phys(15 downto 0) <= virt(15 downto 0); --temp;
        
end Behavioral;