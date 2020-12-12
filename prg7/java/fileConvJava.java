// Xiana Lara
// 11/2/2020
// The given data has been through a "backup" program which added extraneous data.
// Corrupt data ALWAYS starts with a CONTROL-C and always ends in a CONTROL-B
// This PERL program removes these values
// Input: Corrupt Data - control-char.txt
// Output: Clean Data - java-control-char.txt

import java.io.*;
import java.util.*;

 public class fileConvJava{

    public static void main (String args[])throws FileNotFoundException, IOException{

        // file path
        String filePath = "control-char.txt";

        File ogFile = new File(filePath);
        FileReader fRead = new FileReader(ogFile);
        BufferedReader buffRead = new BufferedReader(fRead);

        File fixedFile = new File("java-control-char.txt");
        fixedFile.createNewFile();
        FileWriter writeFile = new FileWriter("java-control-char.txt");

        // buffer
        int buff = 0;

        // if Ctrl+C was initialized
        boolean flag = true; 

        while((buff = buffRead.read()) != -1){
            
            // crtl-c
            if(buff == 0x03){
               flag = false;
            }
            
            if(flag){
                char tempChar = (char) buff;
                writeFile.write(tempChar);
            }
            
            // ctrl-b
            if(buff == 0x02){
                flag = true;
            }

        }// of while
        
        writeFile.close();

    }// of main

 }//of class