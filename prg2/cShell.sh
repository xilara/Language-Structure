# Xiana Lara
# September 9th, 2020
# Programming 2: Short Circuit Evaluation for C Shell

# This program tests C Shell to see if the language implementation 
# has short circuit evaluation in the AND Boolean construct.
# If C Shell is short circuited it evaluates only the first function 
# to determine if the expression is true of false.

# Input:  None
# Output: 2 different and expressions 
# Expression 1: False (func1 && func2)
# Expression 2: False (func2 && func1)

#!/bin/sh

func1(){

  # print statement
  echo "func1 has been evaluated"
  return 0 

} # of func1

func2(){

  # print statement
  echo "func2 has been evaluated"
  return 1

} # of func2

# print statement
echo
echo "Statement: if (func1 && func2)"

if (func1 && func2);
then
  # print statement
  echo "True" 
else
  # print statement
  echo "False"
fi

# print statement
echo
echo "Statement: if (func2 && func1)"

if (func2 && func1)
then
  # print statement
  echo "True"
else
  # print statement
  echo "False"
fi

