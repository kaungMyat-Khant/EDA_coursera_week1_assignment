
## Read data
data <- read.csv("assignment_data.csv")
head(data)

## Format date-time
data$time <-  as.POSIXct(
    strptime(paste(data$date, data$time),
             format = "%d/%m/%Y %H:%M:%S")
)
str(data) 

## Plot 4
png("plot4.png",width = 480, height = 480)
par(mfcol = c(2,2))
plot(data$time, data$global_active_power, 
     type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     xaxt = "n")
axis.POSIXct(side = 1, at = c(min(data$time),median(data$time),max(data$time)), 
             labels = format(c(min(data$time),median(data$time),max(data$time)), 
                             "%a"))
plot(data$time, data$sub_metering_1, 
     xaxt = "n", type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$time, data$sub_metering_1, col = "black")
lines(data$time, data$sub_metering_2, col = "red")
lines(data$time, data$sub_metering_3, col = "blue")
axis.POSIXct(side = 1, at = c(min(data$time),median(data$time),max(data$time)), 
             labels = format(c(min(data$time),median(data$time),max(data$time)), 
                             "%a"))
legend("topright",
       col = c("black","red","blue"),lty = 1,cex = 0.5,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$time,data$voltage, type = "l", xlab = "datetime",
     ylab = "Voltage", xaxt = "n")
axis.POSIXct(side = 1, at = c(min(data$time),median(data$time),max(data$time)),
             labels = format(c(min(data$time),median(data$time),max(data$time)), 
                             "%a"))

plot(data$time, data$global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power", xaxt = "n")
axis.POSIXct(side = 1, at = c(min(data$time),median(data$time),max(data$time)),
             labels = format(c(min(data$time),median(data$time),max(data$time)),
                               "%a"))
dev.off()
