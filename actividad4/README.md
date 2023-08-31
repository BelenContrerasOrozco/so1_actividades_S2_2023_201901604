# ACTIVIDAD 4

**Paso 1: Crea el script**
Primero, se creo el script llamado 'saludo.sh' que imprimirá el saludo y la fecha actual.
```
#!/bin/bash
while true; do
    echo "-----------------------------"
    echo "Actividad 4"
    echo "Hola Mundo. Hoy es $(date +%Y/%m/%d)"
    sleep 5
done
```

**Paso 2: Crear el archivo del servicio systemd**
Se creo un archivo llamado hola.service en la carpeta /etc/systemd/system/ con permisos de superusuario.
```
[Unit]
Description=Script para imprimir saludo y fecha actual

[Service]
Type=simple
ExecStart=/home/belenco/Documentos/GitHub/so1_actividades_201901604/actividad4/saludo.sh

[Install]
WantedBy=multi-user.target
```

**Paso 3: Habilitar y ejecutar el servicio**
Luego de crear el archivo del servicio, se deben habilitar y ejecutar el servicio con los siguientes comandos:
```
sudo systemctl daemon-reload
sudo systemctl enable hola.service
sudo systemctl start hola.service
```

El servicio se iniciará y ejecutará el script. Se puede verificar el estado del servicio con:

`sudo systemctl status hola.service`
