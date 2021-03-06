plot1 <- function() {
    data <- loadData()
    
    # Plot and save the plot
    png(filename = "plot1.png", width = 480, height = 480)
    hist(data$Global_active_power, breaks = 15, col = "red", 
         main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)")
    dev.off()
}

loadData <- function() {
    # We only want to load the data we need. So we calculate the rows to skip
    # by reading the first line and getting the first date in the data.
    first_row <- read.table(file = "../household_power_consumption.txt", 
                            nrows = 1, skip = 1, sep = ";", header = FALSE, 
                            stringsAsFactors = FALSE, 
                            na.strings = "?",
                            col.names = c("Date", "Time", "Global_active_power",
                                          "Global_reactive_power", "Voltage",
                                          "Global_intensity", "Sub_metering_1",
                                          "Sub_metering_2", "Sub_metering_3"))
    
    first_dt <- mapply(paste, first_row$Date, first_row$Time, USE.NAMES = FALSE)
    first_dt <- strptime(first_dt, format = "%d/%m/%Y %H:%M:%S")
    
    # The start date is the first date of data we want.
    start_dt <- strptime("01/02/2007", format = "%d/%m/%Y")
    
    rows_to_skip <- start_dt - first_dt # in days
    rows_to_skip <- as.double(rows_to_skip) * 24 * 60 + 1 # + 1 for header
    
    # The end date is the last day of data that we want.
    end_dt <- strptime("03/02/2007", format = "%d/%m/%Y")
    
    rows_to_read <- end_dt - start_dt # in days
    rows_to_read <- as.double(rows_to_read) * 24 * 60
    
    # Finally, read the data.
    data <- read.table(file = "../household_power_consumption.txt", 
                       nrows = rows_to_read, skip = rows_to_skip, sep = ";", 
                       header = FALSE, stringsAsFactors = FALSE, 
                       col.names = c("Date", "Time", "Global_active_power",
                                     "Global_reactive_power", "Voltage",
                                     "Global_intensity", "Sub_metering_1",
                                     "Sub_metering_2", "Sub_metering_3"))
    
    data$datetime <- with(data, mapply(paste, Date, Time, USE.NAMES = FALSE))
    data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")
    return(data)
}