# QUESTAO 2: ORDENACAO USANDO METODO DE SELECAO


# Metodo de ordenação de seleção
lw x7, 0(x10)         # x7: valor do primeiro elemento do vetor
addi x31, x0, 3       # registrador com o valor 3
add x30, x10, x0      # x30: endereço do elemento iterador
add x29, x10, x0      # x29: endereço do menor elemento
lw x6, 0(x29)         # x6: valor do menor elemento
add x5, x7, x0        # x5: valor do elemento iterador
add x28, x11, x0      # x28: variavel para contar quantas vezes ja testou
jal, x0, loop


loop:
    blt x11, x31, return  # testa se o tamanho do array eh maior que 2 
    jal x0, busca_menor   # procura o menor elemento do array atual


# Acha o menor elemento do array
busca_menor:
    beq x28, x0, posiciona     # se ja iterou pelo array inteiro, ja achou o menor, entao posiciona ele na posicao certa
    lw x5, 0(x30)              # x5 possui o valor a ser comparado com o menor
    blt x5, x6, atualiza_menor # achou um valor menor que o valor do menor elemento atual, atualiza ele  
    addi x30, x30, 4           # se nao precisar trocar, tambem incrementa pra testar a proxima posicao
    addi x28, x28, -1          # decrementa o numero de vezes que vai procurar o menor
    jal x0, busca_menor        # chama novamente a funcao para procurar o menor ate o fim do array


# Atualiza o reg com o menor valor do array
atualiza_menor:
    add x6, x5, x0      # o menor valor do array eh atualizado
    addi x28, x28, -1   # decrementa o numero de vezes que vai procurar o menor
    add x29, x30, x0    # atualiza o endereco do menor elemento
    addi x30, x30, 4    # incrementa o endereço para testar a proxima posicao
    jal x0, busca_menor # busca o menor agora pras proximas posicoes
    
# Coloca o menor valor na posicao certa
posiciona:
    lw x9, 0(x10)     # armazena o valor que estava 
    sw x6, 0(x10)     # posicao do array que vai ser mudada
    sw x9, 0(x29)     # coloca o valor na posicao que foi tirada
    addi x11, x11, -1 # diminui tamanho do vetor
    addi x10, x10, 4  # incrementa o endereco do array pro proximo valor ser adicionado na posicao seguinte
    add x29, x10, x0  # reseta o endereco do menor valor para o primeiro do array
    lw x6, 0(x29)     # reseta o menor valor para o primeiro do array
    add x30, x10, x0  # reseta o endereco do elemento iterador
    lw x5, 0(x30)     # reseta o valor do elemento iterador
    add x28, x11, x0  # reseta o valor para iterar no array
    jal x0, loop
    
# Retorno
return: