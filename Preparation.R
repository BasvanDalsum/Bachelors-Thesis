#Preparation of the analysis
### Initialize the factors of your design:

library(dplyr)
library(MKinfer)
library(fGarch)

#Design factors

samp1 <- c(5, 10, 20, 40)
nr <- c(2,4,8,16)
es <- c(0, 0.3, 0.5, 0.8)
distr <- c("normal", "variance", "skewed", "var+skew")

##And create the simulation design matrix (full factorial)
# Design is a data.frame with all possible combinations of the factor levels
# Each row of the design matrix represents a cell of your simulation design
Design <- expand.grid(samp1 = samp1, nr = nr, es = es, distr = distr)

#Preparation of the analysis:

source("MyDataGeneration.R")
source("Method_new.R")
source("Method_old.R")
source("MyEvaluation.R")