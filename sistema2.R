#### SISTEMA 2 - APOSTAR NO NUMERO ####
# Este jogo envolve apenas uma aposta.  Você aposta $1 em um número específico, digamos 15
# Se a bola cair nesse número, você ganha $35, caso contrário, você perde.
repeticoes <- c(10, 100, 1000, 10000)

apostarNumero <- function() {
  vitoria <- sample(c(35, -1), 1, replace = T, prob = c(1/37, 36/37))

  return(vitoria)
}

taxaVitoria <- function(repeticao) {
  vitorias <- 0
  count <- 1
  
  while (count <= repeticao) {
    count = count + 1

    if (apostarNumero() == 35) {
      vitorias = vitorias + 1
    }
  }

  return((vitorias / repeticao) * 100)
}

jogarNumero <- function() {
  print("SISTEMA 2 - APOSTAR NO NÚMERO")
  
  for (rep in repeticoes) {
    print(paste("Repetição", rep, "Expectativa de ganhos: ", mean(replicate(rep, apostarNumero()))))
    print(paste("Repetição", rep, "Proporção de ganhos: ", taxaVitoria(rep)))
  }
}

jogarNumero()
