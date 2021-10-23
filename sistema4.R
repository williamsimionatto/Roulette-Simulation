#### SISTEMA 4 - SISTEMA LABOUCHERE ####
# Neste jogo você começa com a lista de números (1, 2, 3, 4).
# Você aposta no vermelho e o valor da aposta é a soma do primeiro e do último número
# (inicialmente $5). Se você vencer, ganhará o valor da aposta e excluirá o primeiro e o
# último número da lista (por isso, se você ganhar em sua primeira aposta, a lista ficará
# (2,3)); caso contrário, você adicionará o valor da aposta ao final da sua lista (por isso,
# se você perder na primeira aposta, a lista ficará (1, 2, 3, 4, 5)). Você repete esse
# processo até que sua lista esteja vazia ou até que a aposta exceda 100 dólares. Se
# apenas um número for deixado na lista, você aposta o valor deste número.

repeticao <- c(1, 10, 100, 1000, 10000)

apostar <- function(valor) {
    aposta <- sample(c(-valor, valor), 1, replace = TRUE, prob = c(19/37, 18/37))
    return(aposta)
}

apostarLabouchere <- function() {
    lista <- c(1, 2, 3, 4)
    valorGanho <- 0
    aposta <- lista[1] + lista[length(lista)]
    numeroApostas <- 0

    while (length(lista) > 0 && aposta <= 100) {
        numeroApostas <- numeroApostas + 1
        apostaAtual <- apostar(aposta)

        if (apostaAtual > 0) {
            valorGanho <- valorGanho + apostaAtual
            lista <- lista[-c(1, length(lista))]

             if (length(lista) == 1) {
                 aposta <- lista[1]
             } else {
                 aposta <- lista[1] + lista[length(lista)]
             }
        } else {
            valorGanho <- valorGanho + apostaAtual
            lista <- c(lista, abs(apostaAtual))
            aposta <- lista[1] + lista[length(lista)]
        }
    }

    return(c(valorGanho, numeroApostas))
}

taxaVitoria <- function(repeticao) {
    count <- 1
    valorGanho <- 0
    numeroVitorias <- 0

    while (count <= repeticao) {
        valorGanho <- apostarLabouchere()[1]

        if (valorGanho >= 10) {
            numeroVitorias <- numeroVitorias + 1
        }

        count <- count + 1
    }

    return(numeroVitorias / repeticao)
}

expectivaGanhos <- function(repeticao) {
    valorGanho <- 0
    count <- 1
    
    while(count <= repeticao) {
        count = count + 1
        valorGanho = valorGanho + apostarLabouchere()
    }
    
    return(valorGanho / repeticao)
}

jogarLabouchere <- function() {
    print('SISTEMA 4 - SISTEMA LABOUCHERE')
    for (rep in repeticao) {
        print(paste("Repetição", rep, "Expectiva de ganhos: ", taxaVitoria(rep)))
        print(paste("Repetição", rep, "Tempo de partida: ", mean(replicate(rep, apostarLabouchere()[2]))))
    }

    print(paste("Perda Máxima ", expectivaGanhos(rep)[1]))
    print(paste("Ganho Máximo ", max(replicate(10000, apostarLabouchere()[1]))))
}

jogarLabouchere()

