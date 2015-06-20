# https://drive.google.com/file/d/0B2hURJFSyNjfdENUYzU2YmZNV2s/view?pli=1

library(SparkR)
sc <- sparkR.init("local");

slices <- 2
n <- 100000 * slices

piFunc <- function(elem) {
  rands <- runif(n = 2, min = -1, max = 1)
  ifelse((rands[1]^2 + rands[2]^2) < 1, 1.0, 0.0)
}

piFuncVec <- function(elems) {  
  message(length(elems))
  rands1 <- runif(n = length(elems), min = -1, max = 1)
  rands2 <- runif(n = length(elems), min = -1, max = 1)
  val <- ifelse((rands1^2 + rands2^2) < 1, 1.0, 0.0)
  sum(val)
}

rdd <- parallelize(sc, 1:n, slices)
count <- reduce(lapplyPartition(rdd, piFuncVec), sum)
cat("Pi is roughly", 4.0 * count / n, "\n")
cat("Num elements in RDD ", count(rdd), "\n")

