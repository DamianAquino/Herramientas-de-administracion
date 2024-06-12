#!/usr/bin/bash

# Recibe como argumento el nombre de la interfaz de red
interfaz=$1

if [ $# -eq 0 ]; then
        echo "Error de parametros."
        exit 1
fi

# Verificar si el usuario tiene privilegios de superusuario
if [ "$(id -u)" != "0" ]; then
   echo "Este script debe ser ejecutado como root"
   exit 1
fi

# Apagar interfaz
sal=$(ifconfig $interfaz down)
echo "$sal"

# Cambiar MAC
sal=$(macchanger $interfaz -r)
echo "MAC Cambiada."

# Encender interfaz
sal=$(ifconfig $interfaz up)
echo "$sal"
