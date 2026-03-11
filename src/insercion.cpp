// Implementación del algoritmo de ordenación por inserción

// Compilación:
// g++ src/insercion.cpp -o bin/insercion

// Ejecución Manual:
// ./bin/insercion <semilla> <tamanio>

// Ejecución mediante script:
// ./scripts/medicion.sh bin/insercion <inicio> <fin> <incremento>

// Autor: Francisco Javier López Lozano
// Año Académico: 25/26
// Curso 2ºA
// Asignatura: Algorítmica - Grupo de Prácticas: A2

#include <iostream>
#include <ctime>
#include <vector>
#include <cstdlib>

using namespace std;

void orden_insercion(vector<int> &vct){

    int aux;
    int anterior;

    size_t tam_vector = vct.size();

    for (size_t i=1; i < tam_vector; i++){

        aux = vct[i];
        anterior = i-1;

        while (anterior >= 0 && vct[anterior] > aux){
            vct[anterior + 1] = vct[anterior];
            anterior--;
        }

        vct[anterior + 1] = aux;    
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

    orden_insercion(vector_enteros);

    tdespues = clock();

    double tiempo = (double)(tdespues - tantes) / CLOCKS_PER_SEC;

    cout << tamanio << " " << tiempo << endl;  

    return 0;
}