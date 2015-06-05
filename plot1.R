plot1 <- function() {
    source('loadData.R')
    data <- loadData()
    
    # Plot and save the plot
    png(filename = "plot1.png", width = 480, height = 480)
    hist(data$Global_active_power, breaks = 15, col = "red", 
         main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)")
    dev.off()
}