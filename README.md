# Configurar Proxy 

Esta guia nos permite conectarnos al repositorio de Bitbucket

## Instrucciones

* Descargar [Git](https://git-scm.com/) e instalarlo por default.
* Descargar el batch desde el siguiente [enlace](https://github.com/kaox/git_proxy/archive/master.zip) y descomprimirlo en la unidad d de nuestra computacora.
* Iniciar el Git bash y navegar hasta la carpeta descomprimida con el siguiente comando:

```
cd /d/git_proxy-master/
```

* Ejecutar el bat con el siguiente comando:

```
./proxy.bat
```

* Despues de ejecutar el bat se abrirá el navegador con el siguiente [link](https://globaldevtools.bbva.com/bitbucket/plugins/servlet/ssh/account/keys/add), pegar la llave que se genero en git el bash y presionar Add key.

```
P0XXXXX@ARQUIT13 MINGW64 ~/Documents/git
$ ./proxy.bat
Ejecutando ssh-keygen, espere y presione enter 3 veces para continuar...
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/P0XXXXX/.ssh/id_rsa):
/c/Users/P0XXXXX/.ssh/id_rsa already exists.
Overwrite (y/n)? n
Copiando archivos de configuracion
Creando config
        1 archivo(s) copiado(s).
Grabando configuracion GIT
---------------------------------------------------------------------------
Se genero la llave publica, copiela y pegala en el browser https://globaldevtools.bbva.com/bitbucket/plugins/servlet/ssh/account/keys/add
---------------------------------------------------------------------------
ssh-rsa AARHaXmf1jyUreSieDC5zfvQTFixlUp4F8H9VEkN6fAq9R3EDpQqVOv2pejabIMqXMgUCfo4XxWB3bkvrI2vMb+46Sn3HnKNTxTWo9AQqtkb9QG4wvjrfqTjqKHwFBE57z2Eh7ioF4DR4U5oJnivAbgzRJP1jJ9WcVNT7fxuSjs6IMOe3YHkMtYhA1vpMZTcR2GIHHRgm19CYQ3fTDqPFUcOTxDePTUZibfX9zhD/ P0XXXXX@ARQUITXX
---------------------------------------------------------------------------
Cierre el Git Bash y pruebe la configuracion
```

### Cambiar url de repositorio

En caso de tener nuestro repositorio apuntando a GitLab u otro repositorio, realizar los siguientes pasos:

* Nos ubicamos en la ruta donde se encuentra nuestro repositorio

```
P0XXXXX@ARQUIT13 MINGW64 /
$ cd /d/Repositorios/pic/

P0XXXXX@ARQUIT13 MINGW64 /d/Repositorios/pic (master)
$
```

* Vemos a donde esta apuntando nuestro repositorio

```
P0XXX@ARQUIT13 MINGW64 /d/Repositorios/pic (master)
$ git remote -v
origin  https://kaoxito@bitbucket.org/kaoxito/pic.git (fetch)
origin  https://kaoxito@bitbucket.org/kaoxito/pic.git (push)

```

* Cambiamos la dirección del repositorio con el siguiente comando, no se olviden de copiar su conexión ssh del repositorio desde el bitbucket.

```
$ git remote set-url origin ssh://git@globaldevtools.bbva.com:7999/cbs_bhs_bs/digital-workplace.git

```