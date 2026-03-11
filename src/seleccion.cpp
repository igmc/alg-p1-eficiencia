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

    srand(time(NULL));

    clock_t tantes;
    clock_t tdespues;

    vector<int> vector_enteros;

    int tamanio_inicial = atoi(argv[1]);
    int tamanio_final = atoi(argv[2]);
    int incremento = atoi(argv[3]);

    int tamanio = tamanio_inicial;

    for (; tamanio <= tamanio_final; tamanio += incremento){
        for (size_t i=0; i < tamanio; i++){

            vector_enteros.push_back(rand() % tamanio + 1);         
        }

        tantes = clock();

        orden_seleccion(vector_enteros);

        tdespues = clock();

        double tiempo = (double)(tdespues - tantes) / CLOCKS_PER_SEC;

        cout << tamanio << " " << tiempo << endl;
        
        vector_enteros.clear();
    }

    return 0;
}