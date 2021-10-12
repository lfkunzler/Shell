#!/bin/bash

TIME=5

# $# = quantidade de parametros
# $0 = nome do programa
if [ $# -eq 0 ] # se nao ha parametros
then
    echo "$0 <processo>"
    exit 1
fi

# loop infinito... true é um comando que sempre retorna "ok"
# false é um comando que sempre retorna "error"
while true 
do
    # monitora a lista de processos 
    # procura pelo processo passado pelo parametro ($1)
    # elimina do grep o proprio grep
    # elimina do grep o proprio script que procura pelo processo
    if ps aux | grep $1 | grep -v grep | grep -v $0 > /dev/null
    then
        sleep $TIME
    else
        echo "O processo $1 não está em execução"
        sleep $TIME
    fi
done

