package body Big_Number_AND_Results is

	function Result_0 return String is
		Str_Result_0: String(1 .. 1027);
	begin
		Str_Result_0 := "2#110001101011011111111101001100110010101000111000000" &
		"010011110100100011110110001001011111010110101101110010001110100001101" &
		"100111001111101111001100101101101011110001010100110110001110100111000" &
		"000101010110000011111111111100010110001100110011111010111011001100100" &
		"000010111100011001011011000001000011011010000100010101000001101010011" &
		"110101101111100100000111101111101110111010101010010011001010011101110" &
		"010010001011001000001111101111001000110001011101110101100100010111111" &
		"000001010100010111101011101101100000011000011010011101111000011101100" &
		"100100111101001000111101011100111000101011001011001000010001001111011" &
		"111011100010100000110010100010111110110000010101101011111010001111010" &
		"011000011010011000000101110010001000010011011110111000110010100111010" &
		"101001011101111000010101000010100111110110101101101000100001010101101" &
		"001101111101100111010001001010101000100011000100011101110001100111001" &
		"011000011000010011110101111001110011111010110110011001000011100100000" &
		"010001100101111100010001010000000000000000000000000000000000000000000" &
		"0000000#";
		return Str_Result_0;
	end Result_0;

	function Result_1 return String is
		Str_Result_1: String(1 .. 763);
	begin
		Str_Result_1 := "2#100000011000010011000000000010011010000100010100000" &
		"000000010011010001100000000000000001100010001110010000001000010010001" &
		"000010001110000000000000001000001101101110000000110000010000110101000" &
		"100010010001000001000100000010001010100001000000010000000010011000011" &
		"000000001100000000101100001000111100001000101000101000001011001000000" &
		"001000011001110010000000000000100010100000001100100000000100101001001" &
		"000000111010011000001010000000000001010000000000010011001010111000000" &
		"010100111010101000010000111000000001000010100110010000000000001000000" &
		"000010101100001000111101000110010001000010001000000010000000011001000" &
		"000100000000000000011000000011010100101000000010010000000110000001000" &
		"010100000000010000100000101100010000010000000000000000000000000000000" &
		"0000000000000000000#";
		return Str_Result_1;
	end Result_1;

end Big_Number_AND_Results;
