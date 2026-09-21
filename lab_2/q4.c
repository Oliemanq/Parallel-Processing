#include <stdio.h>
#include <stdbool.h>


int maxOfThree(int a, int b, int c) {
    bool aoverc = a > c;
    bool boverc = b > c;
    bool aoverb = a > b;

    if (aoverb && aoverb) {
        return a;
    } else if (!aoverb && boverc) {
        return b;
    } else {
        return c;
    }
}

int main(int argc, char *argv) {
    int a;
    int b;
    int c;

    scanf("%d %d %d", &a, &b, &c);

    int max = maxOfThree(a, b, c);

    printf("biggest number: %d\n", max);
}