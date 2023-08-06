#!/bin/bash

# Leer la variable GITHUB_USER
echo "---------- Actividad 2 ----------"
echo "---------- 201901604 ----------"
read -p "Ingresa el nombre de usuario de GitHub: " GITHUB_USER

# Consultar la URL y almacenar la respuesta JSON en una variable
response=$(curl -s "https://api.github.com/users/$GITHUB_USER")

# Extraer los datos del JSON usando la herramienta jq
user_id=$(echo "$response" | jq -r '.id')
created_at=$(echo "$response" | jq -r '.created_at')

# Imprimir el mensaje
echo "Hola $GITHUB_USER. User ID: $user_id. Cuenta fue creada el: $created_at."

# Crear el directorio /tmp/<fecha> si no existe
fecha=$(date +"%Y%m%d")
log_directory="/tmp/$fecha"
mkdir -p "$log_directory"

# Crear el archivo de log en /tmp/<fecha>/saludos.log
log_file="$log_directory/saludos.log"
echo "Hola $GITHUB_USER. User ID: $user_id. Cuenta fue creada el: $created_at." > "$log_file"

