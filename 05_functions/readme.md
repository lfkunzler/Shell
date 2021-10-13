# Functions
Trecho de código que exerce uma rotína específica dentro do script
- Evita a repetição excessíva de código
- Facilidade de manutenção

## Características
- Parâmetros
- Variaveis locais e globais
- Definidas antes de chamar
- Retorno = exit code (acessado por $?)

## Sintaxe
``` shell
function nome_funcao() {
    cmd
    cmd2
}

nome_funcao() {
    cmd1
    cmd2
}
```
Para chamar a funcão
``` shell
nome_funcao
nome_funcao param1 param2
VAR1=$(nome_funcao)
```

## Exemplos
``` shell
#!/bin/bash

soma() {
    soma=$(expr $1 + $2)
    return $soma
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
```
soma 10 20
echo "O resultado da soma foi $?"
