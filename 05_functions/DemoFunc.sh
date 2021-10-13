#!/bin/bash

soma() {
    return $(expr $1 + $2)
}

maiuscula() {
    # $1 e $2, nesse contexto, sao os parametros da funcao
    echo $1 | tr a-z A-Z
    echo $2 | tr a-z A-Z
    # por padrao, essa variavel é global, mesmo estando na func
    VAR1="Teste global!"
    # para criarmos uma variavel local, precisamos declara-la desse modo
    local VAR2="Teste local!"
}

maiuscula shell $1
echo $VAR1
echo $VAR2
soma 10 20
echo "O resultado da Soma foi $?"
