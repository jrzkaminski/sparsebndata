
# Loading

library("readr")
library(bnlearn)
setwd('/Users/jerzykaminski/Documents/GitHub/sparsebndata/truenetworks/')
healthcare <- readRDS(file = "magic-irri.rds")
fileConn<-file("magic-irri.txt")
for (name in healthcare){
  for (second in name$children){
    line = paste(name$node,second)
    write(line, file = "magic-irri.txt", append=TRUE)
  }
}