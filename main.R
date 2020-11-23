source("data_transformation.R")
source("training.R")
options(warn = -1)
#library(VGAM)
#library(reliaR)
transform("data.csv", "_final_data.csv")
data = read.csv("_final_data.csv")
#print(data)
model = model.fit(data$Interevent_Count, "expweibull", "mle")  #weibull, gamma, exp, invgauss, lnorm, norm, 
                                                          #invweibull, pareto, chisq, geom, expweibull
#plot(model)
print("hello")
# summary(model)[2] = model$method # type of method used for parameter estimatin (mle/mme).
# summary(model)[6] = log likelihood
# summary(model)[7] = AIC
# summary(model)[8] = BIC

#print(ks_test(data$Interevent_Count, model))


#code for exponentiated exponential
# model <- vglm(Interevent_Count ~ 1, fam = expexpff, data = data[which(data$Interevent_Count>0),], trace = TRUE, maxit = 99)
# coef(fit, matrix = TRUE)
#   
#ks.gen.exp(as.integer(data[which(data$Interevent_Count>0),]$Interevent_Count), 0.742549412, 0.007017575, alternative = "two.sided")

#plot(sort(data$Interevent_Count), (1:n)/n, type = 's', ylim = c(0, 1), xlab = 'Sample Quantiles of Ozone', ylab = '', main = 'Empirical Cumluative Distribution\nOzone Pollution in New York')

distributions <- list("weibull", "gamma", "lnorm", "invweibull", "invgauss", "norm")
methods <- list("mle", "mme")
writeLines("\n\n")

# Training Exponential Weibull 

model = model.fit(data$Interevent_Count, "expweibull", "mle")
print(summary(model))
print(ks_test(data$Interevent_Count, model))
writeLines("\n\n")

model = model.fit(data$Interevent_Count/10, "exp", "mle")
model$estimate["rate"] = model$estimate["rate"]/10
print(summary(model))
print(ks_test(data$Interevent_Count, model))
writeLines("\n\n")

# Training Exponential Chi-Squared Distribution 
model = model.fit(data$Interevent_Count, "chisq", "mle")
print(summary(model))
print(ks_test(data$Interevent_Count, model))
writeLines("\n\n")

for(method in methods){
    for(distr in distributions){
        #plot(sort(data$Interevent_Count), (1:n)/n, type = 's', ylim = c(0, 1), 
        #            xlab = 'Interevent Count', ylab = '', main = 'Empirical Cumluative Distribution\n')
        model = model.fit(data$Interevent_Count, distr, method)
        print(summary(model))
        print(ks_test(data$Interevent_Count, model))
        writeLines("\n\n")
    }
}

model = model.fit(data$Interevent_Count, "exp", "mme")
model$estimate["rate"] = model$estimate["rate"]*10
print(summary(model))
print(ks_test(data$Interevent_Count, model))
writeLines("\n\n")