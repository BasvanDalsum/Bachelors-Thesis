Input$Method1 <- factor(Input$Method1, levels = unique(Input$Method1))
formula <- Input$es ~ Input$Method1
result <- aov(formula, data=Input)
summary(result)