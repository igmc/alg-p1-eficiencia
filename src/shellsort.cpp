// Implementación del algoritmo de ordenación por shellsort

// Compilación:
// g++ src/shellsort.cpp -o bin/shellsort

// Ejecución Manual:
// ./bin/shellsort <semilla> <tamanio>

// Ejecución mediante script:
// ./scripts/medicion.sh bin/shellsort <inicio> <fin> <incremento>

// Autor: Francisco Javier López Lozano
// Año Académico: 25/26
// Curso 2ºA
// Asignatura: Algorítmica - Grupo de Prácticas: A2

#include <iostream>
#include <ctime>
#include <vector>
#include <cstdlib>

using namespace std;

void orden_shellsort(vector<int> &vct){

    size_t tam_vector = vct.size();

    for (size_t gap = tam_vector/2; gap > 0; gap /=2){

        for (size_t i = gap; i < tam_vector; i++){

            int temp = vct[i];
            size_t j = i;

            while (j >= gap && vct[j-gap] > temp){
                vct[j] = vct[j-gap];
                j -= gap;
            }

            vct[j] = temp;
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

    orden_shellsort(vector_enteros);

    tdespues = clock();

    double tiempo = (double)(tdespues - tantes) / CLOCKS_PER_SEC;

    cout << tamanio << " " << tiempo << endl;    

    return 0;
}