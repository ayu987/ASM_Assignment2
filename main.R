source("data_transformation.R")
source("training.R")
transform("data.csv", "_final_data.csv")

data = read.csv("_final_data.csv")
print(data$Interevent_Count/100)
model = model.fit(data$Interevent_Count, "weibull", "mle")
plot(model)
print(summary(model))
