// compilar con g++ -std=c++11 ./src/fibonacci.cpp -o ./bin/fibonacci
// Implementacin del algoritmo de Fibonacci
// Autor: Juan Ignacio Molina Cobo

#include <cstdlib>
#include <chrono>
#include <iostream>
using namespace std;

unsigned int Fibonacci(unsigned int n){
    if (n == 0) return 0;
    else if (n == 1) return 1;
    else return Fibonacci(n-1) + Fibonacci(n-2);
}

int main(int argc, char **argv) {
    if (argc != 3) {
        cerr << "Uso: " << argv[0] << " <semilla (no usado)> <n>\n";
        return EXIT_FAILURE;
    }

    int n = atoi(argv[2]);

    std::chrono::high_resolution_clock::time_point t0, tf;
    std::chrono::duration<double> duracion;

    t0 = std::chrono::high_resolution_clock::now();
    Fibonacci(n);
    tf = std::chrono::high_resolution_clock::now();

    duracion = std::chrono::duration_cast<std::chrono::duration<double>>(tf - t0);
    
    cout << n << " " << duracion.count() << endl;

    return EXIT_SUCCESS;
}