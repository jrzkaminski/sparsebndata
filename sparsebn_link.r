library(sparsebn)
library(pcalg)


df <- read.csv("C:\\Users\\Jerzy\\Documents\\GitHub\\sparsebndata\\andes.csv", header = TRUE, sep = ",", check.names = FALSE)

df[sapply(df, is.character)] <- data.matrix(df[sapply(df, is.character)])

dat <- sparsebnData(df, type = "discrete")
start_time <- Sys.time()
dags <- estimate.dag(data = dat)
print(dags)

# solution by sparsebn
solution <- select(dags, edges = 338)

end_time <- Sys.time()
print(end_time - start_time)

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

truebn <- load(file = "C:\\Users\\Jerzy\\Documents\\GitHub\\sparsebndata\\andes.rda")

# original pathfinder graph
par(mfrow = c(1, 2), oma = rep(0, 4))
plotDAG(truebn)
plot(truebn,
     layout = igraph::layout_(to_igraph(truebn), igraph::in_circle()),
     vertex.label = NA,
     vertex.size = 5,
     vertex.label.color = gray(0),
     vertex.color = gray(0.9),
     edge.color = gray(0),
     edge.arrow.size = 0.45
)

solutionsbn <- to_graphNEL(to_edgeList(solution))
to_edgeList(solutionsbn$edges)
print(solutionsbn$edges)

shd_result <- shd(solutionsbn$edges, truebn)
print(shd_result)