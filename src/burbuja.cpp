// Implementación del algoritmo de ordenación por burbuja

// Compilación:
// g++ src/burbuja.cpp -o bin/burbuja

// Ejecución Manual:
// ./bin/burbuja <semilla> <tamanio>

// Ejecución mediante script:
// ./scripts/medicion.sh bin/burbuja <inicio> <fin> <incremento>

// Autor: Francisco Javier López Lozano
// Año Académico: 25/26
// Curso 2ºA
// Asignatura: Algorítmica - Grupo de Prácticas: A2

#include <iostream>
#include <ctime>
#include <vector>
#include <cstdlib>

using namespace std;

void orden_burbuja(vector<int> &vct){

    int aux;

    size_t tam_vector = vct.size();

    for (size_t i=0; i < tam_vector-1; i++){
        for(size_t j=0; j < tam_vector-i-1; j++){

            if (vct[j] > vct[j+1]){
                aux = vct[j];
                vct[j] = vct[j+1];
                vct[j+1] = aux;
            }
        }
    }
}

int main(int argc, char *argv[]){

    srand(atoi(argv[1]));

    clock_t tantes;
    clock_t tdespues;

    vector<int> vector_enteros;

    int tamanio = atoi(argv[2]);

    for (size_t i=0; i < tamanio; i++){

        vector_enteros.push_back(rand() % tamanio + 1);         
    }

    tantes = clock();

    orden_burbuja(vector_enteros);

    tdespues = clock();

    double tiempo = (double)(tdespues - tantes) / CLOCKS_PER_SEC;

    cout << tamanio << " " << tiempo << endl;    

    return 0;
}