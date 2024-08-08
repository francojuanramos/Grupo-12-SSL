import time
import random

# Generar un vector aleatorio con 10,000 elementos
vector = [random.randint(1, 10000) for _ in range(10000)]

def ordenamiento_burbuja(vec):
    n = len(vec)
    for i in range(n):
        for j in range(0, n-i-1):
            if vec[j] > vec[j+1]:
                vec[j], vec[j+1] = vec[j+1], vec[j]

# Medir el tiempo de ejecución del ordenamiento de burbuja
tiempo_inicio = time.time()
ordenamiento_burbuja(vector)
tiempo_fin = time.time()

print("El vector ordenado:")
print(vector[:10])  # Imprimir solo los primeros 10 elementos
print("Tiempo de ejecución (segundos):", tiempo_fin - tiempo_inicio)
