library(sparsebn)
library(pcalg)

data(pathfinder)

dat <- sparsebnData(pathfinder$data, type = "continuous", ivn = NULL)
nn <- num.samples(dat)
               # number of samples in the dataset / equivalent to nrow(dat$data)
lambdas <- generate.lambdas(sqrt(nn),
                         0.05, lambdas.length = 50, scale = "linear")
start_time <- Sys.time()
dags <- estimate.dag(data = dat,
                     lambdas = lambdas,
                     verbose = FALSE)
print(dags)

# solution by sparsebn
solution <- select(dags, edges = 195)

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

# original pathfinder graph
par(mfrow = c(1, 2), oma = rep(0, 4))
plotDAG(pathfinder$dag)
plot(pathfinder$dag,
     layout = igraph::layout_(to_igraph(pathfinder$dag), igraph::in_circle()),
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


truebn <- to_graphNEL(pathfinder$dag)
print(pathfinder$dag)


shd_result <- shd(solutionsbn$edges, truebn)
print(shd_result)