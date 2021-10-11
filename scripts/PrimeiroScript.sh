#!/bin/bash

#################################################
# PrimeiroScript.sh - Script exemplo do curso
#
# Autor: Luis Kunzler (kunzler.luis@gmail.com)
# Data: sex 08/10/2021
# 
# Descrição: Script de exemplo que lê data e hora
# Exemplo de uso: PrimeiroScript.sh
#################################################

# criacao de variavei datahora
# hora:minuto
DATAHORA=$(date +%H:%M)
ARQALUNOS="/home/felipe/Udemy/Shell/arquivos/alunos2.txt"
DIRALUNOS="/home/felipe/Udemy/Shell/arquivos"
clear
echo "========== Meu Primeiro Script ============"
echo ""
echo -n "Exibir data e hora atual: $DATAHORA"

echo ""
echo "listagem dos alunos"
#sort /home/felipe/Udemy/Shell/arquivos/alunos2.txt
sort $ARQALUNOS
echo ""
echo "Outra listagem dos alunos"
sort $DIRALUNOS"/alunos2.txt"
# Atualiza datahora pra receber segundo
DATAHORA=$(date +%H:%M:%S)
echo "Hora atual: $DATAHORA"

