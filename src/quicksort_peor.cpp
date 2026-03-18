// Implementación del algoritmo de ordenación por quicksort (peor caso)
// Autor: Iván Mestre Redondo


#include <iostream>
#include <ctime>
#include <vector>
#include <cstdlib>
#include <algorithm> // Para std::swap

using namespace std;

// Función de partición: El corazón de Quicksort
int particion(vector<int> &vct, int bajo, int alto) {
    int pivote = vct[alto]; // Elegimos el último elemento como pivote
    int i = (bajo - 1);    // Índice del elemento más pequeño

    for (int j = bajo; j <= alto - 1; j++) {
        // Si el elemento actual es menor o igual al pivote
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
        // pi es el índice de partición, vct[pi] ya está en su lugar
        int pi = particion(vct, bajo, alto);

        // Ordenamos los elementos antes y después de la partición
        orden_quicksort(vct, bajo, pi - 1);
        orden_quicksort(vct, pi + 1, alto);
    }
}

int main(int argc, char *argv[]){

    if (argc < 3) {
        cerr << "Uso: " << argv[0] << " <semilla> <tamanio>" << endl;
        return 1;
    }

    clock_t tantes;
    clock_t tdespues;

    vector<int> vector_enteros;
    int tamanio = atoi(argv[2]);

    // Generación del peor caso para Quicksort (orden decreciente)
    for (int i = tamanio; i >= 1; i--){
        vector_enteros.push_back(i);         
    }

    tantes = clock();

    // Llamada inicial: desde el índice 0 hasta el último
    if (!vector_enteros.empty()) {
        orden_quicksort(vector_enteros, 0, vector_enteros.size() - 1);
    }

    tdespues = clock();

    double tiempo = (double)(tdespues - tantes) / CLOCKS_PER_SEC;

    // Salida para el script de medición
    cout << tamanio << " " << tiempo << endl;    

    return 0;
}