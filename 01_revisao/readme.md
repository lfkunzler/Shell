Descompactar arquivos do curso
    `tar zxvf arquivos.tgz`

## Tipos de Shell
> Bourne Shell (SH)
- shell original e padrão do unix
> Bourne-Again Shell (BASH) (utilizado no curso)
- shell padrão linux, compativel com SH, porém melhorado.
- Também incorpora recursos do csh e ksh
> Korn Shell (KSH)
- shell baseado no BASH, porém melhorado
> C Shell (CSH)
- shell com recursos da linguagem C

Para visualizar o shell em uso, utiliza-se os comandos `echo $0` ou `echo $SHELL`

O comando `touch` serve para atualizar a data de edição de um arquivo

## echo
> direciona um texto para uma saida
-   -n nao quebra a linha no final
-   -e adiciona um "efeito", por exemplo:
-   \a alert, \b backspace, \n newline, \t tab

## rm
> remoção de arquivos (diretorios com -r)
-   -f serve para suprimir a mensagem de erro, alem de forcar algo...

## cat
> joga pra uma saida (geralmente a padrao) o conteudo de um arquivo
-   -b enumera as linhas que nao sao em branco
-   -n enumera todas as linhas
-   -A mostra caracteres especiais

## tac
> faz igual o cat, porem de tras pra frente

## tail
> mostra as ultimas 10 linhas
- -n define a quantidade de linhas

## head
> mostra as primeiras 10 linhas
- -n define a quantidade de linhas
- -c quantidade de caracteres

## wc
> conta quantidade de [linhas, palavras, caracteres(bytes)]
- -l somente linhas
- -w somente palavras
- -c somente caracteres (bytes)

## |
> (pipe) desvio da saida de um comando para o outro
- exemplo: `echo "ola mundo" | wc`
> 1 2 10


## sort
> realiza a ordenacao de um arquivo
- -r ao contrario
- -k define o campo utilizado, por padrao eh o 1
- -t para definir o que define os campos
- -g para que o campo seja interpretado como int (nao como string)

## uniq
> nao permite retorno repetido em sequencia
- -u exibe todos os campos que só aparecem uma vez
- -d exibe apenas as informacoes repetidas
- -c conta quantos vezes cada expressao aparece

## misturando alguns comandos:
> sort alunos.txt | uniq -c | sort -r | head -n 1
    ordena a saida do txt, exibe a contagem de cada elemento repetido,
    ordena reversamente para o elemento que aparece mais vezes aparecer
    por primeiro e por ultimo, exibe apenas a primeira linha

## tr
> muda, traduz e deleta caracteres
    por exemplo, podemos pegar a saida de um arquivo (cat file.txt) e
    alterar todos os caracteres para maiusculo com:
    `cat file.txt | tr a-z A-Z`
    para trocar todos os espacos de um arquivos por um tab:
    `cat file.txt | tr ' ' '\t'`
- -d deleta as letras especificadas

## cut
- -c corta os caracteres especificados. Exemplo:
> cut -c 1,2,10- : pega os caracteres 1, 2 e 10 em diante em todas linhas
- -d define o separador de campos
- -f escolhe quais campos sao utilizados. Exemplo: 
    `echo "Luis Felipe Kunzler" | cut -d " " -f 1,3`
> Luis Kunzler

## diff
> compare line by line - mostra as diferencas entre dois arquivos
- -w ignora se a diferenca for um espaço
- -r compara pastas

## grep
> procurar um conteudo dentro de um stream de texto
- -i testa todas possibilidades entre maiusculo e minusculo
- -c conta a ocorrencia do termo de busca
- -v nao mostra linhas que possui a palavra
- -r recursivo (dentro de diretorio: grep -r word \*)
- -l so lista o arquivo que possui o elemento (combo -rl)
- -A[n] mostra n linhas depois do termo buscado
- -B[n] mostra n linhas antes do termo buscado

## fgrep
> nao usa expressões regulares (eh o mais leve)

## egrep
> expressões regulares extendidas

## sed 
> Filtering and transforming text. Similar ao grep, mas realiza operacoes.
    Exemplos:
    - deletar primeira a terceira linha: `sed '1,3 d' file.txt`
    - deletar a linha que possui "Rafael": `sed '/Rafael/d' file.txt`
    - substituir "Paulo" por "João": `cat file.txt | sed 's/Paulo/João'`
    - substituir linux por unix uma vez:
        `echo "curso linux shell script linux" | sed 's/Linux/Unix'`
    - substituir todas as ocorrências:
        `echo "curso linux shell script linux" | sed 's/Linux/Unix/g'`

## more <file>
-    enter desce
-    space proxima pagina

## less <file>
-    enter desce uma linha
-    space desce uma pagina
-    usar setas direcionais
-    /termo para pesquisar do ponto ao fim (n proximo, N anterior)
-    ?termo para pesquisar do ponto ao comeco

## find <destino> -name <pelo que procurar>
>   usado para procurar arquivos e diretórios
    -user <name> procurar por arquivos do usuario

## find + exec
    `find ~/ -name alunos* -exec ls -l {} \;`
>   Explicação: executa o comando find a partir da raiz do usuario atual
    procurando por todos os arquivos cujo nome começa com a palavra
    "aluno". Após, joga a saida do comando para o ls -l, para que ele
    mostre a localização de cada arquivo

## date
- '+' na frente do primeiro formatador
- %D data
- %H hora 00~23
- %I hora 01~12
- %M minuto
> Exemplo: HORA=$(date +%H:%M:%S)

## seq
> gera uma sequencia de numeros
- um argumento: 0 fim
- dois argumentos: de fim
- tres argumentos: de incremento fim

## expr
> expressoes matematicas (inteiras): + - / * %, logicas...
  lembrar de proteger o * com: \\

Seu uso padrão é o
``` shell 
$(expr 2 + 4) # == 6
```

O uso do comando de expressão também pode acomular mais que um valor, sendo:
``` shell 
$(expr 10 + 2 * 6 / 3) # == 14
```
pois `10 + ((2\*6)/3) = 14`

A expressão acima também pode ser descrita por: 
``` shell 
$(expr 10 + 6 / 3 \* 2) # == 10 + 2\*2
```

## bc
> interpretador de strings no formato de expressao matematica
    `echo 3 + 2 | bc`

## Sequenciamento de comandos
- `;` executa multiplos comandos, independentemente da saida do processo passado
- `&&` executa o próximo comando apenas se o anterior tiver sido valido
- `||` executa o próximo comando apenas se o anterior tiver retornado erro
- `()` os comandos dentro de () fazem com que se abra um shell filho, execute e
        retorne para o estado inicial. 
> Por exemplo: `(cd .. ; ls -l)`: abre um processo filho, desce um nível e 
  imprime o que há nele. Ao final desse comando, o shell ainda esta no diretorio
  atual.

## Redirecionamento de Entrada e Saída
`stdin(0)` -> program -> `stdout(1)`
               |-----> `stderr(2)`
### Redirecionamentos de Saida: > e >>
        > escreve o conteudo atual em cima dos dados ja existentes
        >> anexa o conteudo atual aos dados já existentes
        pode ser representado tambem por 1> e 1>>, como visto abaixo

### Redirecionamento de erro:
> funciona igual ao redirecionamento de saida
  porem é necessario especificar que o redirecionamento é da saida
  de erro atraves do numerador: 2> e 2>>

### Mixando:
`ls -l no_file.txt >> log.out 2>> log_error.out`
> a saida do comando para o log.out e o erro do comando para log_error

> também é possivel redirecionar as duas saidas
  `ls -l no_file.txt >> log.out 2>&1`

> por fim, tambem podemos desprezar a saida de erro, jogando-a no buraco negro
  `ls -l no_file.txt 2> /dev/null`

### Redirecionamento de Entrada: |
- `cat alunos.txt | grep nome`
- `cat alunos.txt | tr a-z A-Z`

## Variaveis no Shell
> declaracao: normalmente se usa maiusculo
`VARIAVEL1=valor # sem espaco`

> exibição:
`echo $VARIAVEL1`

> proteção:
`STRING1="conteudo protegido pelas aspas"`
        sem as aspas, o espaço é proíbido

    echo $$
>   pid da sessão
    variaveis criadas são locais por padrão e nao visivel a outros bash,
    nem processos filhos desse bash

    para tornar uma variavel global, utilizamos o comando export
    TESTE=testando
    export TESTE

    atribuindo o resultado de um comando a uma variavel: utilizar `` ou $()
    HORA=`date +%H`
    HORA=$(date +%H)

    env : variaveis de ambiente (globais/exportadas)
    set : variaveis locais e de ambiente
    criar e exportar a variavel ao mesmo tempo: export VAR1=content

## Caracteres especiais
- `*` qualquer coisa
- `/` protecao do caractere seguinte
- `$` 
- `"``"`
- `"` protecao de tudo menos $ ` \
- `''` protecao de tudo

## BASH manual:
### 3.1.2.2 Single Quotes

> Enclosing characters in single quotes (') preserves the literal value of 
  each character within the quotes. A single quote may not occur between 
  single quotes, even when preceded by a backslash.

### 3.1.2.3 Double Quotes

> Enclosing characters in double quotes (") preserves the literal value of all
  characters within the quotes, with the exception of $, `, \, and, when
  history expansion is enabled, !. The characters $ and ` retain their special
  meaning within double quotes (see Shell Expansions). The backslash retains 
  its special meaning only when followed by one of the following characters: 
  $, `, ", \, or newline. Within double quotes, backslashes that are followed 
  by one of these characters are removed. Backslashes preceding characters
  without a special meaning are left unmodified. A double quote may be quoted 
  within double quotes by preceding it with a backslash. If enabled, history
  expansion will be performed unless an ! appearing in double quotes is 
  escaped using a backslash. The backslash preceding the ! is not removed.

## Ajudas do VI
### Comandos basicos do vim
- ctrl+f proxima pagina
- ctrl+p pagina anterior
- sair dos modos: esc
- modo insert: i
- modo de comando: :
- :1 primeira linha
- :$ ultima linha
- :20 linha 20
- :! minimiza o vim, executa o comando no bash e retorna...
> :! ls /tmp => minimiza o vim, lista o /tmp e volta pro vim
- /Linux procura de cima para baixo por Linux (n e N proximo e anterior)
- ?Linux procura de baixo para cima por Linux
- dd: recortar uma linha
- d<n>d: recorta n linhas
- p: colar na linha seguinte
- yy e y<n>y: copiar linhas
- :w salvar
- :x salvar e sair
- :q sair
- :q! sair ignorando alterações

![vim table](https://github.com/lfkunzler/Shell/blob/main/01_revisao/vi-help-sheet-01-large2.jpg)

## File Globbing:
> File Globbing é a forma que o bash/shell tem de selecionar arquivos e direts
  REGEX é usado para seleção e formatação de texto.
> Exemplo:
- `ls Aula*`: utilização de * em file globbing
- `ls -la Aula[1-5]`: quero apenas aula com algum dos caractes dentro de []
- `ls -la *[12]`: qualquer coisa que termine com 1 ou 2
- `ls -la {AULA,Aula}[12]`: listar apenas Aula e AULA 1 e 2
- `ls -la {AULA,Aula}1?`: Exige a existencia de um caractere apos 1
> Resumo file globbing:
- `?` quantidade de caracteres
- `[]` lista de caracteres possiveis que eu quero
- `{}` lista de palavras/expressoes que eu quero
> funciona com diversos comandos que manipulam nome de arquivo

## Expressões Regulares (REGEX): 
> aplicados a conteudo...:
### Utilizações do `egrep`
- `egrep`: grep que aceita expressões regulares extendidas (grep -e)
- `egrep "Linux" texto.txt` # busca ocorrencias de Linux no texto
- `egrep "[Ll]inux" texto.txt` # busca ocorrencias de Linux e linux no texto
- `egrep "b[aei]g" texto.txt` # 1st e 3rd char tem q ser b e g, segundo pode 
        ser qualquer um dentro do colchete
- `egrep "^Linux" texto.txt` # a primeira palavra tem que ser Linux
- `egrep "^#" texto.txt` # apenas comentarios
- `egrep -v "^#" texto.txt` # tudo menos os comentarios
- `egrep "Linux$" texto.txt` # apenas quando Linux estiver no final da linha
- `egrep -v "^$" texto.txt` # apenas linhas em branco (nada entre inicio e fim)

### caracteres especiais...:
- `*` indica que o caractere anterior pode aparecer ou nao...
> `egrep b[aeiou]g* texto.txt` # baseado, bag, beg, big, beginner, bigger, bage
- `+` indica que o caractere anterior tem que aparecer pelo menos uma vez
> `egrep b[aeiou]g+ texto.txt` # bag, beg, big, beginner, bigger, bage
- `?` o caracter anterior tem que aparecer nenhuma ou apenas uma vez
> `egrep b[aeiou]g? texto.txt` # baseado, bag, beg, big, beginner, bigger, bage
   nesse caso bigger aparece, porem no terminal o segundo g nao eh destacado.
- `.` Serve para substituir um caracter, como um coringa
> `egrep "Linux" texto.txt`
- Linux 
- LinuxUbuntu
- Linux Ubuntu
- O Linux
- OLinux
> ` egrep "O.Linux" texto.txt`
- O Linux
> `egrep "O.*Linux" texto.txt # pode existir qualquer coisa entre O e Linux`
- O Sistema Operacional Linux
- O Linux
- Origem Linux
- OLinux
> Para proteger o `.` de ser interpretado como REGEX, utiliza-se a `\`
- O mesmo serve para outros coringas, como `[] {} *`

> O comando de `sed (filtering and transforming text tool)` também pode ser
    utilizado com REGEX:
    `sed 's/[Ll]inux/Unix/g' texto.txt` # substitui (s) todas (g) as ocorrencias
    de Linux e linux por Unix

