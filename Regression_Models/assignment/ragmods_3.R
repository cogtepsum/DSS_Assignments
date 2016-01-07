mtc <- mtcars
mtc[, c('am', 'cyl', 'vs', 'gear', 'carb')] <- lapply(mtcars[,c('am', 'cyl', 'vs', 'gear', 'carb')], factor)

lapply(colnames(mtc[, -match(c("am", "mpg"), names(mtc))]), 
       function(x) {newfit <- lm(as.formula(paste("mpg ~ am + ", x)), mtc); 
        print(paste0(x, ': ',anova(lm(mpg ~ am, mtc), newfit)[2,6]))})

f1 <- lm(mpg ~ am + hp, mtc)
f2 <- lm(mpg~ am*hp, mtc)
print(anova(f1, f2))
f1 <- lm(mpg ~ am + wt, mtc)
f2 <- lm(mpg~ am*wt, mtc)
print(anova(f1, f2))