# Criação e Execução de Scripts

## Primeiro script - criação, execução
> É importante que o script comece com a linha `#!/bin/bash`, que indica que o código foi feito para esta ferramenta.

- Também é possível sinalizar outros leitores de script

> Depois de salvo, é importante que o script receba permissão de execução para todos, com o comando `chmod +x`. Também é possível a utilização dos scripts através do comando `chmod 744`, que da permissão de leitura para todos e `chmod 755`, que da permissão de leitura e execução.

## Formas de execução do script:
- `./script.sh` a partir do diretorio do script
> esta forma de execução abre um bash filho para execução
- `source script.sh` ou `. script.sh`
> Assim o script é executado no shell atual.
- Também podemos rodar o script simplesmente chamando seu nome. Para isso, precisamos incluir o diretório dele no `$PATH`
> PATH="$PATH:/home/felipe/Udemy/Shell/scripts/"

## Comentários - Boas práticas
- É feito através do caracter `#`
- Cria-se um cabeçalho:
1. `################################################`
2. `# feijoada.sh - script que faz feijoada`
3. `# Autor: Luis (kunzler.luis@gmail.com)`
4. `# Data: 08/10/2021`
5. `# Descrição: feijoada com linguiça`
6. `# Exemplo de uso: ./feijoada.sh`
7. `################################################`

## Trabalhando com variaveis
### Exemplos
1. `DATAHORA=$(date +%H:%M)`
2. `ARQALUNOS="/home/felipe/Udemy/Shell/arquivos/alunos2.txt"`
3. `DIRALUNOS="/home/felipe/Udemy/Shell/arquivos"`
4. `echo -n "Exibir data e hora atual: $DATAHORA"`
5. `DATAHORA=$(date +%H:%M:%S)`
6. `echo "Hora atual: $DATAHORA"`
7. `sort $DIRALUNOS"/alunos2.txt"`

## Codigos de Retorno (Exit Codes)
> Códigos: 0 = sucesso, 1~255 = erro
> O código de retorno do comando anterior é obtido pelo $?
> O man dos comandos apresenta o codigo de retorno.
### EC: Exit Status para o LS:
- 0 success
- 1 minor problems (cannot access subdirs)
- 2 big problems (cannot access cmd-line argument)

### Scripts:
- Armazenar retorno de um comando dentro do código:
`RETURN_CODE=$?`
- Encerrar a execução do script com o valor de retorno do ultimo comando dentro do script:
`exit`
- Encerrar a execução definindo o código de retorno como 10:
`exit 10`

## Lendo entrada do usuario (read)
- `read NOME`
> Luis Felipe Kunzler
- `echo $NOME`
> Luis Felipe Kunzler
- `read $V1 $V2 $V3`
> CURSO SHELL SCRIPT
- `echo $V3 $V2 $V1`
> SCRIPT SHELL CURSO
- `read V1 V2`
> Curso Shell Script # associa "dois campos" a uma variavel
- `echo $V2`
> Shell Script
### Opcoes do read:
- -p: legenda para o usuario
- -t: timeout para entrada de dados
- -a: a variavel é gerada na forma de vetor, iniciando na posicao 0
- -s: nao ecoa a entrada do terminal
- -d: define o delimitador que sera utilizado para encerrar a entrada de dados
