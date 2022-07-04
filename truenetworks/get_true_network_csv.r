
# Loading

library("readr")
library(bnlearn)
setwd('C:/Users/Jerzy/Documents/GitHub/sparsebndata/truenetworks/')
healthcare <- readRDS(file = "sangiovese.rds")
fileConn<-file("sangiovese.txt")
for (name in healthcare){
  for (second in name$children){
    line = paste(name$node,second)
    write(line, file = "sangiovese.txt", append=TRUE)
  }
}