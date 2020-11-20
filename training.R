library(fitdistrplus)
library(actuar)

model.fit <- function(data, distribution, method){
    if((distribution == "gamma" || distribution == "weibull") && method == "mle"){
        model <- fitdist(data[data>0], distr = distribution, method = method, lower = c(0,0)) # start = list(scale = 1, shape = 1)
        return(model)
    }

    if(distribution == "weibull" && method == "mme"){
    memp  <-  function(x, order) mean(x^order) 
    model<- fitdist(data[data>0], "weibull", method = "mme", order=c(1, 2), memp=memp, lower = c(0, 0))
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
    #if(model$distname == "exp"){
        
    #}
}