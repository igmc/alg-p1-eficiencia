# Práctica 1 - Análisis de eficiencia de algoritmos
Algorítmica ~ Grupo A2

## Autores
(quiénes somoss)

## Algoritmos
Hemos trabajado los siguientes algoritmos:
* Ordenación por inserción (O(n^2))
* Ordenación por selección (O(n^2))
* Ordenación por burbuja (O(n^2))
* Ordenación por Shellsort (O(n^2))
* Ordenación por Heapsort (O(n log n))
* Ordenación por Quicksort (O(n log n), peor caso O(n^2))
* Fibonacci (O(phi^n))
* Torres de Hanoi (O(2^n))

## Entorno de compilación
(en qué ordenador hemos medido tiempos)

## Estructura del repositorio

src/        Implementación de los algoritmos en C++
scripts/    Scripts de medición y graficado
data/       Datos empíricos generados
figures/    Gráficas generadas
memoria/    Memoria final de la práctica

## Cómo reproducir los resultados
### 1. Compilación
`make all` para compilar todos los ficheros.
### 2. Generación de datos empíricos 
```./scripts/medicion.sh``` ejecuta alguno de los programas y graba los datos en la carpeta data. Acepta los siguientes parámetros:
* **programa**: programa a ejecutar (ej: ./bin/burbuja)
* **inicio**: inicio del intervalo de valores a dar
* **fin**: final del intervalo de valores a dar
* **incremento**: diferencia entre número de elementos ejecutados

### 3. Creación de gráficas y ajuste híbrido
(.sh de gnuplot)

## Notas
