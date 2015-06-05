plot2 <- function() {
    source('loadData.R')
    data <- loadData()
    
    # Plot and save the plot
    png(filename = "plot2.png", width = 480, height = 480)
    with(data, plot(datetime, Global_active_power,
                    type = "l",
                    xlab = "",
                    ylab = "Global Active Power (kilowatts)"))
    dev.off()
}