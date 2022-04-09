library(sparsebn)
library(igraph)
library(graph)

df <- read.csv("data/arth150.csv", header = TRUE, sep = ",", check.names = FALSE)

df <- as.data.frame(unclass(df), stringsAsFactors = TRUE)

experiment_range <- list(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 106)

timelist <- list()

for (i in experiment_range) {
  rand_df <- df[,sample(1:ncol(df),i)]
  start_time <- Sys.time()
  dat <- sparsebnData(rand_df, type = 'c')
  dags <- estimate.dag(data = dat)
  end_time <- Sys.time()
  ctime <- end_time - start_time
  otime <- list(ctime)
  timelist <- append(timelist, otime)
}
