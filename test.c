#include <stdio.h>

int functionOne() {
    return 1;
}

int main(int argc, char* argv[]) { //argc takes number of arguments, argv holds the arguments
    printf("Hello world!\n");

    float f = 1232341234759837451.1f;

    int sizeOfF = sizeof(f);

    printf("Size of float is %d\n", sizeOfF);
    printf("float is %f\n", f);

    int functionVal = functionOne();
    printf("%f", functionVal);

    printf("changing stuff");
}
