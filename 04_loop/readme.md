# Instruções de Loop
Instruções utilizadas para a execução repetida de comandos

## For
É semelhante a um for each/range
``` shell
for variavel in valor1 valor2 ... valorN
do
    comando1
    comando2
done
```

### Exemplo 1: inteiros
``` shell
for numero in 1 2 3 4 5
do
    echo "O número atual é $numero"
done
```

### Exemplo 2: files
``` shell
for arquivo in alunos*
do
    echo "O arquivo atual é $arquivo"
done
```

### Exemplo 3: atraves de sequencia
``` shell
for s in $(seq 5 10) # variante: in {5..10}
do
    echo "O número é $s"
done
```

### Exemplo 4: atraves de sequencia pulando valores (5 em 5)
``` shell
for s in $(seq 0 5 50) # variante: in {0..50..5}
do
    echo "O número é $s"
done
```

### Exemplo 5: percorrendo as palavras de um arquivo
``` shell
# o script abaixo percorre palavras devido ao IFS, que pode ser visto em 
# set | grep IFS = $' \t\n'. Significa que o espaço, o tab e a nova linha
# são considerados elementos que delimitam um campo de informação.
# Podemos alterar isso salvando o IFS atual e o modificando, com:
OLDIFS=$IFS # armazena o antigo
IFS=$':\n' # os campos são delimitados por : e \n (útil em /etc/passwd)
# Apos a operacao, retornar o IFS
IFS=$OLDIFS

for s in $(cat file.txt)
do
    echo $i
done
```

### Exemplo 6: usando a sintaxe do C
``` shell
for (( i=5 ; i < 20 ; i++ ))
do
    echo $i
done
```

### Exemplo 7: for, if e arquivo
``` shell
for i in ~/Udemy/Shell/arquivos/*
do
    if [ -f $i ] # é um arquivo?
    then
        LINHAS=$(cat $i | wc -l)
        echo "Arquivo $i contém $LINHAS linhas."
        echo
    fi
done
```
## While
> O while executa enquanto a condição é verdadeira.
``` shell
# sintaxe
while <comando_condicao>
do
    comando1
    comando2
      ...
done
```
### Exemplo 1
``` shell
x=1
while [ $x -le 20 ]
do
    echo "O valor atual é %x"
    x=$(expr x + 1)
done
```

### Exemplo 2: Enquanto o processo existir...
``` shell
while ls /var/lock/processo.lock > /dev/null
do
    echo "processo em execução"
    sleep 1
done
```

## Until
> O until, ao contrário do while, para de executar se a condição for verdadeira.
``` shell
until <comando-condição>
do
    comando1
    comando2
      ...
done
```

### Exemplo 1
``` shell
x=1
# enquanto i nao for 20, executa...
until [ $x -eq 20 ]
do
    echo "O valor atual é %x"
    x=$(expr x + 1)
done
```
### Exemplo 2
``` shell
until ls /var/lock/processo.lock > /dev/null
do
    echo "aguardando processo inicializar..."
    sleep 1
done
```

## Break
O break serve para interromper o laço de repetição mais "próximo",
independentemente do comando-condicao.
### Exemplo 1

``` shell
#!/bin/bash
i=1
j=1

while [ $i -lt 10 ]
do
    while [ $j -lt 10 ]
    do
        echo i x j = $(expr $i \* $j)
        j=$(expr $j + 1)
        if [ $j -gt 5 ]
        then
            break
        fi
    done
    j=0
    i=$(expr $i + 1)
done
```

## Continue
O continue, pelo contrário, faz com que os comandos abaixo dele no laço de repetição
sejam ignorados, retornando para o "início" do laço e realizando a iteração seguinte.
