#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool isPrime(int in) {
    if (in <= 1) { return false; }

    if (in == 2) { return true; }

    if (in % 2 == 0) { return false; }

    for (int i = 3; i * i <= in; i += 2) {
        if (in % i == 0) {
            return false;
        }
    }
    return true;
}

int countPrimes(const int *arr, int size) {
    int count = 0;
    for (int i = 0; i < size; i++) {
        if (isPrime(arr[i])) { count++; }
    }
    return count;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("No command-line arguments passed.\n");
    }

    int arg = atof(argv[1]);
    
    if (argv[1] > 0) {
        int *ptr = (int *)malloc((size_t)arg * sizeof(int));        
        int primeCounter = 0;

        if (ptr == NULL) {
            printf("malloc failed");
            return 1;
        }
        
        for (int i = 0; i < arg; i++) {
            ptr[i] = rand();
        }

        printf("Generated array:\n[ ");
        for (int i = 0; i < arg; i++) {
            printf("%d ", ptr[i]);
        }
        printf("]\n");
        

        int primeCount = countPrimes(ptr, (int)arg);
        printf("print count: %d\n", primeCount);

        free(ptr);

    } else {
        printf("Must be positive");
    }
}