#### SISTEMA 3 - SISTEMA MARTINGALE ####
# Neste jogo, você começa apostando $1 no vermelho. Se você
# perder, você dobra sua aposta anterior; se você ganhar, ganhará o apostado e voltará
# a apostar $1 novamente na próxima rodada. Você continua jogando até ganhar $10
# (no acumulado) ou a aposta exceder os $100.

repeticao <- c(1, 10, 100, 1000, 10000)

apostar <- function() {
  aposta <- sample(c(1, -1), 1, replace = T, prob = c(18/37, 19/37))
  return(aposta)
}

apostarMartingale <- function() {
    vitorias <- 0
    apostas <- 0
    apostaValor <- 1

    while (vitorias < 10 && apostaValor <= 100) {
        apostaAtual <- apostar()
        if (apostaAtual == -1) {
            vitorias = vitorias - apostaValor
            apostaValor <- apostaValor * 2
        } else {
            vitorias = vitorias + apostaValor
            apostaValor <- 1
        }

        apostas <- apostas + 1
    }

    return(c(vitorias, apostas))
}

taxaVitoria <- function(repeticao) {
    count <- 1
    aposta <- 0
    vitorias <- 0

    while (count <= repeticao) {
        aposta <- apostarMartingale()[1]

        if (aposta == 10) {
            vitorias <- vitorias + 1
        }

        count <- count + 1
    }

    return(vitorias / repeticao)
}

jogarMartingale <- function() {
  print("SISTEMA 3 - SISTEMA MARTINGALE")

  for (rep in repeticao) {
    print(paste("Repetição", rep, "Proporção de ganhos: ", taxaVitoria(rep)))
    print(paste("Repetição", rep, "Tempo de partida: ", mean(replicate(rep, apostarMartingale()[2]))))
  }

  print(paste("Perda Máxima ", min(replicate(10000, apostarMartingale()[1]))))
  print(paste("Ganho Máximo ", max(replicate(10000, apostarMartingale()[1]))))
}

jogarMartingale()
