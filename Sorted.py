import time
import random

# Generar un vector aleatorio con 10000 elementos
vector = [random.randint(1, 1000000) for _ in range(1000000)]

# Medir el tiempo de ejecución de la funcion sort

start_time = time.time()
vectorOrdenado = sorted(vector)
end_time = time.time()

print("El vector ordenado:")
print(vectorOrdenado[:10])  # Imprimir solo los primeros 10 elementos
print("Tiempo de ejecución (segundos):", end_time - start_time)
