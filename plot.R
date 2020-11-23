data = read.csv("_final_data.csv")
source("expexp.R")
source("expweibull.R")
n = nrow(data)
plot(sort(data$Interevent_Count), (1:n)/n, type = 's', ylim = c(0, 1), 
            xlab = 'Interevent Count', ylab = 'Cumulative Probability (CDF)', main = 'Plot for Cumluative Distribution\n')

x = 1:3000
y = pexpexp(x, shape = 0.865218342, rate = 0.001209602)
lines(x, y, col="red",lty=1)

y = pweibull(x, shape = 0.9227408, scale = 725.5583689)
lines(x, y, col="green",lty=2)

y = pgamma(x, shape = 0.874965849, rate = 0.001162036)
lines(x, y, col="pink",lty=3)

y = pexpweibull(x, kappa = 2.2443363, lambda = 1659.4469166, alpha = 0.2895466)
lines(x, y, col="blue",lty=4)

legend(1200, 0.3, legend=c("Actual Data", "Exponentiated Exponential","Weibull","Gamma", "Exponentiated Weibull"), col=c("black","red","green","pink", "blue"),
                                    ncol = 1, lty = c(1,1,2,3,4), pch = c(".",".", ".", ".","."))