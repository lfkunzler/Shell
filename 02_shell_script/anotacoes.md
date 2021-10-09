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
1 `################################################`
2 `# feijoada.sh - script que faz feijoada`
3 `# Autor: Luis (kunzler.luis@gmail.com)`
4 `# Data: 08/10/2021`
5 `# Descrição: feijoada com linguiça`
6 `# Exemplo de uso: ./feijoada.sh`
7 `################################################`
