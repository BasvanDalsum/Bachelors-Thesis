#Method new: Bootstrap t test

Method_new<- function(SimData){
  formula <- Y~group
  pre <- boot.t.test(formula, data = SimData, R = 500)
  return(pre)
}