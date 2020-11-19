library(fitdistrplus)
library(actuar)
model.fit <- function(data, distribution, method){
    if((distribution == "gamma" || distribution == "weibull") && method == "mle"){
        model <- fitdist(data[data>0], distr = distribution, method = method, lower = c(0,0)) # start = list(scale = 1, shape = 1)
        return(model)
    }

    if(distribution == "weibull"){
        model <- fitdist(data[data>0], distr = distribution, method = method, lower = c(0,0), order=c(1,2),memp="momentfunc")
    }

    model <- fitdist(data[data>0], distr = distribution, method = method)
    return(model)
}
