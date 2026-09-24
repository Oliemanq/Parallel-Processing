#include <stdio.h>
#include <cuda.h>


__global__ void Hello(void) {
    printf("Hello from thread %d in block %d\n", threadIdx.x, blockIdx.x);
}

int main(int argc, char* argv[]) {
    int blk_ct, th_per_blk;

    blk_ct = strtol(argv[1], NULL, 10);
    th_per_blk = strtol(argv[2], NULL, 10);

    Hello <<<blk_ct, th_per_blk>>>();

    cudaDeviceSynchronize();

    return 0;
}