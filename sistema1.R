#### SISTEMA 1 - APOSTAR NO VERMELHO ####
# Este jogo envolve apenas uma aposta. Você aposta $1 no vermelho. 
# Se a bola cair no vermelho, você ganha $1, caso contrário, você perde.

repeticoes <- c(10, 100, 1000, 10000)

apostarVermelho <- function() {
  vitoria <- sample(c(1, -1), 1, replace = T, prob = c(18/37, 19/37))

  return(vitoria)
}

taxaVitoria <- function(repeticao) {
  vitorias <- 0
  count <- 1

  while (count <= repeticao) {
    count = count + 1
    if (apostarVermelho() == 1) {
      vitorias = vitorias + 1
    }
  }
  
  return((vitorias / repeticao) * 100)
}

expectivaGanhos <- function(repeticao) {
  totalVitorias <- 0
  count <- 1
  
  while(count <= repeticao) {
    count = count + 1
    totalVitorias = totalVitorias + apostarVermelho()
  }

  return(totalVitorias / repeticao)
}

jogarVermelho <- function() {
  print("SISTEMA 1 - APOSTAR NO VERMELHO")

  for (rep in repeticoes) {
    print(paste("Repetição", rep, "Expectativa de ganhos: ", expectivaGanhos()))
    print(paste("Repetição", rep, "Proporção de ganhos: ", taxaVitoria(rep)))
  }
}

jogarVermelho()
