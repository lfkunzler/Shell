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
| opção | Descrição             |
|-------|-----------------------|
| -eq   | equal                 |
| -ne   | not equal             |
| -gt   | greater than          |
| -ge   | greater or equal than |
| -lt   | lower than            |
| -le   | lower or equal than   |


