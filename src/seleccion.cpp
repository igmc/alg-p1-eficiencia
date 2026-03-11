// Implementación del algoritmo de ordenación por selección

// Compilación:
// g++ src/seleccion.cpp -o bin/seleccion

// Ejecución Manual:
// ./bin/seleccion <semilla> <tamanio>

// Ejecución mediante script:
// ./scripts/medicion.sh bin/seleccion <inicio> <fin> <incremento>

// Autor: Francisco Javier López Lozano
// Año Académico: 25/26
// Curso 2ºA
// Asignatura: Algorítmica - Grupo de Prácticas: A2

#include <iostream>
#include <ctime>
#include <vector>
#include <cstdlib>

using namespace std;

void orden_seleccion(vector<int> &vct){

    size_t tam_vector = vct.size();

    for (size_t i=0; i < tam_vector-1; i++){
        
        size_t menor = i;

        for (size_t j = i+1; j < tam_vector; j++){
            if (vct[j] < vct[menor]){
                menor = j;
            }
        }

        if (menor != i){
            int aux = vct[i];
            vct[i] = vct[menor];
            vct[menor] = aux;
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

    orden_seleccion(vector_enteros);

    tdespues = clock();

    double tiempo = (double)(tdespues - tantes) / CLOCKS_PER_SEC;

    cout << tamanio << " " << tiempo << endl;    

    return 0;
}