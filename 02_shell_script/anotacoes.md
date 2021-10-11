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
`
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
`

