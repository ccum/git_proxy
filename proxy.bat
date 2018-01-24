@ECHO OFF
@title Crear llave Publica y configurar git con el proxy

echo Ejecutando ssh-keygen, espere y presione enter 3 veces para continuar...
ssh-keygen
echo ---------------------------------------------------------------------------
echo Se genero la llave pública, copiela y pegala en el brwoser https://globaldevtools.bbva.com/bitbucket/plugins/servlet/ssh/account/keys
echo ---------------------------------------------------------------------------
cat ~/.ssh/id_rsa.pub
echo ---------------------------------------------------------------------------
start chrome https://globaldevtools.bbva.com/bitbucket/plugins/servlet/ssh/account/keys 

echo Copiando archivos de configuración
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
REM COPY config "C:\Users\%username%\.ssh\"
COPY .bashrc "C:\Users\%username%\"

echo Grabando configuración GIT
git config --global http.sslVerify false
git config --global http.proxy http://%username%@118.180.54.170:8080

echo Cierre el Git Bash y pruebe la configuración

pause
exit