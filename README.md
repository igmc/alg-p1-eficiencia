# Práctica 1 — Análisis de eficiencia de algoritmos
**Algorítmica · Subgrupo A2 · Grado en Ingeniería Informática · Universidad de Granada**

## Autores
* López Lozano, Francisco Javier
* Martos Molina, Enrique
* Mestre Redondo, Iván
* Molina Cobo, Juan Ignacio

## Algoritmos implementados
| Algoritmo | Eficiencia teórica |
|---|---|
| Inserción, Selección, Burbuja, Shellsort | O(n²) |
| Mergesort, Heapsort, Quicksort | O(n log n) / O(n²) peor caso |
| Fibonacci | O(φⁿ), φ ≈ 1.618 |
| Torres de Hanoi | O(2ⁿ) |

## Entorno de compilación
Las mediciones se han realizado sobre Apple M2, 8 núcleos, 3.5 GHz, 8 GB RAM, macOS 26.3.1 Tahoe, compilando con `g++ -std=c++11 -O0`.

## Estructura del repositorio
```
src/        Implementaciones en C++
bin/        Ejecutables compilados
scripts/    Scripts de medición y graficado (shell + gnuplot)
data/       Datos empíricos generados (.dat)
figures/    Gráficas generadas (.pdf)
memoria/    Memoria final de la práctica (.tex + .pdf)
```

## Cómo reproducir los resultados

### 1. Compilación
```bash
make all
```
### 2. Toma de mediciones
Los scripts de recogida lanzan automáticamente todos los algoritmos de cada grupo:
```bash
./scripts/recoger_cuadratico.sh
./scripts/recoger_logaritmico.sh
./scripts/recoger_exponencial.sh
./scripts/medicion_nlog_pequena.sh
```
También se puede lanzar todo de una vez con:
```bash
./scripts/lanzar_mediciones.sh
```
### 3. Generación de gráficas y ajuste híbrido
```bash
./scripts/graficar.sh
```
Esto ejecuta todos los scripts gnuplot en `scripts/` y deposita las gráficas en `figures/`. Los parámetros de ajuste híbrido se exportan automáticamente a `memoria/params_*.tex`.

### 4. Compilación de la memoria
```bash
cd memoria && latexmk -pdf memoria.tex
```