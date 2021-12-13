library(sparsebn)
library(pcalg)

df <- read.csv("C:\\Users\\Jerzy\\Documents\\GitHub\\sparsebndata\\hailfinder.csv", header = TRUE, sep = ",", check.names = FALSE)

df <- as.data.frame(unclass(df), stringsAsFactors = TRUE) 

dat <- sparsebnData(df, type = "discrete")
dags <- estimate.dag(data = dat)

print(dags)

solution <- select(dags, edges = 68)

print(solution)

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

truebn <- read.csv("C:\\Users\\Jerzy\\Documents\\GitHub\\sparsebndata\\hailfinder_structure.csv", header = TRUE, sep = ",", check.names = FALSE)

solutionsbn <- to_graphNEL(to_edgeList(solution))
to_edgeList(solutionsbn$edges)
print(solutionsbn$edges)


truebn <- to_graphNEL(truebn)
print(truebn)


shd_result <- shd(solutionsbn$edges, truebn)
print(shd_result)