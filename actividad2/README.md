# ACTIVIDAD 2
Ana Belén Contreras Orozco 201901604

## Explicación del script:
Indica que el script debe ser interpretado por el intérprete de comandos "bash"
`#!/bin/bash`

El valor ingresado se almacenará en la variable *GITHUB_USER*.
`rread -p "Ingresa el nombre de usuario de GitHub: " GITHUB_USER`

Se realiza una solicitud HTTP GET a la API de GitHub. El resultado de la solicitud se almacena en la variable *response*.
`response=$(curl -s "https://api.github.com/users/$GITHUB_USER")`

Estas dos líneas usan el comando *echo* para enviar el contenido de la variable response a la herramienta *jq*. Las expresiones *.id* y *.created_at* especifican qué valores deben extraerse del JSON. Los resultados se almacenan en las variables *user_id* y *created_at*, respectivamente.
`user_id=$(echo "$response" | jq -r '.id')`
`created_at=$(echo "$response" | jq -r '.created_at')`


Se imprime un mensaje en la pantalla que contiene los valores obtenidos del JSON y almacenados en las variables *GITHUB_USER*, *user_id* y *created_at*.
`echo "Hola $GITHUB_USER. User ID: $user_id. Cuenta fue creada el: $created_at."`


Se utiliza el comando *date* para obtener la fecha actual en el formato *"año mes día"*. Luego, se crea el directorio temporal
`fecha=$(date +"%Y%m%d")`
`log_directory="/tmp/$fecha"`
`mkdir -p "$log_directory"`

Se crea un archivo de log llamado saludos.log dentro del directorio temporal. El mensaje que se imprimió anteriormente se redirige hacia este archivo y se guarda en él.
`log_file="$log_directory/saludos.log"`
`echo "Hola $GITHUB_USER. User ID: $user_id. Cuenta fue creada el: $created_at." > "$log_file"`
