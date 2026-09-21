#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("No command-line arguments passed.\n");
    }
    else {
        float tempIn = atof(argv[1]);

        float tempCel = 0.55 * (tempIn - 32);
        printf("%.2f\n", tempCel);
    }
    return 0;
}