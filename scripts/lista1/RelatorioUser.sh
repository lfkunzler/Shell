#!/bin/bash

clear

# ls retorna os dois exit status para a mesma saida. 
# se o home do usuario nao existe, retorna.
# (|| só executa o 2nd cmd se o primeiro falhar)
ls /home/$1 > /dev/null 2>&1 || { echo "Usuario Inexistente" ; exit 1; }

USER=$1
UUID=$(cat /etc/passwd | grep $USER | cut -d: -f3)
FULLNAME=$(cat /etc/passwd | grep $USER | cut -d: -f5 )
DIR=$(cat /etc/passwd | grep $USER | cut -d: -f6 )
SIZE=$(expr $(du $DIR -s | cut -f1) / $(expr 1024 \* 1024))
#lastlog -u $1


echo "Relatório do Usuário: $USER"
echo "UID: $UUID"
echo "Nome completo: $FULLNAME"
echo "Usado em $DIR: $SIZE GB"
echo "Ultimo login:"
echo $(lastlog -u $USER)
