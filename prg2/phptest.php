<?php
  # Xiana Lara
  # September 9th, 2020
  # Programming 2: Short Circuit Evaluation for PHP

  # This program tests PHP to see if the language implementation 
  # has short circuit evaluation in the AND Boolean construct.
  # If PHP is short circuited it evaluates only the first function 
  # to determine if the expression is true of false.

  # Input:  None
  # Output: 2 different and expressions 
  # Expression 1: False (func1 && func2)
  # Expression 2: False (func2 && func1)

  function func1(){

    # print statement
    echo "func1 has been evaluated\n";
    return 0; 
  
  } # of func1

  function func2(){
    
    # print statement
    echo "func2 has been evaluated\n";
    return 1; 

  } # of func2

  # print statement
  echo "\nStatment: if(func1() and func2())\n";

  if(func1() && func2()){
    # print statement
    echo "True\n";
  } else {
    # print statement
    echo "False\n";
  }

  # print statement
  echo "\nStatment: if(func2() and func1())\n";

  if(func2() && func1()){
    # print statement
    echo "True\n";
  } else {
    # print statement
    echo "False\n";
  }

