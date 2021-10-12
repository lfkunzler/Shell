# Capitulo de Condicionais
## IF
``` shell
if <comando-condicao>
then
  comando_1
elif <comando-condicao>
then
  comando_2
else
  comando_3
fi
```
## Comando Teste
> A principal diferença do shell para as outras linguagens é que a presença de
> um comando é sempre obrigatória para a avaliação condicional. O comando
> responsável por criar uma condição é o `test`

``` shell
test <expressão>
```
### Test
> Para valores numéricos

| Opção | Descrição             |
|-------|-----------------------|
| -eq   | equal                 |
| -ne   | not equal             |
| -gt   | greater than          |
| -ge   | greater or equal than |
| -lt   | lower than            |
| -le   | lower or equal than   |

> Para strings

| Opção | Descrição                  |
|-------|----------------------------|
| =     | string 1 equal to string 2 |
| !=    | not equal                  |
| -n    | string isn't null          |
| -z    | string is null             |

> Arquivos

| Opção | Descrição                   |
|-------|-----------------------------|
| -f    | is a file                   |
| -d    | is a directory              |
| -r    | has permission of reading   |
| -w    | has permission of writing   |
| -x    | has permission of executing |
| -s    | size greater than 0         |

> Operadores lógicos

| Opção | Descrição |
|-------|-----------|
| !     | Negation  |
| -a    | AND       |
| -o    | OR        |

> O comando pode ser omitido pela sintaxe `[]`

### Exemplos
``` shell
test 50 -gt 100 # [50 -gt 100]
```
> false
``` shell
VAR1=12
test $VAR1 -eq 12 # [$VAR1 -eq 12]
```
> true
``` shell
test -f /tmp/file.txt # [-f /tmp/file.txt]
```
> true
``` shell
VAR1="hello"
VAR2="world"
test $VAR1 = $VAR2 # [$VAR1 = $VAR2]
```
> false

