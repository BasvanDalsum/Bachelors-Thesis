#run these two lines (2 & 3) first, in order to properly change the working directory.
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

source('Preparation.R')
source('SimulationOneCell.R')
source('SimulationAllCells.R')
source('collectResults.R')
source('getErrors.R')
