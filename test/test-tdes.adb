with AUnit.Assertions; 
with Crypto.Symmetric.Blockcipher_Tripledes;
with Crypto.Symmetric.Blockcipher_Obsolete_Tripledes;
with Crypto.Types;

package body Test.TDES is
   use Crypto.Types;
   
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-------------------------------- Type - Declaration --------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

	Plaintext: array(1..3) of  B_Block64 :=
     ((16#54#, 16#68#, 16#65#, 16#20#, 16#71#, 16#75#, 16#66#, 16#63#),
      (16#6B#, 16#20#, 16#62#, 16#72#, 16#6F#, 16#77#, 16#6E#, 16#20#),
      (16#66#, 16#6F#, 16#78#, 16#20#, 16#6A#, 16#75#, 16#6D#, 16#70#));


	Ciphertext: array(1..3) of  B_Block64 :=
     ((16#A8#, 16#26#, 16#FD#, 16#8C#, 16#E5#, 16#3B#, 16#85#, 16#5F#),
      (16#CC#, 16#E2#, 16#1C#, 16#81#, 16#12#, 16#25#, 16#6F#, 16#E6#),
      (16#68#, 16#D5#, 16#C0#, 16#5D#, 16#D9#, 16#B6#, 16#B9#, 16#00#));

	Key: B_Block192 := (16#01#, 16#23#, 16#45#, 16#67#, 16#89#, 16#AB#,
                        16#CD#, 16#EF#, 16#23#, 16#45#, 16#67#, 16#89#,
                        16#AB#, 16#CD#, 16#EF#, 16#01#, 16#45#, 16#67#,
                        16#89#, 16#AB#, 16#CD#, 16#EF#, 16#01#, 16#23#);

	Temp : B_Block64;

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
----------------------------- Register TDES Test 1 -----------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
	
	procedure Register_Tests(T : in out TDES_Test) is
		use Test_Cases.Registration;
	begin
		Register_Routine(T, TDES_Test1'Access,"TDES_Test1.");
		Register_Routine(T, TDES_Test2'Access,"TDES_Test2.");
		Register_Routine(T, TDES_Test3'Access,"TDES_Test3.");
	end Register_Tests;

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------ Name TDES Test ------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

	function Name(T : TDES_Test) return Test_String is
	begin
		return new String'("TDES Test");
	end Name;

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------ Start Tests -----------------------------------
------------------------------------------------------------------------------------
-------------------------------------- Test 1 --------------------------------------
------------------------------------------------------------------------------------

   procedure TDES_Test1(T : in out Test_Cases.Test_Case'Class) is
      use AUnit.Assertions; 
      use Crypto.Symmetric.Blockcipher_Tripledes;
   begin
   	   
   	   Prepare_Key(Key);
   	   Encrypt(Plaintext(1), Temp);

   	   for I in B_Block64'Range loop
   	   	   Assert(Temp(I) = Ciphertext(1)(I), "TripleDES failed."); 
	   end loop;
	   
	   Decrypt(Ciphertext(1), Temp);
   	   for I in B_Block64'Range loop
   	   	   Assert(Temp(I) = Plaintext(1)(I), "TripleDES failed."); 
	   end loop;

   end TDES_Test1;

------------------------------------------------------------------------------------
-------------------------------------- Test 2 --------------------------------------
------------------------------------------------------------------------------------

   procedure TDES_Test2(T : in out Test_Cases.Test_Case'Class) is
      use AUnit.Assertions; 
      use Crypto.Symmetric.Blockcipher_Tripledes;
   begin
   	   
   	   Prepare_Key(Key);
   	   Encrypt(Plaintext(2), Temp);

   	   for I in B_Block64'Range loop
   	   	   Assert(Temp(I) = Ciphertext(2)(I), "TripleDES failed."); 
	   end loop;
	   
	   Temp := (others => 0);
	   Decrypt(Ciphertext(2), Temp);

   	   for I in B_Block64'Range loop
   	   	   Assert(Temp(I) = Plaintext(2)(I), "TripleDES failed."); 
	   end loop;

   end TDES_Test2;

------------------------------------------------------------------------------------
-------------------------------------- Test 3 --------------------------------------
------------------------------------------------------------------------------------

   procedure TDES_Test3(T : in out Test_Cases.Test_Case'Class) is
      use AUnit.Assertions; 
      use Crypto.Symmetric.Blockcipher_Tripledes;
   begin
   	   
   	   Prepare_Key(Key);
   	   Encrypt(Plaintext(3), Temp);

   	   for I in B_Block64'Range loop
   	   	   Assert(Temp(I) = Ciphertext(3)(I), "TripleDES failed."); 
	   end loop;
	   
	   Temp := (others => 0);
	   Decrypt(Ciphertext(3), Temp);

   	   for I in B_Block64'Range loop
   	   	   Assert(Temp(I) = Plaintext(3)(I), "TripleDES failed."); 
	   end loop;

   end TDES_Test3;

------------------------------------------------------------------------------------

end Test.TDES;
