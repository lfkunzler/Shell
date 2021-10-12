#!/bin/bash

OLDIFS=$IFS
IFS=$'\n'

# ^uid = linha que começa assim... tr -s retira os tabs, cut pega segundo campo
MIN_UID=$(grep "^UID_MIN" /etc/login.defs|tr -s "\t"|cut -f2)
MAX_UID=$(grep "^UID_MAX" /etc/login.defs|tr -s "\t"|cut -f2)

# cria cabeçalho
echo -e "USUARIO\t\tUID\t\tDIR HOME\t\tNOME"

for i in $(cat /etc/passwd)
do
    USERID=$(echo | cut -d":" -f3)
    if [ $USERID -ge $MIN_UID -a $USERID -le $MAX_UID ]
    then
        USER=$(echo $i | cut -d: -f1)
        HOMEDIR=$(echo $i | cut -d: -f6)
        USERNAME=$(echo $i | cut -d: -f5 | tr -d ',')
        echo -e "$USER\t\t$USERID\t\t$HOMEDIR\t\t$USERNAME"
    fi
done

IFS=$OLDIFS

