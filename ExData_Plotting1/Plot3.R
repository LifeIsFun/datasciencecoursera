# Coursera - Exploratory Data Analysis
# Assignment 1

# Plot 3. Energy sub metering [kilowatts] vs time

# set working directory to where the files are
setwd("~/Desktop/RRef/DataScienceCoursera/Plotting")

# Read Data
data <- read.table("household_power_consumption.txt", sep = ';', header = T, na.strings="?")

# check class
sapply(data, class)          # all factor

# Change Date and Time Column to Date Type, create new column with Date/Time output
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), 
                                     format = "%d/%m/%Y %H:%M:%S"))

# Filter Dates for 2007-02-01 and 2007-02-02
data <- subset(data, (DateTime >= "2007-02-01") & (DateTime < "2007-02-03"))

# check if NA
sapply(data, function(x) sum(is.na(x)))          # 0, all good

# change class to numeric for col 7:9                               
data[, 7:9] <- lapply(data[ , 7:9], function(x) as.numeric(as.character(x)) )

#Open devise
png(file = "plot3.png", width = 480, height = 480, units = "px")

# Plot the graph
with(data,
     plot(data$DateTime, data$Sub_metering_1, 
          main = "", 
          type = 'n',
          xlab="", 
          ylab="Energy sub metering") )

lines(data$DateTime, data$Sub_metering_1, col = 'black')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend("topright",
       col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3"),
       lty=c(1,1), 
       lwd=c(1,1))

# Turn off device
dev.off()

# View plot
file.show('plot3.png')
