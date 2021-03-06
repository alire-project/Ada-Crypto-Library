with AUnit.Assertions; 
with Crypto.Symmetric.Blockcipher_Serpent256;
with Crypto.Types;

package body Test.Serpent is
   use Crypto.Types;
   
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-------------------------------- Type - Declaration --------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

   Key: B_Block256;
   
   Plaintext: B_Block128; 
   Ciphertext: B_Block128;
    
   Temp: B_Block128;

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
----------------------------- Register Serpent Test 1 -----------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
	
	procedure Register_Tests(T : in out Serpent_Test) is
		use Test_Cases.Registration;
	begin
		Register_Routine(T, Serpent_Test1'Access,"Serpent256_Test1.");
		Register_Routine(T, Serpent_Test2'Access,"Serpent256_Test2.");
	end Register_Tests;

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------ Name Serpent Test ------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

	function Name(T : Serpent_Test) return Test_String is
	begin
		return new String'("Serpent Test");
	end Name;

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------ Start Tests -----------------------------------
------------------------------------------------------------------------------------
-------------------------------------- Test 1 --------------------------------------
------------------------------------------------------------------------------------

   procedure Serpent_Test1(T : in out Test_Cases.Test_Case'Class) is
      use AUnit.Assertions; 
      use Crypto.Symmetric.Blockcipher_Serpent256;
   begin
      
      Key := (16#00#, 16#01#, 16#02#, 16#03#, 16#04#, 16#05#,
	      16#06#, 16#07#, 16#08#, 16#09#, 16#0a#, 16#0b#,
	      16#0c#, 16#0d#, 16#0e#, 16#0f#, 16#10#, 16#11#,
	      16#12#, 16#13#, 16#14#, 16#15#, 16#16#, 16#17#,
	      16#18#, 16#19#, 16#1a#, 16#1b#, 16#1c#, 16#1d#,
	      16#1e#, 16#1f#);
      
      Plaintext := (16#3D#, 16#A4#, 16#6F#, 16#FA#, 16#6F#,
		    16#4D#, 16#6F#, 16#30#, 16#CD#, 16#25#,
		    16#83#, 16#33#, 16#E5#, 16#A6#, 16#13#,
		    16#69#);
      
      Ciphertext := (16#00#, 16#11#, 16#22#, 16#33#, 16#44#,
		     16#55#, 16#66#, 16#77#, 16#88#, 16#99#,
		     16#aa#, 16#bb#, 16#cc#, 16#dd#, 16#ee#,
		     16#ff#);
      
      Prepare_Key(Key);
      
      Encrypt(Plaintext, Temp);
      
      Assert(Ciphertext =  Temp, "Serpent256_1 Failed.");
      
      Decrypt(Ciphertext, Temp);
      
      Assert(Plaintext =  Temp, "Serpent256_1 Failed.");
      
   end Serpent_Test1;

------------------------------------------------------------------------------------
-------------------------------------- Test 2 --------------------------------------
------------------------------------------------------------------------------------

   procedure Serpent_Test2(T : in out Test_Cases.Test_Case'Class) is
      use AUnit.Assertions; 
      use Crypto.Symmetric.Blockcipher_Serpent256;
   begin
   	   
      Key := (16#2B#, 16#D6#, 16#45#, 16#9F#, 16#82#, 16#C5#, 16#B3#, 16#00#,
	      16#95#, 16#2C#, 16#49#, 16#10#, 16#48#, 16#81#, 16#FF#, 16#48#,
	      16#2B#, 16#D6#, 16#45#, 16#9F#, 16#82#, 16#C5#, 16#B3#, 16#00#,
	      16#95#, 16#2C#, 16#49#, 16#10#, 16#48#, 16#81#, 16#FF#, 16#48#);
       
      Plaintext := (16#67#, 16#7C#, 16#8D#, 16#FA#, 16#A0#, 16#80#, 16#71#,
		    16#74#, 16#3F#, 16#D2#, 16#B4#, 16#15#, 16#D1#, 16#B2#,
		    16#8A#, 16#F2#);
      
      Ciphertext := (16#EA#, 16#02#, 16#47#, 16#14#, 16#AD#, 16#5C#, 16#4D#,
		     16#84#, 16#EA#, 16#02#, 16#47#, 16#14#, 16#AD#, 16#5C#,
		     16#4D#, 16#84# );
      
      Prepare_Key(Key);
      
      Encrypt(Plaintext, Temp);
      
      Assert(Ciphertext =  Temp, "Serpent256_2 Failed.");
   	   
      Decrypt(Ciphertext, Temp);
      
      Assert(Plaintext =  Temp, "Serpent256_2 Failed.");

   end Serpent_Test2;

------------------------------------------------------------------------------------

end Test.Serpent;
