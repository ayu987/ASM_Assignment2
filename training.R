library(fitdistrplus)
library(actuar)
library(distributions3)
#library(VGAM)

source("expweibull.R")

model.fit <- function(data, distribution, method){
    if((distribution == "gamma" || distribution == "weibull") && method == "mle"){
        model <- fitdist(data[data>0], distr = distribution, method = method, lower = c(0,0)) # start = list(scale = 1, shape = 1)
        return(model)
    }
    else if(distribution == "weibull" && method == "mme"){
    memp  <-  function(x, order) mean(x^order) 
    model<- fitdist(data[data>0], "weibull", method = "mme", order=c(1, 2), memp=memp, lower = c(0, 0))
    }
    else if(distribution == "invgauss"){
        model <- fitdist(data[data>0], "invgauss", start = list(mean = 5, shape = 1))
    }
    else if(distribution == "expweibull" && method=="mle"){
        model <- fitdist(data[data>0], distr = distribution, start = list(kappa = 1, lambda = 1, alpha=1), method = method)
    }
    else if(distribution =='chisq'){
        model <- fitdist(data[data>0], distr = distribution, start = list(ncp=1, df=1), lower=c(0, 0),  method = method)
    }
    else if(distribution == "invweibull" && method == "mme"){
    memp  <-  function(x, order) mean(x^order) 
    model<- fitdist(data[data>0], "invweibull", method = "mme", order=c(1, 2), memp=memp, lower = c(0, 0))
    }
    else if(distribution == "pareto" && method == "mme"){
    memp  <-  function(x, order) mean(x^order)
    model<- fitdist(data[data>0], "pareto", method = "mme", order=c(1, 2), memp=memp, lower = c(0, 0))
    }
    else if(distribution == "expweibull" && method == "mme"){
    memp  <-  function(x, order) mean(x^order)
    model<- fitdist(data[data>0], "expweibull", method = "mme", order=c(1, 2, 3), memp=memp, lower = c(0, 0, 0), start = list(kappa = 1, lambda = 1, alpha=1))
    }

    else model <- fitdist(data[data>0], distr = distribution, method = method)
    return(model)
}

ks_test <- function(data, model){
    #data = unique(data) #remove deuplicates
    if(model$distname == 'gamma'){
        return(ks.test(data, "pgamma", model$estimate["shape"], model$estimate["rate"]))
    }
    if(model$distname == "weibull"){
        return(ks.test(data, "pweibull", model$estimate["shape"], model$estimate["scale"]))
    }
    if(model$distname == "exp"){
        return(ks.test(data, "pexp", model$estimate["rate"]))
    }
    if(model$distname == "invgauss"){
        return(ks.test(data, "pinvgauss", model$estimate["mean"], model$estimate["shape"]))
    }
    if(model$distname == "lnorm"){
        return(ks.test(data, "plnorm", model$estimate["meanlog"], model$estimate["sdlog"]))
    }
    if(model$distname == "norm"){
        return(ks.test(data, "pnorm", model$estimate["mean"], model$estimate["sd"]))
    }
    if(model$distname == "invweibull"){
        return(ks.test(data, "pinvweibull", model$estimate["shape"], model$estimate["scale"]))
    }
    if(model$distname == "pareto"){
        return(ks.test(data, "ppareto", model$estimate["shape"], model$estimate["scale"]))
    }
    if(model$distname == "expweibull"){
        return(ks.test(data, "pexpweibull", model$estimate["lambda"], model$estimate["kappa"], model$estimate["alpha"]))
    }
    if(model$distname == "chisq"){
        return(ks.test(data, "pchisq", model$estimate["ncp"], model$estimate["df"]))
    }
    if(model$distname == "geom"){
        return(ks.test(data, "pgeom", model$estimate["prob"]))
    }
}