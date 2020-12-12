// Xiana Lara
// September 1st 2020
// Programming #1
// input: N/A
// output: print statements containing  
// my name and memory allocations
#include <stdio.h>

int main(){

    int arr[4];
    char *S;

    // Name: Xiana Lara
    // Xian
    arr[0] = (88 + (105 * 256) + (97 * 256 * 256) + (110 * 256 * 256 * 256));
    // a_La
    arr[1] = (97 + (32 * 256) + (76 * 256 * 256) + (97 * 256 * 256* 256));
    // ra and ending final integer with a 0
    arr[2] = (114 + (97 * 256) + 0);

    S = (char*)arr; 
    printf("My name is %s \n", S);

    // Name: Xiana Lara
    // Xian
    arr[0] = (88 + (105 * 256) + (97 * 256 * 256) + (110 * 256 * 256 * 256));
    // a_La
    arr[1] = (97 + (32 * 256) + (76 * 256 * 256) + (97 * 256 * 256* 256));
    // ra and ending final integer with a 0
    arr[2] = (114 + (97 * 256));
    arr[3] = 0;
   
    S = (char*)arr; 
    printf("My name is %s \n", S);

} // of main