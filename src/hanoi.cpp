// compilar con g++ -std=c++11 ./src/hanoi.cpp -o ./bin/hanoi
// Implementacin del algoritmo de las Torres de Hanoi
// Autor: Juan Ignacio Molina Cobo

#include <cstdlib>
#include <chrono>
#include <iostream>
#include <stack>

using namespace std;

void Hanoi(unsigned int n,
           stack<int> &origen,
           stack<int> &destino,
           stack<int> &auxiliar) {

    unsigned int aux;

    if (n == 1) {
        aux = origen.top();
        origen.pop();
        destino.push(aux);
        return;
    } else {
        Hanoi(n - 1, origen, auxiliar, destino);
        Hanoi(1, origen, destino, auxiliar);
        Hanoi(n - 1, auxiliar, destino, origen);
    }
}


int main(int argc, char **argv) {
    if (argc != 3) {
        cerr << "Uso: " << argv[0] << " <semilla (no usado)> <n>\n";
        return EXIT_FAILURE;
    }

    int n = atoi(argv[2]);
    stack<int> origen, destino, auxiliar;
    for (unsigned int i = n; i > 0; i--){ origen.push(i); }
    
    std::chrono::high_resolution_clock::time_point t0, tf;
    std::chrono::duration<double> duracion;

    t0 = std::chrono::high_resolution_clock::now();
    Hanoi(n, origen, destino, auxiliar);
    tf = std::chrono::high_resolution_clock::now();

    duracion = std::chrono::duration_cast<std::chrono::duration<double>>(tf - t0);
    cout << n << " " << duracion.count() << endl;

    return EXIT_SUCCESS;

}