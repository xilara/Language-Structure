-- Xiana Lara
-- September 9th, 2020
-- Programming 2: Short Circuit Evaluation for ADA

-- This program tests ADA to see if the language implementation 
-- has short circuit evaluation in the AND Boolean construct.
-- If ADA is short circuited it evaluates only the first function 
-- to determine if the expression is true of false.

-- Input:  None
-- Output: 2 different and expressions 
-- Expression 1: False (False && True)
-- Expression 2: False (True && False)

-- for use on CS machines
With Gnat.IO; 
use Gnat.IO;

procedure adatest is

   function func1 return Boolean is
      x : Boolean;
   
   begin
      
      x := False;
      -- print statement
      Put_Line("func1 has been evaluated"); 
      return x;
   
   end func1;
   -- of func1

   function func2 return Boolean is
      y : Boolean;
   begin
      
      y := True;
      -- print statement
      Put_Line("func2 has been evaluated");
      return y;
   
   end func2;
   -- of func2

-- main: depending on indention 
begin
   
   -- print statement
   Put_Line("Statement: if func1 and then func2 then");
   
   -- result: false
   if func1 and then func2 then 
      Put_Line("True");
   else
      Put_Line("False");
   end if;
   
   New_Line;
   -- print statement
   Put_Line("Statement: if func2 and then func1 then");
   
   -- result: false
   if func2 and then func1 then
      -- print statement
      Put_Line("True");
   else
      -- print statement
      Put_Line("False");
   end if;

end adatest;
-- of main test
