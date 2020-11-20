library(distributions3)
source("data_transformation.R")
source("training.R")
transform("data.csv", "_final_data.csv")

data = read.csv("_final_data.csv")
model = model.fit(data$Interevent_Count, "weibull", "mme")
plot(model)
#summary(model)[2] = model$method # type of method used for parameter estimatin (mle/mme).
#summary(model)[6] = log likelihood
#summary(model)[7] = AIC
#summary(model)[8] = BIC