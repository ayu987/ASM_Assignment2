source("data_transformation.R")
source("training.R")
library(VGAM)
library(reliaR)
transform("data.csv", "_final_data.csv")

data = read.csv("_final_data.csv")
model = model.fit(data$Interevent_Count, "expweibull", "mle")  #weibull, gamma, exp, invgauss, lnorm, norm, 
                                                          #invweibull, pareto, chisq, geom, expweibull
#plot(model)
# summary(model)[2] = model$method # type of method used for parameter estimatin (mle/mme).
# summary(model)[6] = log likelihood
# summary(model)[7] = AIC
# summary(model)[8] = BIC

print(ks_test(data$Interevent_Count, model))


#code for exponentiated exponential
# model <- vglm(Interevent_Count ~ 1, fam = expexpff, data = data[which(data$Interevent_Count>0),], trace = TRUE, maxit = 99)
# coef(fit, matrix = TRUE)
# Coef(fit)
# ks.gen.exp(as.integer(data[which(data$Interevent_Count>0),]$Interevent_Count), 0.742549412, 0.007017575, alternative = "two.sided")
