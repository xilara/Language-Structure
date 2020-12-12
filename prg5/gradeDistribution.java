/* 
* Xiana Lara
* October 6th, 2020
* Programming 5: Exception Handling in JAVA

* Purpose: This program is based off the ada code grade_distribution.adb.
* In my java version, I changed the second half of the first loop so that
* all assignments to "Freq()" are updated in the Exception portion 

* Input: Grades in the form of integers in the range of [0 - 100] using 
* -1 to end the loop
* Output: number limits and frequency of numbers within those limits 
*/

import java.util.*;

class gradeDistribution{

    public static void main(String[] args){
        
        int freq[] = new int [10];
        int newGrade, index, lim1, lim2; 

        try{
            throw new Exception("Error has occurred");
        } // of try

        catch(Exception e){
            
			System.out.println("Enter Grade [0-100]: ");
            System.out.println("-1 to exit loop");
            
            Scanner scnr = new Scanner(System.in);
            newGrade = scnr.nextInt();

            while(newGrade >= 0){
                
                index = newGrade/10;

                if(newGrade < 100){
                   freq[index] = freq[index] + 1;
                }// of if
                else if(newGrade == 100){
                    freq[index - 1] = freq[index - 1] + 1;
                }// of else if 
                else{
                    System.out.println("Error: " + newGrade + " not in range");
                }// of else

                newGrade = scnr.nextInt();
            
            }// of while

        }// of catch
            
        System.out.println("   Limits\tFrequency");

        for(int i = 0; i < 10; i++){
            
            lim1 = 10 * i;
    		lim2 = lim1 + 9;

    		if(i == 9){
    		   lim2 = 100;
    		}// end if

    		System.out.printf("%2d\t%3d\t\t%d\n", lim1, lim2, freq[i]);
           
        }// end for
    
    }// of main

}// of class