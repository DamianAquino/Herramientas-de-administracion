#!/bin/bash

mostrar_estado() {
    sudo systemctl status mysql | grep "Active:" | awk '{print $2, $3}'
}

activar_mysql() {
    sudo systemctl start mysql
    echo "MySQL ha sido activado."
}

desactivar_mysql() {
    sudo systemctl stop mysql
    echo "MySQL ha sido desactivado."
}

estado=$(sudo systemctl is-active mysql)

echo "Estado actual de MySQL: $(mostrar_estado)"

read -p "¿Deseas activar o desactivar MySQL? (activar/desactivar): " accion

case $accion in
    activar)
        if [ "$estado" = "active" ]; then
            echo "MySQL ya está activado."
        else
            activar_mysql
        fi
        ;;
    desactivar)
        if [ "$estado" = "inactive" ]; then
            echo "MySQL ya está desactivado."
        else
            desactivar_mysql
        fi
        ;;
    *)
        echo "Opción no válida. Usa 'activar' o 'desactivar'."
        ;;
esac

echo "Nuevo estado de MySQL: $(mostrar_estado)"
