# Parte 1 Algoritmos, Programación Orientada a Objetos
# 1
``` python
import numpy as np 
def RetornarLetraFaltanteDelAlfabeto(cadena):
  BitsAlfabeto = np.array([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
  for x in range(len(cadena)):
    if cadena[x] >= 'a' and cadena[x] <= 'z':
      BitsAlfabeto[ord(cadena[x])-97] = BitsAlfabeto[ord(cadena[x])-97] + 1
  for x in range(26):
    if BitsAlfabeto[x] == 0:
      return chr(x + 97)     

cadena = "the quick brown box jumps over a lazy dog"
RetornarLetraFaltanteDelAlfabeto(cadena)
# 97 equivale 'a' - 122 equivale a 'z', 32 equivale a espacio
# Si el elemento del array en la posicion j es 0 al final del ciclo for entonces ese letra es la que falta
```

![Captura de la ejecución del código](Imágenes/PC2Imagen1.png)

El código consta de una función que devuelve la letra del alfabeto que falta en un cadena que recibe como entrada, el array BitsAlfabeto es de tamaño 26 (se toma en cuenta las letras del alfabeto inglés) cuyos elementos son 0 (en este arreglo se contabilizará la veces que aparece alguna letra del alfabeto en la cadena de entrada con la ayuda del primer bucle for). El 2do bucle for buscará cuál de elementos del array BitsAlfabeto permaneció en 0, esto significa que el elemento en dicha posición es la letra faltante en la cadena de entrada. 

