library(sparsebn)
library(igraph)
library(graph)

df <- read.csv("C:\\Users\\Jerzy\\Documents\\GitHub\\sparsebndata\\data\\hailfinder.csv", header = TRUE, sep = ",", check.names = FALSE)

#df <- as.data.frame(unclass(df), stringsAsFactors = TRUE) 

dat <- sparsebnData(df, type = 'd')
start_time <- Sys.time()
dags <- estimate.dag(data = dat)
end_time <- Sys.time()
print(end_time - start_time)

print(dags)

solution <- select(dags, edges = 70)

print(solution)

edgelist <- to_igraph(solution)

x <- get.edgelist(edgelist$edges, names = TRUE)

par(mfrow = c(1, 2), oma = rep(0, 4))
plotDAG(solution)
plot(solution,
     layout = igraph::layout_(to_igraph(solution$edges), igraph::in_circle()),
     vertex.label = NA,
     vertex.size = 5,
     vertex.label.color = gray(0),
     vertex.color = gray(0.9),
     edge.color = gray(0),
     edge.arrow.size = 0.45
)

write.csv(x, "C:\\Users\\Jerzy\\Documents\\GitHub\\sparsebndata\\data\\magic-niab_sparsebn_0.898_seconds.csv", row.names=FALSE)