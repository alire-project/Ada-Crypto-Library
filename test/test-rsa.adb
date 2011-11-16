with AUnit.Assertions; 
with Crypto.Asymmetric.RSA;
with Crypto.Types;

package body Test.RSA is

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-------------------------------- Type - Declaration --------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

   package RSA is new Crypto.Asymmetric.RSA(512);
   use RSA;
   use Crypto.Types;

    N: RSA_Number :=
     (16#ec#, 16#d1#, 16#54#, 16#36#, 16#1e#, 16#c4#, 16#bc#, 16#9b#,
      16#5d#, 16#d8#, 16#5b#, 16#4b#, 16#24#, 16#0e#, 16#85#, 16#c7#,
      16#8c#, 16#e0#, 16#34#, 16#8a#, 16#68#, 16#11#, 16#78#, 16#5b#,
      16#93#, 16#d5#, 16#21#, 16#74#, 16#fd#, 16#e2#, 16#54#, 16#44#,
      16#d5#, 16#52#, 16#6d#, 16#fc#, 16#6b#, 16#1e#, 16#ce#, 16#91#,
      16#c8#, 16#9d#, 16#89#, 16#ff#, 16#ed#, 16#dc#, 16#19#, 16#de#,
      16#b0#, 16#cc#, 16#cd#, 16#fb#, 16#bd#, 16#c6#, 16#c5#, 16#a7#,
      16#8a#, 16#2f#, 16#70#, 16#d2#, 16#4e#, 16#bc#, 16#5f#, 16#97#);


    E: RSA_Number :=
     (16#35#, 16#d5#, 16#a4#, 16#4d#, 16#ea#, 16#ee#, 16#81#, 16#76#,
      16#25#, 16#28#, 16#3e#, 16#b8#, 16#77#, 16#bb#, 16#68#, 16#2c#,
      16#7b#, 16#0b#, 16#3d#, 16#75#, 16#0c#, 16#36#, 16#bb#, 16#c0#,
      16#15#, 16#62#, 16#9c#, 16#19#, 16#de#, 16#68#, 16#4e#, 16#3f#,
      16#76#, 16#d1#, 16#13#, 16#93#, 16#45#, 16#44#, 16#28#, 16#5e#,
      16#e7#, 16#e5#, 16#84#, 16#ae#, 16#6e#, 16#d2#, 16#9c#, 16#69#,
      16#e7#, 16#c7#, 16#7a#, 16#df#, 16#ef#, 16#29#, 16#bb#, 16#94#,
      16#ef#, 16#26#, 16#3c#, 16#13#, 16#26#, 16#c0#, 16#0b#, 16#11#);



    Phi: RSA_Number :=
       (16#ec#, 16#d1#, 16#54#, 16#36#, 16#1e#, 16#c4#, 16#bc#, 16#9b#,
        16#5d#, 16#d8#, 16#5b#, 16#4b#, 16#24#, 16#0e#, 16#85#, 16#c7#,
        16#8c#, 16#e0#, 16#34#, 16#8a#, 16#68#, 16#11#, 16#78#, 16#5b#,
        16#93#, 16#d5#, 16#21#, 16#74#, 16#fd#, 16#e2#, 16#54#, 16#42#,
        16#cc#, 16#ff#, 16#ed#, 16#5d#, 16#a6#, 16#f5#, 16#29#, 16#46#,
        16#5a#, 16#ff#, 16#de#, 16#8f#, 16#b3#, 16#37#, 16#c7#, 16#37#,
        16#67#, 16#6a#, 16#5c#, 16#7f#, 16#5c#, 16#98#, 16#01#, 16#6d#,
        16#ff#, 16#40#, 16#18#, 16#53#, 16#71#, 16#d1#, 16#c9#, 16#28#);


    D: RSA_Number :=
     (16#43#, 16#79#, 16#cf#, 16#6a#, 16#3c#, 16#3b#, 16#74#, 16#0d#,
      16#d6#, 16#34#, 16#00#, 16#0c#, 16#4d#, 16#03#, 16#43#, 16#98#,
      16#29#, 16#3c#, 16#39#, 16#3e#, 16#9c#, 16#98#, 16#5f#, 16#23#,
      16#f7#, 16#8e#, 16#8c#, 16#49#, 16#cd#, 16#f3#, 16#2f#, 16#ce#,
      16#24#, 16#9f#, 16#8e#, 16#c3#, 16#2d#, 16#6b#, 16#a3#, 16#f7#,
      16#16#, 16#4a#, 16#b6#, 16#4e#, 16#20#, 16#b1#, 16#33#, 16#4e#,
      16#3c#, 16#81#, 16#c0#, 16#4c#, 16#2b#, 16#d1#, 16#29#, 16#2c#,
      16#52#, 16#7d#, 16#04#, 16#74#, 16#5b#, 16#e3#, 16#f0#, 16#c9#);
    
    M: Bytes := (16#D4#, 16#36#, 16#e9#, 16#95#, 16#69#, 16#fd#, 16#32#,
                 16#a7#, 16#c8#, 16#a0#, 16#5b#, 16#bc#, 16#90#, 16#d3#,
                 16#2c#, 16#49#);
    
    A: Public_Key_RSA ;
    B: Private_Key_RSA ;
     
    Public_Key:  Public_Key_RSA;
    Private_Key: Private_Key_RSA;


------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------- Register RSA Test 1 --------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
	
	procedure Register_Tests(T : in out RSA_Test) is
		use Test_Cases.Registration;
	begin
		Register_Routine(T, RSA_Test1'Access,"RSA_Test1.");
		Register_Routine(T, RSA_Test2'Access,"RSA_Test2.");
		Register_Routine(T, RSA_Test3'Access,"RSA_Test3.");
	end Register_Tests;

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
---------------------------------- Name RSA Test -----------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

	function Name(T : RSA_Test) return Test_String is
	begin
		return new String'("RSA Test");
	end Name;

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------ Start Tests -----------------------------------
------------------------------------------------------------------------------------
-------------------------------------- Test 1 --------------------------------------
------------------------------------------------------------------------------------

   procedure RSA_Test1(T : in out Test_Cases.Test_Case'Class) is
      use AUnit.Assertions; 
   begin
   	   
--   	   E(E'Last) := 16#11#;
   	   Set_Public_Key(N, E, Public_Key);
   	   Set_Private_Key(N, D, Phi, Private_Key);
   	   Assert(Verify_Key_Pair(Private_Key, Public_Key), "RSA verifying Key failed.");

   end RSA_Test1;

------------------------------------------------------------------------------------
-------------------------------------- Test 2 --------------------------------------
------------------------------------------------------------------------------------

   procedure RSA_Test2(T : in out Test_Cases.Test_Case'Class) is
      use AUnit.Assertions; 
   begin
   	   
   	   declare
   	   	   Ciphertext: Bytes := OAEP_Encrypt(Public_Key, M);
		   Plaintext: Bytes := OAEP_Decrypt(Private_Key, Ciphertext);
		   begin
		   	   Assert(M'Length = Plaintext'Length, "RSA failed.");
		   	   for I in 0 .. M'Length - 1 loop
		   	   	   Assert(Plaintext(Plaintext'First+I) = M(M'First+I), "RSA failed.");
		   	   end loop;
		   end;

   end RSA_Test2;

------------------------------------------------------------------------------------
-------------------------------------- Test 3 --------------------------------------
------------------------------------------------------------------------------------

   procedure RSA_Test3(T : in out Test_Cases.Test_Case'Class) is
      use AUnit.Assertions; 
   begin

   	   Gen_Key(A, B);
   	   Assert(Verify_Key_Pair(B, A), "RSA verifying Key failed.");

   end RSA_Test3;

------------------------------------------------------------------------------------

end Test.RSA;
