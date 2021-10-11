#! /bin/bash
clear

DISTRO=$(uname -n)
KERNEL=$(uname -r)

DATAHORA=$(date +%D\ %H:%M:%S)
UPSINCE=$(uptime -s)

# pega a informacao de model name e conta a quantidade de linhas
CPUCOUNT=$(cat /proc/cpuinfo | grep "model name" | wc -l)
# pega a primeira linha do resultado: head -1
# corta a partir da posicao 14, que eh o espaco apos model name:
CPUMODEL=$(cat /proc/cpuinfo | grep "model name" | head -1 | cut -c14-)
# variacao
#CPUMODEL=$(cat /proc/cpuinfo | grep "model name" | head -1 | cut -d ":" -f 2)

# quantidade de ram disponivel
RAMAVB=$(expr $(cat /proc/meminfo | grep MemTotal | tr -d ' ' | cut -d: -f2 | tr -d kB) / 1024)

PARTIT=$(df -h | egrep -v '(tmpfs|udev)')

echo ========================================
echo Relatório da Máquina: $DISTRO
echo Data/Hora Atual: $DATAHORA
echo
echo Maquina Ativa desde: $UPSINCE
echo
echo Versão do kernel: $KERNEL
echo
echo CPUs
echo Quantidade: $CPUCOUNT
echo Modelo: $CPUMODEL
echo
echo Memoria Total: $RAMAVB MB
echo
echo Partições:
echo $PARTIT
echo ========================================

