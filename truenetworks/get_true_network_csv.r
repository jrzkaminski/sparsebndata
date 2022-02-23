
# Loading

library("readr")
library(bnlearn)
setwd('C:/Users/Jerzy/Documents/GitHub/sparsebndata/truenetworks/')
healthcare <- readRDS(file = "pigs.rds")
fileConn<-file("output.txt")
for (name in healthcare){
  for (second in name$children){
    line = paste(name$node,second)
    write(line, file = "output.txt", append=TRUE)
  }
}