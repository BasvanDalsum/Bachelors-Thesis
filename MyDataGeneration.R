pooledSD <- function(variance1,variance2){
  return(sqrt((variance1+variance2)/2))
}

#Comparison of power of Bootstrap t test and power of t-test
# In group 1 variable Y is from a normal distribution with mu = 0 and sigma = 1
# In group 2 variable Y is from a normal distribution with mu = 0 + es and sigma = 1
# es is "effect size", which is a factor in the simulation design (either 0.2, 0.5, or 0.8) 
# samp = sample size of group 1 = sample size of group 2
# samp = 10, 20, 40, 80
MyDataGeneration <- function(samp1, nr, es, distr){
  samp2 <- nr*samp1
  
  if (distr == "normal"){
    var1 <- rnorm(samp1, 10, 1) 
    var2 <- rnorm(samp2, 10, 1) - es
  } 
  else if (distr == "variance") { 
    es <- es*1.11
    var1 <- rnorm(samp1, 10, 1)
    var2 <- rnorm(samp2, 10, 3) - es*pooledSD(1, 9)
    
  } 
  else if (distr == "skewed") {
    var1 <- rsnorm(samp1, mean = 10, sd = 1, xi = 1)
    var2 <- rsnorm(samp2, mean = 10, sd = 1, xi = 3) - es
    
  }            
  else if (distr == "var+skew") {
    es <- es*1.11
    var1 <- rsnorm(samp1, mean = 10, sd = 1, xi = 1)
    var2 <- rsnorm(samp2, mean = 10, sd = 3, xi = 3) - es*pooledSD(1, 9)
    
  }
  else{
    stop(paste0("Unkown distribution ",distr))
  }
  
  Y <- c(var1, var2)
  group <- as.factor(c(rep(1, samp1), rep(2,samp2)))
  dat <- data.frame(Y,group)
  return(dat) 
}
