// Xiana Lara
// September 1st 2020
// Programming #1
// input: N/A
// output: memory addresses 

#include <stdio.h>

int main(){

    int arr[3];
    char *S;

    printf("\nArray address: %u\n", &arr);
    printf("Pointer address: %u\n\n", &S);

    static int statArr[3];
    printf("\nStatic array address: %u\n", statArr);

} // of main