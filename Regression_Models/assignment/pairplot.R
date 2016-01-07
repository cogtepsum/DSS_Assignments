library(gclus)

panel.regression <- function (x, y, col = par("col"), bg = NA, pch = par("pch"), 
                              cex = 1, col.regres = "red", ...) 
{ 
        points(x, y, pch = pch, col = col, bg = bg, cex = cex) 
        ok <- is.finite(x) & is.finite(y) 
        if (any(ok)) 
                abline(stats::lm(y[ok] ~ x[ok]), col = col.regres, ...) 
} 

dta <- mtcars
dta.r <- abs(cov(dta))
dta.col <- dmat.color(dta.r, colors = heat.colors(20, alpha = 0.9))
dta.o <- order.single(dta.r)
cpairs(dta, dta.o, panel.colors = dta.col, gap = 0.5, upper.panel = panel.regression)