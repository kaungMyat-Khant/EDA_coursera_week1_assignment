## Read data
data <- read.csv("assignment_data.csv")
head(data)

## Missing value
lapply(data, function(x) sum(grepl("\\?",x)))
### No missing values marked by "?"

## Plot 1 histogram
png(filename = "plot1.png", width = 480, height = 480)
par(mar = c(5,5,3,1))
with(data, hist(global_active_power, 
                col = "red1", 
                xlab = "Global Active Power (kilowatts)",
                main = "Global Active Power"))
dev.off()
