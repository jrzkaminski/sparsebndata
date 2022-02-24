library(BiDAG)
library(igraph)

df <- read.csv("/Users/jerzykaminski/Documents/GitHub/sparsebndata/data/alarm.csv", header = TRUE, sep = ",", check.names = FALSE)
df <- as.data.frame(unclass(df), stringsAsFactors = TRUE) 

# bde for binary data, bdecat for categorical data, bge for continuous data and usr for a user-defined score

scorep <- scoreparameters(scoretype = c("bdecat"), data = df)
x <- orderMCMC(scorep)

n <- getDAG(x, amat = TRUE, cp = FALSE)
g <- graph.adjacency(n)
el <- get.edgelist(g)