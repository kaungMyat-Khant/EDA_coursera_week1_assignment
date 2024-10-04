
## Read data
data <- read.csv("assignment_data.csv")

## Format date-time
data$time <- strptime(paste(data$date,data$time), 
                          "%d/%m/%Y %H:%M:%S", 
                          tz ="")
data$date <- as.Date(data$date,"%d/%m/%Y")

str(data)
data$time <- as.POSIXct(data$time)

## Plot 2
par(mar=c(4,4,2,2))
png(filename = "plot2.png", width = 480, height = 480)
plot(data$time, data$global_active_power, 
     type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     xaxt = "n")
axis.POSIXct(side = 1, at = c(min(data$time),median(data$time),max(data$time)), 
             labels = format(c(min(data$time),median(data$time),max(data$time)), 
                             "%a"))
dev.off()
