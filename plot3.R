plot3 <- function() {
    source('loadData.R')
    data <- loadData()
    
    # Plot and save the plot
    png(filename = "plot3.png", width = 480, height = 480)
    with(data, plot(datetime, Sub_metering_1,
                    type = "l",
                    xlab = "",
                    ylab = "Energy sub metering"))
    with(data, lines(datetime, Sub_metering_2, col = "red"))
    with(data, lines(datetime, Sub_metering_3, col = "blue"))
    legend("topright", lty=1, colnames(data)[7:9], col = c("black", "red", "blue"))
    dev.off()
}