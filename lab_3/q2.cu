#include <stdio.h>
#include <fstream>
#include <iostream>
#include <vector>


float get_element(const std::vector<float>&vec, int cols, int r, int c) {
    return vec[r * cols + c];
};

void print_2d_coord(int idx, int cols) {
    int row = idx/cols;
    int col = idx % cols;
    printf("requested x,y pair: (%i,%i)\n", row, col);
};


int main(int argc, char* argv[]) {
    std::ifstream inputfile("matrix_data.txt");

    if (!inputfile.is_open()) {
        std::cerr << "Error: Could not open the file!" << std::endl;
        return 1;
    }

    int rows;
    int cols;

    inputfile >> rows >> cols;

    std::vector<float> matrix(rows * cols);

    for (int i = 0; i < rows * cols; ++i) {
        if (!(inputfile >> matrix[i])) {
            std::cerr << "Error: Not enough matrix values\n";
            return 1;
        }
    }

    std::cout << "Rows: " << rows << '\n';
    std::cout << "Columns: " << cols << '\n';

    printf("requested element at (2,3): %f\n", get_element(matrix, cols, 2, 3));

    printf("requested coordinate pair for index 14: ");
    print_2d_coord(14, cols);

    return 0;
}