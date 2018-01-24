@ECHO OFF
@title Crear llave Publica y configurar git con el proxy

echo Ejecutando ssh-keygen, espere y presione enter 3 veces para continuar...
ssh-keygen

echo Copiando archivos de configuracion
if not exist "C:\Users\%username%\AppData\Local\Programs\Git" (
	REM Git instalado com administrador
	MKDIR "C:\Users\%username%\AppData\Local\Programs\Git"
	XCOPY "C:\Program Files\Git\*" "C:\Users\%username%\AppData\Local\Programs\Git" /E
)

echo Creando config
(
	echo ProxyCommand /C/Users/%username%/AppData/Local/Programs/Git/mingw64/bin/connect.exe -S 118.180.54.169:1080 %h %p
	echo Host globaldevtools
	echo User git
	echo Port 7999
	echo Hostname 54.171.30.16
	echo IdentityFile ~/.ssh/id_rsa
	echo TCPKeepAlive yes
	echo IdentitiesOnly yes
) > "C:\Users\%username%\.ssh\config"
COPY .bashrc "C:\Users\%username%\"

echo Grabando configuracion GIT
git config --global http.sslVerify false
git config --global http.proxy http://%username%@118.180.54.170:8080

echo ---------------------------------------------------------------------------
echo Se genero la llave publica, copiela y pegala en el browser https://globaldevtools.bbva.com/bitbucket/plugins/servlet/ssh/account/keys/add
echo ---------------------------------------------------------------------------
cat ~/.ssh/id_rsa.pub
echo ---------------------------------------------------------------------------
start chrome https://globaldevtools.bbva.com/bitbucket/plugins/servlet/ssh/account/keys/add 

echo Cierre el Git Bash y pruebe la configuracion

pause
exit