# QUESTAO 1: SEQUENCIA 3n+1

add x7, x0, x10           # x1 tem o valor de n, que está em x10
addi x28, x0, 1           # registrador com valor 1
addi x29, x0, 2           # registrador com valor 2 
addi x31, x0, 3           # registrador com valor 3
bne x7, x0, loop          # entra no loop se n nao for 0


loop:
    addi x7, x7, -1       # decrementa o n 
    rem x6, x11, x29      # divide x11 por 2 e o resto fica em x6
    beq x6, x0, par       # desvia se for par
    bne x6, x0, impar     # desvia se for impar


back:
    add x11, x10, x0      # x11 recebe o valor de x10
    beq x7, x28, end      # se ja tiver feito n vezes, sai do loop
    add x10, x0, x0       # x10 = 0
    beq x11, x28, end     # se o x11 chegou no 1 e o n ainda nao eh zero (nao foi pro end) retorna 0
    jal x0, loop          # volta incondicionalmente pro loop se o n nao tiver chegado no 0


par:
    div x10, x11, x29     # divide o valor atual da sequencia por 2
    jal x0, back          # volta pra posicao que parou no loop


impar:
    mul x10, x11, x31     # multiplica o valor atual da sequencia por 3
    addi x10, x10, 1      # soma 1 no valor atual da sequencia
    jal x0, back          # volta pra posicao que parou no loop


end: