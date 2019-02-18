#include <stdio.h>

unsigned long long int exponential(int i){
    if(i != 1)
        return 2 * exponential(i - 1);  //multiply by two the last result
    else
        return 2;   //base two
}

int main(){
    int i = 50;     //exponent
    
    printf("%llu\n", exponential(i));
    
    return 0;
}
