#!/bin/bash

# Ejercicio 7 - guardalineas.sh
# ------------------------------
# Script que recibe dos parámetros:
#   1. Un directorio que contiene archivos.
#   2. Un fichero donde opcionalmente se guardarán líneas.
#
# Para cada fichero en el directorio dado:
#   - Muestra su nombre y sus primeras 10 líneas por pantalla.
#   - Pregunta al usuario si desea añadir esas 10 líneas
#     al final del fichero destino.
#   - Si el usuario acepta, las líneas se añaden; si no, se omite.
#
# Ejemplo de uso:
#   ./guardalineas.sh directorio FicheroLineas
