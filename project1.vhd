
Library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;



entity project1 is
	port (CLK_50MHz, start: in  std_logic;
			LEDTime,LEDTime1  		: out std_logic_vector(0 to 6) );
end project1;

architecture Behavior of project1 is

	signal counter_1Hz   : std_logic_vector(3 downto 0);
	signal counter_score	: std_logic_vector(31 downto 0);
	
	signal CLK_1Hz	: std_logic;
	signal second : integer;

	
begin 
	
	counter: process (CLK_50MHz)
	begin	
		
		if CLK_50MHz'event and CLK_50MHz = '1' then 
			if counter_1Hz < "1111" then   
				counter_1Hz <= counter_1Hz + 1;
			else
				counter_1Hz <= (others => '0');
			end if;
		end if;
	end process counter;
	

	
	push : process(start,CLK_50MHz)
	begin 
	

		
		if start = '0' then 
		 counter_score <= "10110010110100000101111000000000"; 
			
		elsif CLK_50MHz'event and CLK_50MHz = '1' then
				if counter_score > "0000000000000000000000000" then
					counter_score <= counter_score -1;
				else 
				counter_score <= counter_score; 
					
		
	if counter_score <= "11101110011010110010100000000" then--binary of 10s
					LEDTime1<= ("1001111");
					LEDTime<= ("0000001");
		elsif counter_score <= "111011100110101100101000000000" then--binary for 20s
					LEDTime1<= ("0010010");
					LEDTime<= ("0000001");
		elsif counter_score <= "1011001011010000010111100000000" then--binary for 30s
					LEDTime1<= ("0000110");
					LEDTime<= ("0000001");
		elsif counter_score <= "1110111001101011001010000000000" then--binary for 40s
					LEDTime1<= ("1001100");
					LEDTime<= ("0000001");
		elsif counter_score <= "10010101000000101111100100000000" then--binary for 50s
					LEDTime1<= ("0100100");
					LEDTime<= ("0000001");
		elsif counter_score <= "10110010110100000101111000000000" then--binary for 60s
					LEDTime1<= ("1000100");
					LEDTime<= ("0000001");
		end if;
		end if;
		end if;
			second <= second + 1;
		end loop;
	end process push;

end Behavior; 