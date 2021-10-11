#!/bin/bash

ARQALUNOS="/home/felipe/Udemy/Shell/arquivos/alunos2.txt"

clear
echo "===script de busca de alunos==="
echo ""
#echo -n "informe o nome do aluno:"
read -p "informe o nome do aluno: " NOME

ALUNOCOMPLETO=$(grep $NOME $ARQALUNOS)

echo ""
echo "Nome lido: "$NOME
echo "O nome completo é: $ALUNOCOMPLETO"

