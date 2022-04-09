library(BiDAG)
library(igraph)

df <- read.csv("C:/Users/Jerzy/Documents/GitHub/sparsebndata/data/pigs.csv", header = TRUE, sep = ",", check.names = FALSE)
#df <- as.data.frame(unclass(df), stringsAsFactors = TRUE) 

# bde for binary data, bdecat for categorical data, bge for continuous data and usr for a user-defined score
experiment_range <- list(20,
                         40,
                         60,
                         80,
                         100,
                         120,
                         140,
                         160,
                         180,
                         200,
                         220,
                         240,
                         260,
                         280,
                         300,
                         320,
                         340,
                         360,
                         380,
                         400,
                         440)

timelist <- list()

for (i in experiment_range) {
  rand_df <- df[,sample(1:ncol(df),i)]
  start_time <- Sys.time()
  scorep <- scoreparameters(scoretype = c("bdecat"), data = rand_df)
  x <- orderMCMC(scorep)
  end_time <- Sys.time()
  ctime <- end_time - start_time
  otime <- list(ctime)
  timelist <- append(timelist, otime)
}


n <- getDAG(x, amat = TRUE, cp = FALSE)
g <- graph.adjacency(n)
el <- get.edgelist(g)