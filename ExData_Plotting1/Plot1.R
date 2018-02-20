# Coursera - Exploratory Data Analysis
# Assignment 1

# Plot 1. Frequenscy histogram of Global Active Power [kilowatts]

# set working directory to where the files are
setwd("~/Desktop/RRef/DataScienceCoursera/Plotting")

# Read Data
data <- read.table("household_power_consumption.txt", sep = ';', header = T, na.strings="?")

# check class
sapply(data, class)          # Date = factor, Global_active_power = factor

# Change Date Column to Date Type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter Dates for 2007-02-01 and 2007-02-02
data <- subset(data, (Date >= "2007-02-01") & (Date < "2007-02-03"))

# check if NA
sum(is.na(data$Global_active_power) )                # 0, all good

# change class to numeric for col 3:9                               
data[, 3:9] <- lapply(data[ , 3:9], function(x) as.numeric(as.character(x)) )

#Open devise
png(file = "plot1.png", width = 480, height = 480, units = "px")

# Plot the graph
hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")

# Turn off device
dev.off()

# View plot
file.show('plot1.png')
