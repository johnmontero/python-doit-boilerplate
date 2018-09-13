Python DoIt Boilerplate
=========================
Aplicacion para ejecutar tareas mediante comandos 


¿Que incluye?
--------------
* source Code (directorio app)
* Dockerfile (directorio dev/Dockerfilem, latest/Dockerfile)
* Makefile

Requerimientos
--------------
* Docker
* Cmake

Ayuda
-----
* make
* make help

Comandos
--------
```console
Target           Help                                                        Usage
------           ----                                                        -----
build-last        Construir imagen para deploy                               make build-last
build             Construir imagen para development                          make build
ssh               Conectar al container por el protocolo ssh                 make ssh
venv-create       Crea el entorno virtual (virtualenv)                       make venv-create
venv-install-lib  Instala las librerias en el entorno virtual (virtualenv)   make venv-install-lib
```

Activar virtualenv
------------------
```console
~/python-doit-boilerplate$ make ssh
[root@594ea994b77f]/app# source ../venv/bin/activate
(venv) [root@594ea994b77f]/app#
```

Ejecutar
--------
Para ejeuctar do-it debe seguir los siguientes pasos:
* Ejecutar make build
* Ejecutar make build-make build-last
* Ejecutar do-it.sh
```console
~/python-doit-boilerplate$ make build-last
~/python-doit-boilerplate$ ./do-it.sh
``` 

Estructura del project
======================

Directorio de la Applicacion
-----------------------------
```console
app
├── bin
│   └── do-it
├── do_it
│   ├── __init__.py
│   ├── commands
│   │   ├── __init__.py
│   │   └── version.py
│   ├── config.yaml
│   ├── doit.py
│   └── utils
│       ├── __init__.py
│       └── config.py
├── requirements.txt
└── setup.py
```

Directorio Dockerfiles
----------------------
```console
docker
├── dev
│   └── Dockerfile
└── latest
    └── Dockerfile
```

Empezando
=========
Ejecutar los siguientes pasos:
* make build
* make venv-create
* make venv-install-lib

Agregar/Eliminar librerias
==========================
Esto se realiza en el archivo requirements.txt. Luego ejecutar el comando:

* make venv-install-lib

Agregar comandos
================
Para agregar comandos debe seguir los siguientes pasos:
* Crear un archivo dentro de la carpeta "commands"
* Escribir el codigo siguiendo la definicion de la libreria: http://click.pocoo.org/5/. 

Codigo ejemplo 
--------------

```console
import click

from do_it.doit import pass_context

@click.command()
@pass_context
def command(ctx, **kwargs):
    """Process task ... and exit."""
    print("Starting Process task...")
    ...
    ...
    ...
    print("Finishing Process task...")
```

