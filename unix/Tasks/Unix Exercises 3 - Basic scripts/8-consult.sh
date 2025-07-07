#!/bin/bash

# Ejercicio 8 - consulta.sh
# -------------------------
# Este script recibe tres parámetros:
#   1. Un directorio a analizar (el directorio raíz).
#   2. El número de días de antigüedad que debe tener un fichero
#      para ser considerado (debe estar entre 2 y 100 días).
#   3. Un fichero donde se guardarán las primeras 10 líneas de los archivos.
#
# 1. Verifica que se hayan pasado los tres parámetros obligatorios.
#    - Si falta alguno, muestra la sintaxis correcta y solicita el parámetro faltante por teclado.
#
# 2. Verifica que el directorio indicado existe y que el número de días está entre [2-100].
#
# 3. Recorre de manera recursiva todos los subdirectorios del directorio dado.
#    - Para cada subdirectorio, verifica si tiene una antigüedad superior al número de días especificado.
#    - Si la antigüedad es mayor, llama al script `guardalineas.sh` para que pregunte si se desean guardar
#      las 10 primeras líneas del archivo en el fichero destino.
#
# Ejemplo de uso:
#   ./consulta.sh directorio 8 FicheroLineas
