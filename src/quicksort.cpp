// Implementación del algoritmo de ordenación por quicksort
// Autor: Iván Mestre Redondo

#include <iostream>
#include <ctime>
#include <vector>
#include <cstdlib>
#include <algorithm> // Para std::swap

using namespace std;

// Función de partición
int particion(vector<int> &vct, int bajo, int alto) {
    // Elegimos el elemento central como pivote para mayor estabilidad
    int medio = bajo + (alto - bajo) / 2;
    int pivote = vct[medio];
    
    // Movemos el pivote al final temporalmente para seguir la lógica estándar
    swap(vct[medio], vct[alto]);
    
    int i = (bajo - 1);

    for (int j = bajo; j <= alto - 1; j++) {
        if (vct[j] <= pivote) {
            i++;
            swap(vct[i], vct[j]);
        }
    }
    swap(vct[i + 1], vct[alto]);
    return (i + 1);
}

// Función recursiva Quicksort
void orden_quicksort(vector<int> &vct, int bajo, int alto) {
    if (bajo < alto) {
        int pi = particion(vct, bajo, alto);
        orden_quicksort(vct, bajo, pi - 1);
        orden_quicksort(vct, pi + 1, alto);
    }
}

int main(int argc, char *argv[]){

    if (argc < 3) {
        cerr << "Uso: " << argv[0] << " <semilla> <tamanio>" << endl;
        return 1;
    }

    // Inicializamos la semilla con el primer argumento
    srand(atoi(argv[1]));

    clock_t tantes;
    clock_t tdespues;

    vector<int> vector_enteros;
    int tamanio = atoi(argv[2]);

    // Generación estándar: valores aleatorios
    for (int i = 0; i < tamanio; i++){
        vector_enteros.push_back(rand() % tamanio + 1);         
    }

    tantes = clock();

    if (!vector_enteros.empty()) {
        orden_quicksort(vector_enteros, 0, vector_enteros.size() - 1);
    }

    tdespues = clock();

    double tiempo = (double)(tdespues - tantes) / CLOCKS_PER_SEC;

    cout << tamanio << " " << tiempo << endl;    

    return 0;
}