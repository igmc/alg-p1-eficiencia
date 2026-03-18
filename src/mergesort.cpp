// Implementación del algoritmo de ordenación por mergesort
// Autor: Enrique Martos Molina

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// [cite: 1, 2] - Basado en tu función de mezcla
void fusionaMS(int *v, int posIni, int centro, int posFin, int *vaux) {
    int i = posIni; // [cite: 1]
    int j = centro; // [cite: 1]
    int k = 0;      // [cite: 2]
    
    // [cite: 2, 3] - Comparación y mezcla de sub-arreglos
    while (i < centro && j <= posFin) {
        if (v[i] <= v[j]) {
            vaux[k] = v[i];
            i++; // [cite: 3]
        } else {
            vaux[k] = v[j];
            j++; // [cite: 3]
        }
        k++; // [cite: 3]
    }

    // [cite: 4, 5] - Copia de elementos restantes
    while (i < centro) {
        vaux[k] = v[i];
        i++, k++; // [cite: 4]
    }
    while (j <= posFin) {
        vaux[k] = v[j];
        j++, k++; // [cite: 5]
    }

    //  - Transferencia del auxiliar al arreglo original
    memcpy(v + posIni, vaux, k * sizeof(int));
}

// [cite: 6, 7, 8] - Función recursiva Mergesort
void Mergesort(int *v, int posIni, int posFin, int *vaux) {
    if (posIni >= posFin) return; // 
    
    int centro = (posIni + posFin) / 2; // 
    
    // Corregido: Llamadas recursivas con el nombre correcto de la función
    Mergesort(v, posIni, centro, vaux); // 
    Mergesort(v, centro + 1, posFin, vaux); // 
    
    //  - Mezcla de las partes procesadas
    fusionaMS(v, posIni, centro + 1, posFin, vaux); 
}

int main(int argc, char **argv) {
    //long min = 500000;
    //long max = 5000000;
    //long salto = 100000;

    //printf("Iniciando pruebas de rendimiento (MergeSort)...\n");
    //printf("--------------------------------------------------\n");
    //printf("%-15s | %-15s\n", "Elementos", "Tiempo (s)");
    //printf("--------------------------------------------------\n");
    long n = atoi(argv[2]);
    //for (long n = min; n <= max; n += salto) {
        // Asignación de memoria para el tamaño actual
        int *v = (int *)malloc(n * sizeof(int));
        int *vaux = (int *)malloc(n * sizeof(int));

        if (v == NULL || vaux == NULL) {
            printf("Error: Memoria insuficiente para n = %ld\n", n);
            return 1;
        }

        // Llenado con datos aleatorios
        for (long i = 0; i < n; i++) v[i] = rand();

        // Medición de tiempo
        clock_t start = clock();
        Mergesort(v, 0, n - 1, vaux);
        clock_t end = clock();

        double tiempo = (double)(end - start) / CLOCKS_PER_SEC;

        printf("%ld %f\n", n, tiempo);

        // Liberar memoria en cada iteración para evitar fugas
        free(v);
        free(vaux);
    //}

    //printf("--------------------------------------------------\n");
    //printf("Pruebas finalizadas.\n");

    return 0;
}
