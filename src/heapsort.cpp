// Implementación del algoritmo de ordenación por heapsort
// Autor: Enrique Martos Molina

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Función para mantener la propiedad de montículo (heapify)
void amontonar(int *v, int n, int i) {
    int mayor = i; 
    int izq = 2 * i + 1; 
    int der = 2 * i + 2; 

    // Si el hijo izquierdo es más grande que la raíz
    if (izq < n && v[izq] > v[mayor])
        mayor = izq;

    // Si el hijo derecho es más grande que el más grande hasta ahora
    if (der < n && v[der] > v[mayor])
        mayor = der;

    // Si el mayor no es la raíz, intercambiamos y seguimos amontonando
    if (mayor != i) {
        int intercambio = v[i];
        v[i] = v[mayor];
        v[mayor] = intercambio;

        // Llamada recursiva para asegurar la propiedad en el subárbol
        amontonar(v, n, mayor);
    }
}

// Función principal de HeapSort
void Heapsort(int *v, int n) {
    // 1. Construir el montículo (reordenar el arreglo)
    for (int i = n / 2 - 1; i >= 0; i--)
        amontonar(v, n, i);

    // 2. Extraer elementos uno a uno del montículo
    for (int i = n - 1; i > 0; i--) {
        // Movemos la raíz actual al final
        int temp = v[0];
        v[0] = v[i];
        v[i] = temp;

        // Llamamos a amontonar en el montículo reducido
        amontonar(v, i, 0);
    }
}

int main(int argc, char **argv) {
    //long min = 500000;
    //long max = 5000000;
    //long salto = 100000;

    //printf("Iniciando pruebas de rendimiento (HeapSort)...\n");
    //printf("------------------------------------------\n");
    //printf("%-15s | %-15s\n", "Elementos", "Tiempo (s)");
    //printf("------------------------------------------\n");

    long n = atoi(argv[2]);
    //for (long n = min; n <= max; n += salto) {
        // Asignación de memoria
        int *v = (int *)malloc(n * sizeof(int));
        if (v == NULL) {
            printf("Error de memoria en n = %ld\n", n);
            return 1;
        }

        // Llenado con datos aleatorios
        for (long i = 0; i < n; i++) {
            v[i] = rand();
        }

        // Medición de tiempo
        clock_t start = clock();
        Heapsort(v, n);
        clock_t end = clock();

        double tiempo = (double)(end - start) / CLOCKS_PER_SEC;

        printf("%ld %f\n", n, tiempo);

        // Liberar memoria
        free(v);
    //}

    //printf("------------------------------------------\n");
    //printf("Pruebas finalizadas.\n");

    return 0;
}
