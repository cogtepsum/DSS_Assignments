mtc <- mtcars
mtc[, c('am', 'cyl', 'vs', 'gear', 'carb')] <- lapply(mtcars[,c('am', 'cyl', 'vs', 'gear', 'carb')], factor)

fit1 <- lm(mpg ~ am*wt, mtc)
lapply(colnames(mtc[, -match(c("am", "mpg", "wt"), names(mtc))]), 
       function(x) {newfit <- lm(as.formula(paste("mpg ~ am*wt + ", x)), mtc); 
       print(paste0(x, ': ',anova(fit1, newfit)[2,6]))})