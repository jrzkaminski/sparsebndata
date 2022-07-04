library(BiDAG)
library(igraph)

df <- read.csv("C:/Users/Jerzy/Documents/GitHub/sparsebndata/data/medicine_discrete.csv", header = TRUE, sep = ",", check.names = FALSE)
df <- as.data.frame(unclass(df), stringsAsFactors = TRUE) 

# bde for binary data, bdecat for categorical data, bge for continuous data and usr for a user-defined score
start_time <- Sys.time()
scorep <- scoreparameters(scoretype = c("bge"), data = df)
x <- orderMCMC(scorep)
end_time <- Sys.time()
print(end_time - start_time)

n <- getDAG(x, amat = TRUE, cp = FALSE)
g <- graph.adjacency(n)
el <- get.edgelist(g)

write.csv(el, "C:\\Users\\Jerzy\\Documents\\GitHub\\sparsebndata\\data\\medicine_discrete_bidag.csv", row.names=FALSE)