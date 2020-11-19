#import the csv file
data <- read.csv("data.csv")
print("Row CSV file looks like this: \n")
print(str(data))

# cleaning unncessary columns (Column X, X.1, X.2)
print(" Data After Cleaning: ")
data <- subset(data, select = -c(X, X.1, X.2))
print(str(data))

# Now creating a boolean vector which stores whether nth earthquake of dataframe is above 6 or not
is_large <- (data$MAG >= 6)
print(head(is_large))

# Adding one column in dataframe which stores whether the earthquka is >= 6 or not
data <- cbind(data, data.frame(is_large = is_large))
print(head(data))

# Now creating a new dataframe which stores the data as we require (in form of interevent time (Natural time))
final_data <- data.frame(DATE = character(), TIME = character(), LAT = double(), LON = double(), DEPTH = double(), DEPFIX = logical(), MAG = double(), Interevent_Count = integer())

#final_data <- rbind(final_data, c(data[1,],0))
print(head(final_data))
