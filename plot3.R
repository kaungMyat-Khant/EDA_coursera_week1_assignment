
## Read data
data <- read.csv("assignment_data.csv")

## Format date-time
data$time <- strptime(paste(data$date,data$time), 
                      "%d/%m/%Y %H:%M:%S", 
                      tz ="")
data$date <- as.Date(data$date,"%d/%m/%Y")

str(data)
data$time <- as.POSIXct(data$time)

png("plot3.png", height = 480, width = 480)
par(mar=c(4,4,2,2),cex = 0.8,)
plot(data$time, data$sub_metering_1, 
     xaxt = "n", type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$time, data$sub_metering_1, col = "black")
lines(data$time, data$sub_metering_2, col = "red")
lines(data$time, data$sub_metering_3, col = "blue")
axis.POSIXct(side = 1, at = c(min(data$time),median(data$time),max(data$time)), 
             labels = format(c(min(data$time),median(data$time),max(data$time)), 
                             "%a"))
legend("topright",
       col = c("black","red","blue"),lty = 1,cex = 0.8,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
