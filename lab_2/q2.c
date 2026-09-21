#include <stdio.h>


void doubleAnInt(int* numIn) {
    *numIn = *numIn * 2;
}

int main(int argc, char *argv[]) {
    int my_num = 20;
    doubleAnInt(&my_num);
    printf("%d\n", my_num);

    int my_num2 = 7;
    doubleAnInt(&my_num2);
    printf("%d\n", my_num2);
}