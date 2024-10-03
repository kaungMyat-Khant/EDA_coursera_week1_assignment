getwd()
dir()
varname <- read.table("household_power_consumption.txt", 
                      header = T,
                      sep = ";", 
                      nrows = 1)
varname <- names(varname)
data <- read.table("household_power_consumption.txt",
                   sep = ";",
                   skip = 66637, 
                   nrows = 2880)
names(data) <- tolower(varname)
write.csv(data, "assignment_data.csv", row.names = F)
rm(list = ls())
