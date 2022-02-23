library(BiDAG)

data <- read.csv("C:\\Users\\Jerzy\\Documents\\GitHub\\sparsebndata\\data\\barley.csv", header = TRUE, sep = ",", check.names = FALSE)

# bde for binary data, bdecat for categorical data, bge for continuous data and usr for a user-defined score

scorep <-scoreparameters(scoretype = c("bdecat"), data, bdecatpar = list(chi = 0.5, edgepf = 2))

x <- orderMCMC(scorep, MAP = TRUE, plus1 = TRUE, chainout = FALSE,
               scoreout = FALSE, moveprobs = NULL, iterations = NULL, stepsave = NULL,
               alpha = 0.05, cpdag = FALSE, gamma = 1, hardlimit = ifelse(plus1, 14, 20),
               verbose = FALSE, startspace = NULL, blacklist = NULL,
               startorder = NULL, scoretable = NULL)

n <- getDAG(x, amat = TRUE, cp = FALSE)

print(n)