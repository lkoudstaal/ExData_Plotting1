# Read first line and calculate starting date
first_row <- read.table(file = "household_power_consumption.txt", nrows = 1, 
                        skip = 1, sep = ";", header = FALSE, 
                        stringsAsFactors = FALSE, 
                        col.names = c("Date", "Time", "Global_active_power",
                                      "Global_reactive_power", "Voltage",
                                      "Global_intensity", "Sub_metering_1",
                                      "Sub_metering_2", "Sub_metering_3"))
first_dt <- mapply(paste, first_row$Date, first_row$Time,
                        USE.NAMES = FALSE)
first_dt <- strptime(first_dt, format = "%d/%m/%Y %H:%M:%S")
start_dt <- strptime("01/02/2007", format = "%d/%m/%Y")
rows_to_skip <- start_dt - first_dt # in days
rows_to_skip <- as.double(rows_to_skip) * 24 * 60 + 1 # + 1 for header

end_dt <- strptime("03/02/2007", format = "%d/%m/%Y")
rows_to_read <- end_dt - start_dt # in days
rows_to_read <- as.double(rows_to_read) * 24 * 60

data <- read.table(file = "household_power_consumption.txt", nrows = rows_to_read, 
                        skip = rows_to_skip, sep = ";", header = FALSE, 
                        stringsAsFactors = FALSE, 
                        col.names = c("Date", "Time", "Global_active_power",
                                      "Global_reactive_power", "Voltage",
                                      "Global_intensity", "Sub_metering_1",
                                      "Sub_metering_2", "Sub_metering_3"))
#