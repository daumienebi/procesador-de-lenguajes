#!/bin/bash

#Pedir nombre fichero
echo "Introduce el nombre del fichero flex para compilar y ejecutarlo"
read fichero

echo "Generando lex.yy.c para $fichero ..."

#flex $fichero
flex $fichero

echo "Generando fichero de salida..."
gcc lex.yy.c -o salida -lfl

echo "Ejecutando salida..."
echo "--------------"
echo "    SALIDA :  "
echo "--------------"

./salida texto.txt
