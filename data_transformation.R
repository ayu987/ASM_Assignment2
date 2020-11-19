
transform <- function(input_file, output_file){
    #import the csv file
    data <- read.csv(input_file)

    # Now creating a new dataframe which stores the data as we require (in form of interevent time (Natural time))
    final_data <- data.frame(DATE = character(), TIME = character(), LAT = double(), LON = double(), 
        DEPTH = double(), MAG = double(), Interevent_Count = integer(), stringsAsFactors = FALSE)

    interevent_count = 0
    for (row in 1:nrow(data)){
        if(as.double(data[row, "MAG"]) < 6){
            interevent_count = interevent_count + 1
        }
        else{
            new_row <- list(data[row, "DATE"], data[row, "TIME"], as.double(data[row, "LAT"]), as.double(data[row, "LON"]), 
                as.double(data[row, "DEPTH"]), as.double(data[row, "MAG"]), interevent_count)
            final_data[nrow(final_data)+1, ] <- new_row
            interevent_count = 0
        }
    }

    write.csv(final_data,output_file)
}