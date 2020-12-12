# Xiana Lara
# 11/2/2020
# The given data has been through a "backup" program which added extraneous data.
# Corrupt data ALWAYS starts with a CONTROL-C and always ends in a CONTROL-B
# This PERL program removes these values
# Input: Corrupt Data - control-char.txt
# Output: Clean Data - perl-control-char.txt

#!usr/bin/perl

open(FH, '<', 'control-char.txt');

open(FILE, '>', 'perl-control-char.txt');

#true
$flag = 1; 
$temp = getc(FH);


while($temp || $temp eq 0){

   $tempNum = ord($temp);

   # ctrl+C
   if ($tempNum == 0x03){
      $flag = 0; #false
   }

   if ($flag){
      $myChar = chr($tempNum);
      print FILE $myChar;
   }

   # ctrl+B
   if ($tempNum == 0x02){
      $flag = 1;
   }

   $temp = getc(FH);

} # of while


# close the files
close (FILE);
close (FH);