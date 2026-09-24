#include <vector>
#include <iostream>
#include <cstdlib>
#include <cuda.h>
#include <cuda_runtime.h>

#define CUDA_CHECK(err) { \
    if (err != cudaSuccess) { \
        std::cerr << "CUDA Error: " << cudaGetErrorString(err) \
        << " at " << __FILE__ << ":" << __LINE__ << std::endl; \
        exit(EXIT_FAILURE); \
    } \
}

__global__ void add_kernel(float *d_in, float *d_out, float x) {
    d_out[threadIdx.x] = d_in[threadIdx.x] + x;
}

int main() {
    std::vector<float> h_input(8, 10.0f);
    std::vector<float> h_output(h_input.size());

    float* d_in;
    float* d_out;
    size_t bytes = h_input.size() * sizeof(float);

    CUDA_CHECK(cudaMalloc(&d_in, bytes));
    CUDA_CHECK(cudaMalloc(&d_out, bytes));
    CUDA_CHECK(cudaMemcpy(d_in, h_input.data(), bytes, cudaMemcpyHostToDevice));

    add_kernel<<<1, 8>>>(d_in, d_out, 5.0f);
    
    CUDA_CHECK(cudaGetLastError());
    CUDA_CHECK(cudaMemcpy(h_output.data(), d_out, bytes, cudaMemcpyDeviceToHost));

    bool correct = true;
    for (size_t i = 0; i < h_output.size(); ++i) {
        if (h_output[i] != h_input[i] + 5.0f) {
            correct = false;
            break;
        }
    }

    std::cout << (correct ? "Success: output is correct."
                          : "Error: output is incorrect.")
              << std::endl;

    CUDA_CHECK(cudaFree(d_in));
    CUDA_CHECK(cudaFree(d_out));
    return correct ? EXIT_SUCCESS : EXIT_FAILURE;
}